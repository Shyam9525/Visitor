package Visitor.services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Visitor.login.User;
import Visitor.models.HostName;
import Visitor.models.VisitorDetails;
import Visitor.repositorys.HostNameRepository;
import Visitor.repositorys.VisitorDetailsRepository;

@Service
public class VisitorDetailsService {

	@Autowired
	VisitorDetailsRepository visitorDetailsRepository;
	
	@Autowired
	HostNameRepository hostNameRepository;
	
	public VisitorDetails saveVisitorDetails(VisitorDetails visitorDetails,HttpServletRequest request,String imageFolderLocation) {
		
		String imageName = saveImageIntoFolder(request,imageFolderLocation);
		System.out.println(imageName);
		try {
			visitorDetails.setVisitDate(new Date());
			visitorDetails.setVisitDateAndTime(new Date());
			visitorDetails.setStatus("P");
			if(null!=imageName && !imageName.equals("")){
				
				visitorDetails.setImageName(imageName);
			}else{
				visitorDetails.setImageName("NA");
			}
			visitorDetails = visitorDetailsRepository.save(visitorDetails);
			visitorDetails.setMsg("saveDone");
			
		} catch (Exception e) {
			
			visitorDetails.setMsg("error::"+e.getMessage());
		}
		
		return visitorDetails;
	}

	private String saveImageIntoFolder(HttpServletRequest request,String imageFolderLocation) {

	 String imageName ="img_"+System.currentTimeMillis()+".";
	 String base64String = request.getParameter("base64String");
		 String[] strings = base64String.split(",");
	        String extension;
	        switch (strings[0]) {//check image's extension
	            case "data:image/jpeg;base64":
	                extension = "jpeg";
	                break;
	            case "data:image/png;base64":
	                extension = "png";
	                break;
	            default://should write cases for more images types
	                extension = "jpg";
	                break;
	        }
	        //convert base64 string to binary data
	        byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);
	        String path = imageFolderLocation+imageName+extension;
	        File file = new File(path);
	        try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file))) {
	            outputStream.write(data);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		return imageName+extension;
	}

	public List<VisitorDetails> findAllVisitorDetails() {
		
		return (List<VisitorDetails>) visitorDetailsRepository.findAll();
	}

	public VisitorDetails findVisitorDetailsByVisitorId(int visitorId) {
		
		return visitorDetailsRepository.findByVisitorId(visitorId);
	}

	public VisitorDetails updateVisitorDetails(VisitorDetails visitorDetails) {
		
		VisitorDetails visitorDetailsUpdate = visitorDetailsRepository.findByVisitorId(visitorDetails.getVisitorId());
		try {
			
			visitorDetailsUpdate = visitorDetails;
			visitorDetailsUpdate = visitorDetailsRepository.save(visitorDetailsUpdate);
			visitorDetailsUpdate.setMsg("updateDone");
		} catch (Exception e) {
			
			visitorDetailsUpdate.setMsg("error>>"+e.getMessage());
		}
		return visitorDetailsUpdate;
	}

	public String deleteVisitorDetails(int visitorId) {
		
		VisitorDetails visitorDetails = visitorDetailsRepository.findByVisitorId(visitorId);
		try {
			visitorDetailsRepository.delete(visitorDetails);
			return "deleteDone";
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		
	}

	public VisitorDetails chechOutVisitor(VisitorDetails visitorDetails, String remark) {

		try {
			visitorDetails.setRemark(remark);
			visitorDetails.setCheckOutDate(new Date());
			visitorDetails.setCheckOutDateAndTime(new Date());
			visitorDetails.setStatus("CO");
			visitorDetails =visitorDetailsRepository.save(visitorDetails);
			visitorDetails.setMsg("checkOutDone");
		} catch (Exception e) {
			visitorDetails.setMsg("error:"+e.getMessage());
		}
		return visitorDetails;
	}

	public boolean approvePendingVisitor(Integer visitorId) {
		boolean status = false;
		try {
			
			VisitorDetails visitorDetails = visitorDetailsRepository.findByVisitorId(visitorId);
			if(null!=visitorDetails){
				visitorDetails.setStatus("CI");//check IN
				visitorDetails.setCheckInOrApprovalDate(new Date());
				visitorDetails.setCheckInOrApprovalDateTime(new Date());
				visitorDetailsRepository.save(visitorDetails);
				status = true;
			}
		
		} catch (Exception e) {
			status = false;
		}
		return status;
	}

	public boolean checkOutVisitor(Integer visitorId) {
		boolean status = false;
			try {
			
			VisitorDetails visitorDetails = visitorDetailsRepository.findByVisitorId(visitorId);
			if(null!=visitorDetails){
				visitorDetails.setStatus("CO");//check IN
				visitorDetails.setCheckOutDate(new Date());
				visitorDetails.setCheckOutDateAndTime(new Date());
				visitorDetailsRepository.save(visitorDetails);
				status = true;
			}
		
		} catch (Exception e) {
			status = false;
		}
		return status;
	}

	public Integer pendingListForApr(User loginuse) {
		Integer list = 0;
		HostName hostId = hostNameRepository.findByUserId(loginuse);
		if(null!=hostId){
			list = visitorDetailsRepository.getPendingList(hostId);	
		}
		
		return list;
	}

	public boolean rejectVisitor(Integer visitorId) {
		boolean status = false;
		try {
		
		VisitorDetails visitorDetails = visitorDetailsRepository.findByVisitorId(visitorId);
		if(null!=visitorDetails){
			visitorDetails.setStatus("R");//reject
			visitorDetails.setRejectDate(new Date());
			visitorDetails.setRejectDateAndTime(new Date());
			visitorDetailsRepository.save(visitorDetails);
			status = true;
		}
	
	} catch (Exception e) {
		status = false;
	}
	return status;
	}

}
