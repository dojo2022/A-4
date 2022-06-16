package model.laborpain;

import java.io.Serializable;
import java.sql.Time;

import org.joda.time.DateTime;

public class LaborPain implements Serializable {

	private int labor_pain_id;
	private int user_id;
	private DateTime start_time;
	private DateTime stop_time;
	private Time interval;

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
	public DateTime getStart_time() {
		return start_time;
	}
	public void setStart_time(DateTime start_time) {
		this.start_time = start_time;
	}
	public DateTime getStop_time() {
		return stop_time;
	}
	public void setStop_time(DateTime stop_time) {
		this.stop_time = stop_time;
	}
	public Time getInterval() {
		return interval;
	}
	public void setInterval(Time interval) {
		this.interval = interval;
	}
}
