package model.childcare;

import java.io.Serializable;
import java.sql.Date;

public class ChildcareQuest implements Serializable {
	private int childcare_quest_id;
	private int family_id;
	private String title;
	private String body;
	private Date time_limit;
	private String label;
	private int completed_flag;
	private Date created_at;
	private Date updated_date;


	public int getChildcare_quest_id() {
		return childcare_quest_id;
	}
	public void setChildcare_quest_id(int childcare_quest_id) {
		this.childcare_quest_id = childcare_quest_id;
	}
	public int getFamily_id() {
		return family_id;
	}
	public void setFamily_id(int family_id) {
		this.family_id = family_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getTime_limit() {
		return time_limit;
	}
	public void setTime_limit(Date time_limit) {
		this.time_limit = time_limit;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getCompleted_flag() {
		return completed_flag;
	}
	public void setCompleted_flag(int completed_flag) {
		this.completed_flag = completed_flag;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}



}
