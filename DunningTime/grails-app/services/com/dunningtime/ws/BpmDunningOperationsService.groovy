package com.dunningtime.ws

import com.dunningtime.domains.Invoice
import com.dunningtime.process.delegate.PojoTest

class BpmDunningOperationsService {

	static expose = ['cxf'];
	
	
	def activitiProcessExecuterService;
	
	def invoiceOperationsService;
	
	
	
    def startDunningProcessForInvoice(String referenceNo) {
		Invoice invoice =  invoiceOperationsService.getInvoice(referenceNo);
		if(invoice){
			def filtered = ['class', 'active', 'metaClass'];
			def map = new HashMap<String,Object>();
			def props = invoice.properties.collect{
				if(!filtered.contains(it.key))
				 	map[it.key]= it.value
			}
			
			map.each{
				println it
			}
			def map2= new HashMap<String,Object>();
			PojoTest test= new PojoTest();
			test.setName();
			test.setSayi(0);
			map2["myObjectTest"]=test; 
			activitiProcessExecuterService.startProcessInstanceByKey("BasicAdslDunningProcess",map2)
		}
    }
	
}
