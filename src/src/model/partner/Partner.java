package model.partner;

import java.io.Serializable;

import org.joda.time.DateTime;

public class Partner implements Serializable {
	private int partner_id;
	private int family_id;
	private String name;
	private String attribute;
	private int appetite;
	private int sleepiness;
	private int humor;
	private int nausea;
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
	private DateTime created_at;
	private DateTime updated_at;


	public int getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(int partner_id) {
		this.partner_id = partner_id;
	}
	public int getFamily_id() {
		return family_id;
	}
	public void setFamily_id(int family_id) {
		this.family_id = family_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
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



}
