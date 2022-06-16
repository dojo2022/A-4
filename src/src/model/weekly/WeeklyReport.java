package model.weekly;

import java.io.Serializable;

public class WeeklyReport implements Serializable {

	private int weekly_report_id;
	private int week;
	private String person;
	private String title;
	private String body;
	private String image;

	public int getWeekly_report_id() {
		return weekly_report_id;
	}
	public void setWeekly_report_id(int weekly_report_id) {
		this.weekly_report_id = weekly_report_id;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
