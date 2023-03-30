package com.Infopackage;
public class Product {
	private int pid;
	private String pTitle;
	private String pDesc;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int Quantity;
	private int cID;
	private Category cat;
	public int getPid() {
		return pid;
	}
	public String getpTitle() {
		return pTitle;
	}
	public String getpDesc() {
		return pDesc;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public int getpPrice() {
		return pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public int getQuantity() {
		return Quantity;
	}
	public int getcID() {
		return cID;
	}
	public Category getCat() {
		return cat;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public void setcID(int cID) {
		this.cID = cID;
	}
	public void setCat(Category cat) {
		this.cat = cat;
	}
	
}
