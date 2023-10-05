package Visitor.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="visitorDetails",schema="visitor")
@SequenceGenerator(name="visitorDetails_sequence",sequenceName="visitor.visitorDetails_sequence",initialValue= 1,allocationSize =1)
public class VisitorDetails {
	
	@Id
	@GeneratedValue(generator="visitorDetails_sequence",strategy=GenerationType.SEQUENCE)
	@Column(nullable = false)
	private int visitorId;
	
	@Column(name="visitDate")
	@Temporal(TemporalType.DATE)
	private Date visitDate;
	
	@Column(name="visitDateAndTime")
	private Date visitDateAndTime;
	
	private String visitorName;
	
	private String visitorMobileNo;
	
	@JoinColumn(name = "idType", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
	private IdType idType;
	
	private String idNumber;
	
	private String emailId;
	
	private String comingCity;
	
	@JoinColumn(name = "department", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
	private Department department;
	
	@JoinColumn(name = "hostName", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
	private HostName hostName;
	
	@JoinColumn(name = "purpose", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
	private Purpose purpose;
	
	private String address;
	
	private String imageName;
	
	private String msg;
	
	private String visitDuration;
	
	@Column(name="check_in_or_approval_date")
	@Temporal(TemporalType.DATE)
	private Date checkInOrApprovalDate;
	
	private Date checkInOrApprovalDateTime;
	
	
	@Column(name="checkOutDate")
	@Temporal(TemporalType.DATE)
	private Date checkOutDate;
	
	private Date checkOutDateAndTime;
	
	private String status;//P for pending ,CI for checked in and CO for check-out
	
	
	
	
	private String remark;
	
	
	private String otherDevice;
	
	private String laptopDetails;
	private String vehicleType;
	private String vehicleDetails;
	
	@Column(name="rejectDate")
	@Temporal(TemporalType.DATE)
	private Date rejectDate;
	
	private Date rejectDateAndTime;
	
	
	public VisitorDetails() {
		// TODO Auto-generated constructor stub
	}


	public VisitorDetails(int visitorId, Date visitDate, Date visitDateAndTime, String visitorName,
			String visitorMobileNo, IdType idType, String idNumber, String emailId, String comingCity,
			Department department, HostName hostName, Purpose purpose, String address, String imageName, String msg,
			String visitDuration, Date checkInOrApprovalDate, Date checkInOrApprovalDateTime, Date checkOutDate,
			Date checkOutDateAndTime, String status, String remark, String otherDevice, String laptopDetails,
			String vehicleType, String vehicleDetails, Date rejectDate, Date rejectDateAndTime) {
		super();
		this.visitorId = visitorId;
		this.visitDate = visitDate;
		this.visitDateAndTime = visitDateAndTime;
		this.visitorName = visitorName;
		this.visitorMobileNo = visitorMobileNo;
		this.idType = idType;
		this.idNumber = idNumber;
		this.emailId = emailId;
		this.comingCity = comingCity;
		this.department = department;
		this.hostName = hostName;
		this.purpose = purpose;
		this.address = address;
		this.imageName = imageName;
		this.msg = msg;
		this.visitDuration = visitDuration;
		this.checkInOrApprovalDate = checkInOrApprovalDate;
		this.checkInOrApprovalDateTime = checkInOrApprovalDateTime;
		this.checkOutDate = checkOutDate;
		this.checkOutDateAndTime = checkOutDateAndTime;
		this.status = status;
		this.remark = remark;
		this.otherDevice = otherDevice;
		this.laptopDetails = laptopDetails;
		this.vehicleType = vehicleType;
		this.vehicleDetails = vehicleDetails;
		this.rejectDate = rejectDate;
		this.rejectDateAndTime = rejectDateAndTime;
	}


	public int getVisitorId() {
		return visitorId;
	}


	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}


	public Date getVisitDate() {
		return visitDate;
	}


	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}


	public Date getVisitDateAndTime() {
		return visitDateAndTime;
	}


	public void setVisitDateAndTime(Date visitDateAndTime) {
		this.visitDateAndTime = visitDateAndTime;
	}


	public String getVisitorName() {
		return visitorName;
	}


	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}


	public String getVisitorMobileNo() {
		return visitorMobileNo;
	}


	public void setVisitorMobileNo(String visitorMobileNo) {
		this.visitorMobileNo = visitorMobileNo;
	}


	public IdType getIdType() {
		return idType;
	}


	public void setIdType(IdType idType) {
		this.idType = idType;
	}


	public String getIdNumber() {
		return idNumber;
	}


	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public String getComingCity() {
		return comingCity;
	}


	public void setComingCity(String comingCity) {
		this.comingCity = comingCity;
	}


	public Department getDepartment() {
		return department;
	}


	public void setDepartment(Department department) {
		this.department = department;
	}


	public HostName getHostName() {
		return hostName;
	}


	public void setHostName(HostName hostName) {
		this.hostName = hostName;
	}


	public Purpose getPurpose() {
		return purpose;
	}


	public void setPurpose(Purpose purpose) {
		this.purpose = purpose;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getImageName() {
		return imageName;
	}


	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public String getVisitDuration() {
		return visitDuration;
	}


	public void setVisitDuration(String visitDuration) {
		this.visitDuration = visitDuration;
	}


	public Date getCheckInOrApprovalDate() {
		return checkInOrApprovalDate;
	}


	public void setCheckInOrApprovalDate(Date checkInOrApprovalDate) {
		this.checkInOrApprovalDate = checkInOrApprovalDate;
	}


	public Date getCheckInOrApprovalDateTime() {
		return checkInOrApprovalDateTime;
	}


	public void setCheckInOrApprovalDateTime(Date checkInOrApprovalDateTime) {
		this.checkInOrApprovalDateTime = checkInOrApprovalDateTime;
	}


	public Date getCheckOutDate() {
		return checkOutDate;
	}


	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}


	public Date getCheckOutDateAndTime() {
		return checkOutDateAndTime;
	}


	public void setCheckOutDateAndTime(Date checkOutDateAndTime) {
		this.checkOutDateAndTime = checkOutDateAndTime;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getOtherDevice() {
		return otherDevice;
	}


	public void setOtherDevice(String otherDevice) {
		this.otherDevice = otherDevice;
	}


	public String getLaptopDetails() {
		return laptopDetails;
	}


	public void setLaptopDetails(String laptopDetails) {
		this.laptopDetails = laptopDetails;
	}


	public String getVehicleType() {
		return vehicleType;
	}


	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}


	public String getVehicleDetails() {
		return vehicleDetails;
	}


	public void setVehicleDetails(String vehicleDetails) {
		this.vehicleDetails = vehicleDetails;
	}


	public Date getRejectDate() {
		return rejectDate;
	}


	public void setRejectDate(Date rejectDate) {
		this.rejectDate = rejectDate;
	}


	public Date getRejectDateAndTime() {
		return rejectDateAndTime;
	}


	public void setRejectDateAndTime(Date rejectDateAndTime) {
		this.rejectDateAndTime = rejectDateAndTime;
	}


	




	
}
