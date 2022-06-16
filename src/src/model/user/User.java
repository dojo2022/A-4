package model.user;
import java.io.Serializable;
import java.util.Date;

import org.joda.time.DateTime;

public class User implements Serializable {
	private int user_id;
	private String email;
	private String name;
	private String nickname;
	private String post_code;
	private String address;
	private String birthday;
	private String gender;
	private String tel;
	private String family_id;
	private Date due_date;
	private DateTime created_at;
	private DateTime updated_at;
	private DateTime login_time;
	private DateTime logout_time;


	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFamily_id() {
		return family_id;
	}

	public void setFamily_id(String family_id) {
		this.family_id = family_id;
	}

	public Date getDue_date() {
		return due_date;
	}

	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}

	public DateTime getCreated_at() {
		return created_at;
	}

	public void setCreated_at(DateTime created_at) {
		this.created_at = created_at;
	}

	public DateTime getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(DateTime updated_at) {
		this.updated_at = updated_at;
	}

	public DateTime getLogin_time() {
		return login_time;
	}

	public void setLogin_time(DateTime login_time) {
		this.login_time = login_time;
	}

	public DateTime getLogout_time() {
		return logout_time;
	}

	public void setLogout_time(DateTime logout_time) {
		this.logout_time = logout_time;
	}

}
