import org.grails.activiti.ActivitiConstants
import org.grails.activiti.serializable.SerializableVariableType

// Place your Spring DSL code here
import org.activiti.engine.runtime.ProcessInstance
import org.activiti.engine.task.Task
import grails.util.GrailsNameUtils
import grails.util.Environment
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.codehaus.groovy.grails.commons.ControllerArtefactHandler
import org.springframework.core.io.Resource
import org.grails.activiti.ActivitiConstants
import org.grails.activiti.serializable.SerializableVariableType

beans = {
	
	println "Spring Konfigurasyon basladi Activiti Process Engine ..."
	
	
	customPropertyEditorRegistrar(CustomDateEditorRegistrar)
	importBeans('file:grails-app/conf/spring/dunning.xml')
	
	
	customer(com.dunningtime.domains.Customer){}
	invoice(com.dunningtime.domains.Invoice){}
	
	processEngineConfiguration(org.activiti.spring.SpringProcessEngineConfiguration) {
		processEngineName = CH.config.activiti.processEngineName?:ActivitiConstants.DEFAULT_PROCESS_ENGINE_NAME
		databaseType = CH.config.activiti.databaseType?:ActivitiConstants.DEFAULT_DATABASE_TYPE
		databaseSchemaUpdate = CH.config.activiti.databaseSchemaUpdate ? CH.config.activiti.databaseSchemaUpdate.toString() : ActivitiConstants.DEFAULT_DATABASE_SCHEMA_UPDATE
		deploymentName = CH.config.activiti.deploymentName?:ActivitiConstants.DEFAULT_DEPLOYMENT_NAME
		deploymentResources = CH.config.activiti.deploymentResources?:ActivitiConstants.DEFAULT_DEPLOYMENT_RESOURCES
		jobExecutorActivate = CH.config.activiti.jobExecutorActivate?:ActivitiConstants.DEFAULT_JOB_EXECUTOR_ACTIVATE
			  history = CH.config.activiti.history?:ActivitiConstants.DEFAULT_HISTORY
		mailServerHost = CH.config.activiti.mailServerHost?:ActivitiConstants.DEFAULT_MAIL_SERVER_HOST
		mailServerPort = CH.config.activiti.mailServerPort?:ActivitiConstants.DEFAULT_MAIL_SERVER_PORT
		mailServerUsername = CH.config.activiti.mailServerUsername
		mailServerPassword = CH.config.activiti.mailServerPassword
		mailServerDefaultFrom = CH.config.activiti.mailServerDefaultFrom?:ActivitiConstants.DEFAULT_MAIL_SERVER_FROM
		dataSource = ref("dataSource")
		transactionManager = ref("transactionManager")

		// Define custom serializable types for fix issue with serialization
		customPreVariableTypes(java.util.ArrayList, [
			new SerializableVariableType(),
			ref("customer")
		])		
	}
	
	  processEngine(org.activiti.spring.ProcessEngineFactoryBean) {
		  processEngineConfiguration = ref("processEngineConfiguration")
	  }

	runtimeService(processEngine:"getRuntimeService")
	repositoryService(processEngine:"getRepositoryService")
	taskService(processEngine:"getTaskService")
	managementService(processEngine:"getManagementService")
	identityService(processEngine:"getIdentityService")
	historyService(processEngine:"getHistoryService")
	formService(processEngine:"getFormService")
	
	activitiService(org.grails.activiti.ActivitiService) {
		runtimeService = ref("runtimeService")
		taskService = ref("taskService")
		identityService = ref("identityService")
		formService = ref("formService")
	}
	
	println "Spring Konfigurasyon bitti Activiti Process Engine ..."
  
}
