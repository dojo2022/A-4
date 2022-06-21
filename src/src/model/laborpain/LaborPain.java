package model.laborpain;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;


public class LaborPain implements Serializable {

	private int labor_pain_id;
	private int user_id;
	private Timestamp start_time;
	private Timestamp stop_time;
	private Time labor_interval;

	public int getLabor_pain_id() {
		return labor_pain_id;
	}
	public void setLabor_pain_id(int labor_pain_id) {
		this.labor_pain_id = labor_pain_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public Timestamp getStop_time() {
		return stop_time;
	}
	public void setStop_time(Timestamp stop_time) {
		this.stop_time = stop_time;
	}
	public Time getLabor_interval() {
		return labor_interval;
	}
	public void setLabor_interval(Time labor_interval) {
		this.labor_interval = labor_interval;
	}


}
