package com.dunningtime.process.executer

import static org.junit.Assert.assertNotNull;

import org.activiti.engine.runtime.Execution;


/**
 * ActivitiProcessExecuterService
 * A service class encapsulates the core business logic of a Grails application
 */
class ActivitiProcessExecuterService {

	static transactional = true

	def runtimeService;
	def activitiService
	def identityService

	def startProcessInstanceByKey(String processName,Map<String, Object> variables){
		print runtimeService

		Execution execution = runtimeService.createExecutionQuery().processInstanceId("1026").activityId("receivetask1").singleResult();
		runtimeService.signal(execution.getId());


		print "services"
		print runtimeService

		try{
			runtimeService.startProcessInstanceByKey(processName,variables)
		}catch(Exception e){
			print e;
		}
	}
}
