package com.Infopackage;

public class Order {
	private String orderid;
	private String userid;
	private String username;
	private String email;
	private String phonenumber;
	private String address;
	private String productIDs;
	private String total;
	private String payment;
	//getters & setters;
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getUserid() {
		return userid;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public String getProductIDs() {
		return productIDs;
	}
	public String getTotal() {
		return total;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setProductIDs(String productIDs) {
		this.productIDs = productIDs;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
}
