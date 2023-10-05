package Visitor.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="purpose_master",schema="visitor")
@SequenceGenerator(name="purpose_master_sequence",sequenceName="visitor.purpose_master_sequence",initialValue= 1,allocationSize =1)
public class Purpose {

	@Id
	@GeneratedValue(generator="purpose_master_sequence",strategy=GenerationType.SEQUENCE)
	@Column(nullable = false)
	private int id;
	
	@Column(unique=true)
	private String name;
	private String description;
	
	public Purpose() {
		// TODO Auto-generated constructor stub
	}

	public Purpose(int id, String name, String description) {
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
