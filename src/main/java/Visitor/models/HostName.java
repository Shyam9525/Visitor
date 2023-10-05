package Visitor.models;

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

import Visitor.login.User;

@Entity
@Table(name="host_name_master",schema="visitor")
@SequenceGenerator(name="host_name_master_sequence",sequenceName="visitor.host_name_master_sequence",initialValue= 1,allocationSize =1)
public class HostName {

	@Id
	@GeneratedValue(generator="host_name_master_sequence",strategy=GenerationType.SEQUENCE)
	@Column(nullable = false)
	private int id;
	
	@Column(unique=true)
	private String name;
	private String description;
	
	
	@JoinColumn(name = "userid", referencedColumnName = "userId",unique=true)
    @ManyToOne(fetch = FetchType.EAGER)
	private User userId;
	
	
	public HostName() {
		// TODO Auto-generated constructor stub
	}


	public HostName(int id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
}

