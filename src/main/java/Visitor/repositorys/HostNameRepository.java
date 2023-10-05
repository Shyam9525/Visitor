package Visitor.repositorys;

import org.springframework.data.repository.CrudRepository;

import Visitor.login.User;
import Visitor.models.HostName;

public interface HostNameRepository extends CrudRepository<HostName, Integer>{
	
	public HostName findByUserId(User loginUserId);

}
