package model.partner;

import java.io.Serializable;

public class PartnerAttribute implements Serializable {
	private int partner_attribute_id;
	private String partner_attribute_name;
	private String image;


	public int getPartner_attribute_id() {
		return partner_attribute_id;
	}
	public void setPartner_attribute_id(int partner_attribute_id) {
		this.partner_attribute_id = partner_attribute_id;
	}
	public String getPartner_attribute_name() {
		return partner_attribute_name;
	}
	public void setPartner_attribute_name(String partner_attribute_name) {
		this.partner_attribute_name = partner_attribute_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}



}
