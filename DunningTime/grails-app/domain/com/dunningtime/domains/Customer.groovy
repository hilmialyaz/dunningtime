package com.dunningtime.domains

class Customer {
	
	String customerName;
	String status;
	
	static hasMany = [invoices: Invoice]

    static constraints = {
    }
	
}
