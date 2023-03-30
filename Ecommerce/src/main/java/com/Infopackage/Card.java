package com.Infopackage;
public class Card {

	private String userID;
	private String cardnumber;
	private String NameOnCard;
	private String futureCardName;
	private String cardid;
	public String getCardid() {
		return cardid;
	}
	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	public String getUserID() {
		return userID;
	}
	public String getCardnumber() {
		return cardnumber;
	}
	public String getNameOnCard() {
		return NameOnCard;
	}
	public String getFutureCardName() {
		return futureCardName;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public void setNameOnCard(String nameOnCard) {
		NameOnCard = nameOnCard;
	}
	public void setFutureCardName(String futureCardName) {
		this.futureCardName = futureCardName;
	}
}
