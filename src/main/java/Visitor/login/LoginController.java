package Visitor.login;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Visitor.models.Department;
import Visitor.models.HostName;
import Visitor.models.IdType;
import Visitor.models.Purpose;
import Visitor.repositorys.DepartmentRepository;
import Visitor.repositorys.HostNameRepository;
import Visitor.repositorys.IdTypeRepository;
import Visitor.repositorys.PurposeRepository;

@Controller
public class LoginController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	IdTypeRepository idTypeRepository;
	
	@Autowired
	DepartmentRepository departmentRepository;
	
	@Autowired
	PurposeRepository purposeRepository;
	
	@Autowired
	HostNameRepository hostNameRepository;
	
	
	 @RequestMapping(value={"/login","/"})
	public ModelAndView login(){
		
		 ModelAndView mv = new ModelAndView();
		 mv.setViewName("login");
		 List<User> userList =userRepository.findAll();
		 List<IdType> idtypeList = (List<IdType>) idTypeRepository.findAll();
		 List<Department> departmentList = (List<Department>) departmentRepository.findAll();
		 List<Purpose> purposeList = (List<Purpose>) purposeRepository.findAll();
		 List<HostName> hostNameList = (List<HostName>) hostNameRepository.findAll();
		 
		    if (userList.isEmpty()) 
		    {
				User user1 = new User();
				user1.setFirstName("Chandrasekhar");
				user1.setLastName("Yadav");
				user1.setUserName("admin");
				user1.setUserRole("SUPERADMIN");
				user1.setActive(true);
				user1.setPassword("admin");
				user1.setMobile("9123479070");
				user1.setEmail("er.chandrasekharyadav@gmail.com");
				userRepository.save(user1);
	        }
		    if(idtypeList.isEmpty()) {
		    	IdType obj = new IdType();
		    	obj.setName("DUMMY ID");
		    	idTypeRepository.save(obj);
		    }
		    if(departmentList.isEmpty()) {
		    	
		    	Department obj = new Department();
		    	obj.setName("ADMIN");
		    	departmentRepository.save(obj);
		    }
		    if(purposeList.isEmpty()) {
		    	
		    	Purpose obj = new Purpose();
		    	obj.setName("CAMPUS VISIT");
		    	purposeRepository.save(obj);
		    }
		    if(hostNameList.isEmpty()) {
		    	HostName obj = new HostName();
		    	obj.setName("ADMIN");
		    	hostNameRepository.save(obj);
		    }
		    
		    
			return mv;
	
	 }
	 
	 
	 @RequestMapping(value="/profile",method=RequestMethod.GET)
		public ModelAndView profile(HttpServletRequest request,ModelMap model,Principal principal)
		{
			
			
			    ModelAndView mv = new ModelAndView();
			    
			    User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
			    model.addAttribute("loginUser", loginUser);
			    
				mv.setViewName("profile");
			
			return mv;
		}
	 
	 @RequestMapping(value={"/profile"},method=RequestMethod.POST)
		public ModelAndView updateProfile(HttpServletRequest request,ModelMap model,Principal principal)
		{   
			ModelAndView mv = new ModelAndView();
			
			User user = userRepository.findByUserId(Integer.parseInt(request.getParameter("id")));
			
			String fName = request.getParameter("firstName");
			String lName = request.getParameter("lastName");
			String userName = request.getParameter("userName");
	     	
	     	
	     	String password = request.getParameter("password");
	     	String mobile = request.getParameter("mobile");
	     	String email = request.getParameter("email");
	     	
			
			user.setFirstName(fName);
			user.setLastName(lName);
			user.setUserName(userName);
			user.setMobile(mobile);
		    user.setPassword(password);
			user.setEmail(email);
			user.setActive(true);
			
			User u = userRepository.save(user);
			model.addAttribute("newUser", u);
			model.addAttribute("msg", "User Updated successfully");
			System.out.println("#############################  User Updated successfully #############################");
			
			 User loginUser = userRepository.findByUserNameAndActive(principal.getName(), true);
			    model.addAttribute("loginUser", loginUser);
			
			mv.setViewName("profile");
					
			return mv;
		}
		
	 @RequestMapping(value="/getAllUser",method=RequestMethod.GET)
		public ModelAndView getAllUser(HttpServletRequest request,ModelMap model)
		{
			    ModelAndView mv = new ModelAndView();
				mv.setViewName("userList");
				List<User> userList = userRepository.getAllUser();
				model.put("userList",userList);
			
			return mv;
		}
	 
	 @RequestMapping(value="/changeStatusUser",method=RequestMethod.GET)
		public ModelAndView changeStatusUser(HttpServletRequest request,ModelMap model)
		{
			    ModelAndView mv = new ModelAndView();
				mv.setViewName("user");
				User user = userRepository.findByUserId(Integer.parseInt(request.getParameter("userId")));
				if(user.getUserRole().equalsIgnoreCase("SUPERADMIN")){
					model.put("msg","You Cannot Change super Admin status");
				}else{
					if(user.isActive()==true){
						user.setActive(false);
						model.put("msg","User  Status Change ");
					}else{
						user.setActive(true);
						model.put("msg","User  Status Change  ");
					}
					
					userRepository.save(user);
				}
				
				List<User> userList = userRepository.getAllUser();
				model.put("userList",userList);
			
			return mv;
		}
	 
	 
	 @RequestMapping(value="/updateUser",method=RequestMethod.GET)
		public ModelAndView updateUser(HttpServletRequest request,ModelMap model)
		{
			    ModelAndView mv = new ModelAndView();
				mv.setViewName("user");
				User user = userRepository.findByUserId(Integer.parseInt(request.getParameter("userId")));
				model.put("user",user);
				model.put("updateFlag",true);
				List<User> userList = userRepository.getAllUser();
				model.put("userList",userList);
			
			return mv;
		}
	 
	 
	 @RequestMapping(value="/deleteUser",method=RequestMethod.GET)
		public ModelAndView deleteUser(HttpServletRequest request,ModelMap model)
		{
			    ModelAndView mv = new ModelAndView();
				mv.setViewName("user");
				User user = userRepository.findByUserId(Integer.parseInt(request.getParameter("userId")));
				if(user.getUserRole().equalsIgnoreCase("SUPERADMIN")){
					model.put("msg","You Cannot delete SUPER ADMIN ");
				}else{
					userRepository.delete(user);
					model.put("msg","User deleted  ");
				}
				
				
				List<User> userList = userRepository.getAllUser();
				model.put("userList",userList);
			
			return mv;
		}
	 
	 
	 @RequestMapping(value={"/register"},method=RequestMethod.POST)
		public ModelAndView register(HttpServletRequest request,ModelMap model)
		{   
			ModelAndView mv = new ModelAndView();
			String fName = request.getParameter("firstName");
			String lName = request.getParameter("lastName");
			String userName = request.getParameter("userName");
	     	
	     	
	     	String password = request.getParameter("password");
	     	String mobile = request.getParameter("mobile");
	     	String email = request.getParameter("email");
	     	String userRole = request.getParameter("userRole");
			User user = new User();
			user.setFirstName(fName);
			user.setLastName(lName);
			user.setUserName(userName);
			user.setMobile(mobile);
			user.setPassword(password);
			user.setEmail(email);
			user.setActive(true);
			user.setUserRole(userRole);
			try {
				
				User u = userRepository.save(user);
				model.addAttribute("newUser", u);
				System.out.println("User Created successfully and his credential is below");
				System.out.println("userName:"+u.getUserName());
				System.out.println("password:"+u.getPassword());
				model.addAttribute("msg", "User Created");
			} catch (Exception e) {
				model.addAttribute("msg", "Faild to create user "+e.getMessage());
			}
			List<User> userList = userRepository.getAllUser();
			model.put("userList",userList);
			mv.setViewName("user");
					
			return mv;
		}
		
		
	 @RequestMapping(value={"/register"},method=RequestMethod.GET)
		public ModelAndView registerNewuser(HttpServletRequest request,ModelMap model)
		{   
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("user");
					
			return mv;
		}
		
		
	 
}
