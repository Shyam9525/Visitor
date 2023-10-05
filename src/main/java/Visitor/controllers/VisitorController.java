package Visitor.controllers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Visitor.VisitorApplication;
import Visitor.login.User;
import Visitor.login.UserRepository;
import Visitor.models.Department;
import Visitor.models.HostName;
import Visitor.models.IdType;
import Visitor.models.Purpose;
import Visitor.models.VisitorDetails;
import Visitor.repositorys.DepartmentRepository;
import Visitor.repositorys.HostNameRepository;
import Visitor.repositorys.IdTypeRepository;
import Visitor.repositorys.PurposeRepository;
import Visitor.repositorys.VisitorDetailsRepository;
import Visitor.services.VisitorDetailsService;



@Controller
public class VisitorController {
	
	private static final Logger LOG = LogManager.getLogger(VisitorApplication.class);
	
	@Autowired
	VisitorDetailsService visitorDetailsService;
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	IdTypeRepository idTypeRepository;
	
	@Autowired
	DepartmentRepository departmentRepository;
	
	@Autowired
	HostNameRepository hostNameRepository;
	
	@Autowired
	PurposeRepository purposeRepository;
	

	
	@Autowired
	VisitorDetailsRepository visitorDetailsRepository;
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	@Value("${imagePath}")
	public String ImageFolderLocation;
	
	@Value("${companyName}")
	public String companyName;
	
	@Value("${toEmailsId}")
	public String toEmailsId;
	
	@Value("${ccEmailsId}")
	public String ccEmailsId;
	
	
	
	@PostMapping
	
	@RequestMapping(value = { "/home"})
	public ModelAndView home(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("############### Inside home ##############");
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           request.getSession().setAttribute("companyName", companyName);
	           modelMap.addAttribute("loginUser", loginUser);
	           LOG.info("############### login User name ##############: "+loginUser.getFirstName()+new Date());
	           LOG.info("############### login User Role ##############: "+loginUser.getUserRole());
			   /*Integer pendingList = visitorDetailsService.pendingListForApr(loginUser);
			   mv.addObject("approvalPendingForYou", pendingList);*/
			   mv.setViewName("home");
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@GetMapping

	@RequestMapping(value = { "/visitorRegistration"})
	public ModelAndView visitorRegistrationLoadPage(Principal principal,HttpServletRequest request,Model modelMap,VisitorDetails visitorDetails) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
	    	  
	           User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           LOG.info("############### visitorRegistrationLoadPage ##############:"+loginUser.getFirstName());
			   mv.setViewName("visitorRegistration");
			   if(loginUser.getUserRole().equalsIgnoreCase("APPROVER")){
				   mv.setViewName("home");
				   mv.addObject("msg", "Your are Not Authorised to Register Visitors");
			   }else{
				   
				   mv.addObject("registrationPageOpen",false);
	               mv = loadAllMasterTableData(mv);
			   }
			  
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	
	@RequestMapping(value = { "/getOldVisitData"})
	public ModelAndView getOldVisitData(Principal principal,HttpServletRequest request,Model modelMap,VisitorDetails visitorDetails) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
			   User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           LOG.info("############### visitorRegistrationLoadPage ##############:"+loginUser.getFirstName());
	    	   String searchId = request.getParameter("serchId");
	    	   
	    	   if(null!=searchId){
	    		/*serch call for old visitor deails */  
	    		   visitorDetails = visitorDetailsRepository.findByVisitorMobileNo(searchId);
	    		   if(null==visitorDetails){
	    			   VisitorDetails visitorDetailsTemp = new VisitorDetails();
	    			   visitorDetailsTemp.setVisitorMobileNo(searchId);
	    			   mv.addObject("visitorDetails", visitorDetailsTemp);
	    		   }else{
	    			   mv.addObject("visitorDetails", visitorDetails);
	    		   }
	    		  
	    	   }
		      
			   mv.setViewName("visitorRegistration");
			   mv.addObject("registrationPageOpen",true);
               mv = loadAllMasterTableData(mv);
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	private ModelAndView loadAllMasterTableData(ModelAndView mv) {
		
		List<IdType> idTypeList = (List<IdType>) idTypeRepository.findAll();
		mv.addObject("idTypeList", idTypeList);
		
		List<Department> departmentTypeList = (List<Department>) departmentRepository.findAll();
		mv.addObject("departmentTypeList", departmentTypeList);
		
		List<HostName> hostNameList = (List<HostName>) hostNameRepository.findAll();
		mv.addObject("hostNameList", hostNameList);
		
		List<Purpose> purposeList = (List<Purpose>) purposeRepository.findAll();
		mv.addObject("purposeList", purposeList);
		
		List<String> visitDurationList = new ArrayList<String>();
		visitDurationList.add("30 Minuts");
		for (int i = 1; i < 24; i++) {
			
			visitDurationList.add(String.valueOf(i));
		}
		mv.addObject("visitDurationList", visitDurationList);
		
		List<String> vehicleType = new ArrayList<String>();
		
		for (int i = 2; i < 24; i++) {
			
			vehicleType.add(String.valueOf(i));
		}
		mv.addObject("vehicleType", vehicleType);
		
		return mv;
	}

	@RequestMapping(value = { "/visitorRegistration"},params="saveVisitorDetails")
	public ModelAndView visitorRegistrationSave(Principal principal,HttpServletRequest request,Model modelMap,VisitorDetails visitorDetails,
			@RequestParam(value="file",required=false) MultipartFile file) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
	    	 
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           modelMap.addAttribute("loginUser", loginUser);
	           
	           if(null!=request.getParameter("txn_flag") && request.getParameter("txn_flag").equalsIgnoreCase("save")){
	        	 
	        	   visitorDetails = visitorDetailsService.saveVisitorDetails(visitorDetails,request,ImageFolderLocation);
	           }
	           mv.addObject("visitorDetails", visitorDetails);
	           LOG.info("Save status>>>>>>>>>>>"+visitorDetails.getMsg());
	           if(visitorDetails.getMsg().equalsIgnoreCase("saveDone")){
	        	   mv.setViewName("visitorRegistrationSuccess");
	           }else{
	        	  
	        	   mv.setViewName("visitorRegistration");
	           }
			   
			  
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@RequestMapping(value = { "/print"})
	public ModelAndView printVisitorDetails(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("############### viewVisitorDetails ##############");
		if(principal!=null)
	       {
	    	 
	           User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           List<VisitorDetails> visitorDetailsList = visitorDetailsService.findAllVisitorDetails();
			   VisitorDetails visitor = visitorDetailsService.findVisitorDetailsByVisitorId(Integer.parseInt(request.getParameter("visitorId")));
			   mv.addObject("visitorDetailsList", visitorDetailsList);
			   mv.setViewName("visitorDetails");
             
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}

	
	
	@RequestMapping(value = { "/viewVisitorDetails"})
	public ModelAndView viewVisitorDetails(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("############### viewVisitorDetails ##############");
		if(principal!=null)
	       {
	    	 
	           User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
			   List<VisitorDetails> visitorDetailsList = visitorDetailsService.findAllVisitorDetails();
			   mv.addObject("visitorDetailsList", visitorDetailsList);
			   mv.setViewName("visitorDetails");
             
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}

	@RequestMapping(value = { "/viewAndModify"})
	public ModelAndView viewAndModify(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("############### viewAndModify ##############");
		if(principal!=null)
	       {
	    	 
	           User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
			   VisitorDetails visitorDetails = visitorDetailsService.findVisitorDetailsByVisitorId(Integer.parseInt(request.getParameter("visitorId")));
			   mv.addObject("visitorDetails", visitorDetails);
			   mv.setViewName("viewModifyVisitor");
			   mv = loadAllMasterTableData(mv);
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	

	@RequestMapping(value = { "/viewAndModify"},params="modify")
	public ModelAndView updateVisitorDetails(Principal principal,HttpServletRequest request,Model modelMap,VisitorDetails visitorDetails) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("############### modifyVisitorDetails ##############");
		if(principal!=null)
	       {
	    	 
	           User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
			   visitorDetails = visitorDetailsService.updateVisitorDetails(visitorDetails);
			   if(visitorDetails.getMsg().equalsIgnoreCase("updateDone")){
				   mv.addObject("msg", "Visitor Details Updated"); 
			   }
			   mv.addObject("visitorDetails", visitorDetails);
			   mv.setViewName("viewModifyVisitor");
			   mv = loadAllMasterTableData(mv);
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@RequestMapping(value = { "/deleteVisitorDetails"})
	public ModelAndView deleteVisitorDetails(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("############### modifyVisitorDetails ##############");
		if(principal!=null)
	       {
	    	 
	           User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
			   String msg = visitorDetailsService.deleteVisitorDetails(Integer.parseInt(request.getParameter("visitorId")));
			   if(msg.equalsIgnoreCase("deleteDone")){
				   mv.addObject("msg", "Visitor Details Deleted"); 
			   }
			   List<VisitorDetails> visitorDetailsList = visitorDetailsService.findAllVisitorDetails();
			   mv.addObject("visitorDetailsList", visitorDetailsList);
			   mv.setViewName("visitorDetails");
			  
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@RequestMapping(value = { "/checkOut"})
	public ModelAndView chechOutLoad(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("########### Inside checkOut ###################");
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
			   System.out.println("############### login User name ##############:"+loginUser.getFirstName());
			   System.out.println("############### login User Role ##############:"+loginUser.getUserRole());
			   mv.setViewName("checkOut");
			   mv.addObject("showDetail","N");
	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@RequestMapping(value = { "/searchDeatils"})
	public ModelAndView searchVisitorDetails(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("########### Inside searchDeatils ###################");
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           VisitorDetails visitorDetails = visitorDetailsService.findVisitorDetailsByVisitorId(Integer.parseInt(request.getParameter("visitorId")));
			   mv.addObject("visitorDetails", visitorDetails);
			   if(null==visitorDetails){
				   mv.addObject("msg", "Record not found for given Visitor ID");
			   }else{
				   mv.addObject("showDetail","Y");
			   }
			   mv.setViewName("checkOut");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@RequestMapping(value = { "/chechOutVisitorDetails"},method=RequestMethod.GET)
	public ModelAndView chechOutVisitor(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
	    ModelAndView mv = new ModelAndView();
	    LOG.info("########### Inside chechOutVisitorDetails ###################");
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           VisitorDetails visitorDetails = visitorDetailsService.findVisitorDetailsByVisitorId(Integer.parseInt(request.getParameter("visitorId")));
	           visitorDetails =visitorDetailsService.chechOutVisitor(visitorDetails,request.getParameter("remark"));
			   mv.addObject("visitorDetails", visitorDetails);
			   if(visitorDetails.getMsg().equalsIgnoreCase("checkOutDone")){
				   mv.addObject("msg", "Check-Out Successfully");
				   mv.addObject("showDetail","Y");
			   }
			   mv.setViewName("checkOut");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;


	}
	
	
	
	
	@RequestMapping(value = { "/visitorDashBoard"})
	public ModelAndView visitorDashBoard(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		LOG.info("########### Inside visitorDashBoard ###################");
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	          
	           mv = visitorDashboardData(mv);
	          
			   mv.setViewName("visitorDashBoard");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}

	private ModelAndView visitorDashboardData(ModelAndView mv) {
		
		 List<VisitorDetails> pendingVisitorsForApproval = visitorDetailsRepository.findByStatus("P");
		 List<VisitorDetails> pendingVisitorsForCheckOut = visitorDetailsRepository.findByStatus("CI");
		 List<VisitorDetails> approvedCheckOutVisitors = visitorDetailsRepository.findByStatus("CO");
		 mv.addObject("pendingVisitorsForApproval", pendingVisitorsForApproval);
		 mv.addObject("pendingVisitorsForCheckOut", pendingVisitorsForCheckOut);
		 mv.addObject("approvedCheckOutVisitors", approvedCheckOutVisitors);
		return mv;
	}
	
	
	@RequestMapping(value = { "/approve"})
	public ModelAndView approve(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		LOG.info("########### Inside approve ###################");
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	          
	           mv = pendingVisitorForApprove(mv,loginUser);
	          
			   mv.setViewName("approval");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}

	private ModelAndView pendingVisitorForApprove(ModelAndView mv, User loginUser) {
		//
		HostName hostName = hostNameRepository.findByUserId(loginUser);
		
		List<VisitorDetails> pendingVisitorsForApproval = visitorDetailsRepository.findByStatusAndHostName("P", hostName);
		mv.addObject("pendingVisitorsForApproval", pendingVisitorsForApproval);
		return mv;
	}
	
	@RequestMapping(value = { "/approveVisitor"})
	public ModelAndView approveVisitor(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		LOG.info("########### Inside approveVisitor ###################");
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           Integer visitorId = Integer.parseInt(request.getParameter("visitorId").trim());
	           boolean approve = visitorDetailsService.approvePendingVisitor(visitorId);
	           if(approve==true){
	        	   mv.addObject("msg", "Approve Done");
	           }else{
	        	   mv.addObject("msg", "Not Approve"); 
	           }
	           mv = visitorDashboardData(mv);
			   mv.setViewName("visitorDashBoard");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}

	@RequestMapping(value = { "/checkOutVisitor"})
	public ModelAndView checkOutVisitor(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		LOG.info("########### Inside checkOutVisitor ###################");
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           Integer visitorId = Integer.parseInt(request.getParameter("visitorId").trim());
	           boolean approve = visitorDetailsService.checkOutVisitor(visitorId);
	           if(approve==true){
	        	   mv.addObject("msg", "Checked Out  Done");
	           }else{
	        	   mv.addObject("msg", "Checked Out"); 
	           }
	           mv = visitorDashboardData(mv);
	          
			   mv.setViewName("visitorDashBoard");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	@RequestMapping(value = { "/rejectVisitor"})
	public ModelAndView rejectVisitor(Principal principal,HttpServletRequest request,Model modelMap) throws IOException {
		LOG.info("####################### Inside Reject visitor screen ################################");
		ModelAndView mv = new ModelAndView();
		
		if(principal!=null)
	       {
	           Visitor.login.User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
	           request.getSession().setAttribute("loginUser", loginUser);
	           
	           modelMap.addAttribute("loginUser", loginUser);
	           Integer visitorId = Integer.parseInt(request.getParameter("visitorId").trim());
	           boolean reject = visitorDetailsService.rejectVisitor(visitorId);
	           if(reject==true){
	        	   mv.addObject("msg", "Rejected  Done");
	           }else{
	        	   mv.addObject("msg", "Not Rejected"); 
	           }
	           mv = visitorDashboardData(mv);
	          
			   mv.setViewName("visitorDashBoard");

	       }
	       else
	       {
	    	   mv.setViewName("error");
	       }
		
		
		return mv;

	}
	
	
	
	@GetMapping("/viewImage")
	public void downloadPDF(HttpServletRequest request, HttpServletResponse response)
		    throws IOException{
		LOG.info("####################### Inside viewImage ################################");
		 response.setContentType("image/jpeg");  
		    ServletOutputStream out;  
		    out = response.getOutputStream();  
		   // String path = ImageFolderLocation;
		    FileInputStream fin = new FileInputStream(ImageFolderLocation+"/"+request.getParameter("id"));  
		      
		    BufferedInputStream bin = new BufferedInputStream(fin);  
		    BufferedOutputStream bout = new BufferedOutputStream(out);  
		    int ch =0; ;  
		    while((ch=bin.read())!=-1)  
		    {  
		    bout.write(ch);  
		    }  
		      
		    bin.close();  
		    fin.close();  
		    bout.close();  
		    out.close();  
		}
	

	public String[] toEmailIds() 
	{
		
	     String[] emailIds = toEmailsId.split("[,]"); 
		 return emailIds;
	}
	
	public String[] ccEmailIds() 
	{
		
	     String[] emailIds = ccEmailsId.split("[,]"); 
		 return emailIds;
	}
	
	void sendEmail() throws AddressException {

		
        SimpleMailMessage msg = new SimpleMailMessage();
        
        msg.setTo(toEmailIds());
        msg.setCc(ccEmailIds());
        msg.setSubject("Closing Stock Till:"+LocalDate.now());
        
        msg.setText("Closing Stock\n\n"
        		+ "Atta:20 mt"
        		+ "\nThanks & Regards,\n\nSGPL Visitor Managment");
        javaMailSender.send(msg);

    }
	@GetMapping("/test")
	public String test() throws AddressException{
		
		sendEmail();
		return "sent";
	}
	
}
