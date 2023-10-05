package Visitor.login;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="user_master",schema="visitor")

@SequenceGenerator(name="user_master_sequence",sequenceName="visitor.user_master_sequence",initialValue= 1,allocationSize =1)
public class User {

	@Id
	@GeneratedValue(generator="user_master_sequence",strategy=GenerationType.SEQUENCE)
	@Column(nullable = false)
	private int userId;
	private boolean active;
	@Column(unique=true)
	private String userName;
	private String firstName;
	private String lastName;
	private String password;
	private String mobile;
	private String userRole;
	private String email;
	public int getUserId() {
		return userId;
	}
	
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", active=" + active + ", userName=" + userName + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", password=" + password + ", mobile=" + mobile + ", userRole=" + userRole
				+ ", email=" + email + "]";
	}
	
	
}
