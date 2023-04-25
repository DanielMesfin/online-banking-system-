package com.daniel;

public class userUpdateInformation {
private String  userName;
private String emailAddress;
private String password;
private String account;
public userUpdateInformation(String userName, String emailAddress, String password ,String accountNumber) {

	this.userName = userName;
	this.emailAddress = emailAddress;
	this.password = password;
	this.account=accountNumber;
	
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmailAddress() {
	return emailAddress;
}
public void setEmailAddress(String emailAddress) {
	this.emailAddress = emailAddress;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
}
