package model.user;

import java.io.Serializable;

import org.joda.time.DateTime;

public class Family implements Serializable {
	private int family_id;
	private DateTime created_at;


	public int getFamily_id() {
		return family_id;
	}
	public void setFamily_id(int family_id) {
		this.family_id = family_id;
	}
	public DateTime getCreated_at() {
		return created_at;
	}
	public void setCreated_at(DateTime created_at) {
		this.created_at = created_at;
	}




}

