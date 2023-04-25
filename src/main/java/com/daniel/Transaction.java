package com.daniel;

import java.util.Date;

public class Transaction {
	String account;
	String tType;
	Double amount;
    Date date;
//	public Transaction(String account, String tType, Double amount) {
//		this.account = account;
//		this.tType = tType;
//		this.amount = amount;
//	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String gettType() {
		return tType;
	}

	public void settType(String tType) {
		this.tType = tType;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
}
