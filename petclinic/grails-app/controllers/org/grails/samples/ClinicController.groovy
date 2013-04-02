package org.grails.samples

class ClinicController {

	def index() {}

	def vets() {
		[vets: Vet.list()]
	}
	
	def hayvan(){
		
	}
	
	
	def hebele(){
		
	}
}
