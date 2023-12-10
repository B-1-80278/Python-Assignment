package com.app.customer;

public class Customer {
	private int acno;
	private int bal;
	private int items;
	private int cred;
	private int limit;
	
	public Customer(){
	}
	public Customer(int acno,int bal,int items,int cred,int limit) {
		this.acno=acno;
		this.bal=bal;
		this.items=items;
		this.cred=cred;
		this.limit=limit;
	}
	
	public int calculateNewBalance() {
		return bal+items-cred;
	}
	
	public int getLimit() {
		return limit;
	}
}
