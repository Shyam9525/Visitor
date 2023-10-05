package Visitor.login;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface UserRepository extends JpaRepository<User, Integer>{

	Optional<User> findByUserName(String userName);
	
	public User findByUserNameAndActive(String userName,boolean active);
	
	public User findByUserId(Integer userId);
	
	@Query(value="SELECT * FROM visitor.user_master a where user_role not in('SUPERADMIN')",nativeQuery=true)
	List<User> getAllUser();
	
	
}
