package tn.iit.jee.model;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import org.hibernate.annotations.Parameter;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Entity;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Authorization", 
	   uniqueConstraints={@UniqueConstraint(columnNames={"ID"})})
public class Authorization {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID", nullable=false, unique=true, length=11)
	private int id;
	@Column(name="institution", length=20, nullable=false)
	private String institution;
	@Column(name="startDate", length=20, nullable=false)
	private Date startDate;
	@Column(name="endDate", length=20, nullable=false)
	private Date endDate;
	@Column(name="duration", nullable=false)
	private long duration;
	@ManyToOne()
    @JoinColumn(name="id_teacher", nullable=false, insertable = false, updatable = false)
	private Teacher teacher;
	
	
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Authorization() {
		super();
	}
	public Authorization( Date startDate, Date endDate, int duration, Teacher teacher) {
		super();
		//this.id_teacher = id_teacher;
		this.institution = teacher.getInstitution();
		this.startDate = startDate;
		this.endDate = endDate;
		this.duration = duration;
		this.teacher = teacher;
	}
	
	public Authorization(Date startDate, Date endDate) {
		this.startDate = startDate;
		this.endDate = endDate;
		LocalDate startDate1 = startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate endDate1 = endDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		

	    long weeksInYear = ChronoUnit.WEEKS.between(startDate1, endDate1);
	    this.duration = weeksInYear;
	}
	public Authorization(int id, String institution, Date startDate, Date endDate, long duration) {
		super();
		this.id = id;
		//this.id_teacher = id_teacher;
		this.institution = institution;
		this.startDate = startDate;
		this.endDate = endDate;
		this.duration = duration;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInstitution() {
		return institution;
	}
	public void setInstitution(String institution) {
		this.institution = institution;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public long getDuration() {
		return duration;
	}
	public void setDuration(long duration) {
		this.duration = duration;
	}
	@Override
	public String toString() {
		return "Authorization [id=" + id + ", teacher=" + teacher + ", institution=" + institution
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", duration=" + duration + "]";
	}
	
}
