package com.daniel;
public class UserInformation {
	private String fullName;
	private String accountNumber;
	private String emailAddress;
	private String password;
	private String confirmPassword;

// constractor  
	public UserInformation(String fullName, String accountNumber, String emailAddress, String password,
			String confirmPassword) {

		this.fullName = fullName;
		this.accountNumber = accountNumber;
		this.emailAddress = emailAddress;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}
