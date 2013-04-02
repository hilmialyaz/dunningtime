package com.dunningtime.process.delegate;

import org.activiti.engine.delegate.DelegateExecution;
import com.dunningtime.bl.invoice.InvoiceOperationsService;

public class SmsSendActivitiDelegate {	
	
	private InvoiceOperationsService invoiceOperationsService;
	
	public void sendSms() {
		System.out.println("sms send service");
	}

	public void execute(DelegateExecution execution) {		
		String var = (String) execution.getVariable("invoice_id");
		var = var+ "hebe";
		System.out.println(var);
		invoiceOperationsService.sendSms();
		//execution.setVariable("invoice_id", var);	
	}

	public void setInvoiceOperationsService(
			InvoiceOperationsService invoiceOperationsService) {
		this.invoiceOperationsService = invoiceOperationsService;
	}
	
	
}
