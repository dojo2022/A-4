package model.user;

import java.io.Serializable;
import java.util.Date;


public class UserCondition implements Serializable {
	private int user_condition_id;
	private int partner_id;
	private float weight;
	private float body_temparture;
	private String text;
	private int appetite;
	private int sleepiness;
	private int humor;
	private int nausea;
	private int stress;
	private int dizziness;
	private int fatigue;
	private int stiff_shoulder;
	private int headache;
	private int backache;
	private int stomach_ache;
	private int feeling;
	private int tidying;
	private int self_assertion;
	private int poop;
	private int tooth_brushing;
	private Date created_at;


	public int getUser_condition_id() {
		return user_condition_id;
	}
	public void setUser_condition_id(int user_condition_id) {
		this.user_condition_id = user_condition_id;
	}
	public int getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(int partner_id) {
		this.partner_id = partner_id;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float d) {
		this.weight = d;
	}
	public float getBody_temparture() {
		return body_temparture;
	}
	public void setBody_temparture(float body_temparture) {
		this.body_temparture = body_temparture;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getAppetite() {
		return appetite;
	}
	public void setAppetite(int appetite) {
		this.appetite = appetite;
	}
	public int getSleepiness() {
		return sleepiness;
	}
	public void setSleepiness(int sleepiness) {
		this.sleepiness = sleepiness;
	}
	public int getHumor() {
		return humor;
	}
	public void setHumor(int humor) {
		this.humor = humor;
	}
	public int getNausea() {
		return nausea;
	}
	public void setNausea(int nausea) {
		this.nausea = nausea;
	}
	public int getStress() {
		return stress;
	}
	public void setStress(int stress) {
		this.stress = stress;
	}
	public int getDizziness() {
		return dizziness;
	}
	public void setDizziness(int dizziness) {
		this.dizziness = dizziness;
	}
	public int getFatigue() {
		return fatigue;
	}
	public void setFatigue(int fatigue) {
		this.fatigue = fatigue;
	}
	public int getStiff_shoulder() {
		return stiff_shoulder;
	}
	public void setStiff_shoulder(int stiff_shoulder) {
		this.stiff_shoulder = stiff_shoulder;
	}
	public int getHeadache() {
		return headache;
	}
	public void setHeadache(int headache) {
		this.headache = headache;
	}
	public int getBackache() {
		return backache;
	}
	public void setBackache(int backache) {
		this.backache = backache;
	}
	public int getStomach_ache() {
		return stomach_ache;
	}
	public void setStomach_ache(int stomach_ache) {
		this.stomach_ache = stomach_ache;
	}
	public int getFeeling() {
		return feeling;
	}
	public void setFeeling(int feeling) {
		this.feeling = feeling;
	}
	public int getTidying() {
		return tidying;
	}
	public void setTidying(int tidying) {
		this.tidying = tidying;
	}
	public int getSelf_assertion() {
		return self_assertion;
	}
	public void setSelf_assertion(int self_assertion) {
		this.self_assertion = self_assertion;
	}
	public int getPoop() {
		return poop;
	}
	public void setPoop(int poop) {
		this.poop = poop;
	}
	public int getTooth_brushing() {
		return tooth_brushing;
	}
	public void setTooth_brushing(int tooth_brushing) {
		this.tooth_brushing = tooth_brushing;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}



}
