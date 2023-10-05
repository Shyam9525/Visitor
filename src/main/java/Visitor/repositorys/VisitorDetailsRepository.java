package Visitor.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import Visitor.models.HostName;
import Visitor.models.VisitorDetails;

public interface VisitorDetailsRepository  extends CrudRepository<VisitorDetails, Integer>{

	public VisitorDetails findByVisitorId(Integer visitorId);
	
	public List<VisitorDetails> findByStatus(String status);
	

	public List<VisitorDetails> findByStatusAndHostName(String status,HostName hostName);
	
	@Query(value="SELECT * FROM visitor.visitor_details where visitor_mobile_no=?1 limit 1",nativeQuery=true)
	public VisitorDetails findByVisitorMobileNo(String mobileNo);

	@Query(value="SELECT count(*) FROM visitor.visitor_details where host_name=?1 and status='P';",nativeQuery=true)
	public Integer getPendingList(HostName hostId);
	
	
}
