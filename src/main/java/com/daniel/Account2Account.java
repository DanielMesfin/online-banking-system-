package com.daniel;

public class Account2Account {
private String sender;
private String reciver;
private Double amountPassed;
private String tType;
public Account2Account(String sender, String reciver, Double amountPassed,String tType) {
	this.sender = sender;
	this.reciver = reciver;
	this.amountPassed = amountPassed;
	this.tType=tType;
}
public String gettType() {
	return tType;
}
public void settType(String tType) {
	this.tType = tType;
}
public String getSender() {
	return sender;
}
public void setSender(String sender) {
	this.sender = sender;
}
public String getReciver() {
	return reciver;
}
public void setReciver(String reciver) {
	this.reciver = reciver;
}
public Double getAmountPassed() {
	return amountPassed;
}
public void setAmountPassed(Double amountPassed) {
	this.amountPassed = amountPassed;
}
}
