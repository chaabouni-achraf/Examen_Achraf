package tn.iit.jee.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Entity;

@Entity
@Table(name="Teacher", 
	   uniqueConstraints={@UniqueConstraint(columnNames={"ID"})})
public class Teacher {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID", nullable=false, unique=true, length=11)
	private int id;
	@Column(name="first_name", length=20, nullable=false)
	private String first_name;
	@Column(name="last_name", length=20, nullable=false)
	private String last_name;
	@Column(name="birthday", length=20, nullable=false)
	private Date birthday;
	public Teacher() {
		super();
	}
	@Column(name="email", nullable=true)
	private String email;
	@Column(name="institution", nullable=true)
	private String institution;
	@Column(name="phone", nullable=true)
	private String phone;
	
	

	public Teacher(int id, String first_name, String last_name, Date birthday, String email, String institution,
			String phone) {
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.birthday = birthday;
		this.email = email;
		this.institution = institution;
		this.phone = phone;
	}
	
	public Teacher(String first_name, String last_name, Date birthday, String email, String institution,
			String phone) {
		this.first_name = first_name;
		this.last_name = last_name;
		this.birthday = birthday;
		this.email = email;
		this.institution = institution;
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", first_name=" + first_name + ", last_name=" + last_name + ", birthday="
				+ birthday + ", email=" + email + ", institution=" + institution + ", phone=" + phone + "]";
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Teacher(String first_name, String last_name, String email, String institution, String phone) {
		
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.institution = institution;
		this.phone = phone;
	}
	public int getId() {
		return id;
	}
	private void setId(int id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInstitution() {
		return institution;
	}
	public void setInstitution(String institution) {
		this.institution = institution;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}