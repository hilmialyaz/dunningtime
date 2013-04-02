package com.dunningtime.bl.invoice

import com.dunningtime.domains.Invoice


/**
 * InvoiceOperationsService
 * A service class encapsulates the core business logic of a Grails application
 */
class InvoiceOperationsService {

    static transactional = true

    def serviceMethod() {

    }
	
	def sendSms() {
		print "sms send service";
	}
	
	Invoice getInvoice(String referenceNo){
		return Invoice.findByReferenceNo(referenceNo);
	}
}
