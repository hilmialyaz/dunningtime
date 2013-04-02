package com.dunningtime.domains



class Invoice {
	
	String 	referenceNo	
	String 	invoiceDescription
	String  currency
	int 	invoiceStatus
	Boolean isVisible
	BigDecimal total
	Date invoiceDate
	Date dueDate
	Date payDate
	Date 	createdDate
	
	Policy policy;
	DunningStatus dunningStatus;
	
	
	static belongsTo = [customer: Customer]
	
    static constraints = {
		policy(nullable: true);
    }
	
}
