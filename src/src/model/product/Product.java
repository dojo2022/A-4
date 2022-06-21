package model.product;

import java.io.Serializable;

import org.joda.time.DateTime;

public class Product implements Serializable{
	public int product_id;
	public String name;
	public String description;
	public int price;
	public String image;
	public String status;
	public int listing_user_id;
	public int purchase_user_id;
	public DateTime listing_date;
	public DateTime purchase_date;

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getListing_user_id() {
		return listing_user_id;
	}
	public void setListing_user_id(int listing_user_id) {
		this.listing_user_id = listing_user_id;
	}
	public int getPurchase_user_id() {
		return purchase_user_id;
	}
	public void setPurchase_user_id(int purchase_user_id) {
		this.purchase_user_id = purchase_user_id;
	}
	public DateTime getListing_date() {
		return listing_date;
	}
	public void setListing_date(DateTime listing_date) {
		this.listing_date = listing_date;
	}
	public DateTime getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(DateTime purchase_date) {
		this.purchase_date = purchase_date;
	}

}
