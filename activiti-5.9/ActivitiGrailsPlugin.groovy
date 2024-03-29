/* Copyright 2010-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.activiti.engine.runtime.ProcessInstance
import org.activiti.engine.task.Task
import grails.util.GrailsNameUtils
import grails.util.Environment
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.codehaus.groovy.grails.commons.ControllerArtefactHandler
import org.springframework.core.io.Resource 
import org.grails.activiti.ActivitiConstants
import org.grails.activiti.serializable.SerializableVariableType

/**
 *
 * @author <a href='mailto:limcheekin@vobject.com'>Lim Chee Kin</a>
 *
 * @since 5.0.alpha3
 */
class ActivitiGrailsPlugin {
    // the plugin version
    def version = "5.9"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.0.0 > *"
    // the other plugins this plugin depends on
    def dependsOn = [:]
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
            "grails-app/views/error.gsp"
    ]

    def author = "Lim Chee Kin"
    def authorEmail = "limcheekin@vobject.com"
    def title = "Grails Activiti Plugin - Enabled Activiti BPM Suite support for Grails"
    def description = '''
 Grails Activiti Plugin is created to integrate Activiti BPM Suite and workflow system to Grails Framework. 
 With the Grails Activiti Plugin, workflow application can be created at your fingertips! 

 Project Site and Documentation: http://code.google.com/p/grails-activiti-plugin/
 Source Code: https://github.com/limcheekin/activiti
 Support: https://github.com/limcheekin/activiti/issues
 Discussion Forum: http://groups.google.com/group/grails-activiti-plugin
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/activiti"
	  def confWatchedResources = [CH.config.activiti.deploymentResources, "file:./grails-app/controllers/**/*.groovy"].flatten()
	  def defaultWatchedResources = [ActivitiConstants.DEFAULT_DEPLOYMENT_RESOURCES, "file:./grails-app/controllers/**/*.groovy"].flatten()
    def watchedResources = confWatchedResources?:defaultWatchedResources
	  
    String sessionUsernameKey = CH.config.activiti.sessionUsernameKey?:ActivitiConstants.DEFAULT_SESSION_USERNAME_KEY
    boolean useFormKey = CH.config.activiti.useFormKey?:ActivitiConstants.DEFAULT_USE_FORM_KEY

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional), this event occurs before 
    }



    def doWithDynamicMethods = { ctx ->
        application.controllerClasses.each { controllerClass ->
            if (controllerClass.hasProperty("activiti") && controllerClass.clazz.activiti) {
                controllerClass.metaClass.getActivitiService = {-> return ctx.activitiService}
                // addActivitiActions(controllerClass) Not possible, find out more at URL below:
                // http://archive.jrcs.codehaus.org/lists/org.codehaus.grails.dev/msg/25487189.post@talk.nabble.com
                addActivitiMethods(controllerClass)
            }
        }
    }

    def addActivitiMethods(controllerClass) {
        controllerClass.metaClass.start = { Map params ->
            activitiService.with {
				session[sessionUsernameKey] = springSecurityService?.currentUser?.username;				
				print "session da session"
				print session[sessionUsernameKey]
                params[sessionUsernameKey] = session[sessionUsernameKey]
                ProcessInstance pi = startProcess(params)
                Task task = getUnassignedTask(session[sessionUsernameKey], pi.id)
                claimTask(task.id, session[sessionUsernameKey])
                redirect uri:getTaskFormUri(task.id, useFormKey)
            }
        }
				
        controllerClass.metaClass.startTask = { String taskId ->
            activitiService.with {
				session[sessionUsernameKey] = springSecurityService?.currentUser?.username;
                claimTask(taskId, session[sessionUsernameKey])
                redirect uri:getTaskFormUri(taskId, useFormKey)
            }
        }
							
        controllerClass.metaClass.getForm = { String taskId ->
            redirect uri:activitiService.getTaskFormUri(taskId, useFormKey)
        }
				
        controllerClass.metaClass.saveTask = { Map params ->
            params.domainClassName = getDomainClassName(delegate)
            activitiService.setTaskFormUri(params)
        }
				
        controllerClass.metaClass.completeTask = { Map params ->
            params.domainClassName = getDomainClassName(delegate)
            activitiService.completeTask(params.taskId, params)
        }
						
        controllerClass.metaClass.claimTask = { String taskId ->
			session[sessionUsernameKey] = springSecurityService?.currentUser?.username;
            activitiService.claimTask(taskId, session[sessionUsernameKey])
        }
				
        controllerClass.metaClass.revokeTask = { String taskId ->
            activitiService.claimTask(taskId, null)
        }
				
        controllerClass.metaClass.deleteTask = { String taskId, String domainClassName = null ->
            if (!domainClassName && delegate.class != org.grails.activiti.TaskController) {
                domainClassName = getDomainClassName(delegate)
            }
            activitiService.deleteTask(taskId, domainClassName)
        }
		
        controllerClass.metaClass.setAssignee = { String taskId, String username ->
            if (username) {
                activitiService.setAssignee(taskId, username)
            } else {
                revokeTask(taskId)
            }
        }
				
        controllerClass.metaClass.setPriority = { String taskId, int priority ->
            activitiService.setPriority(taskId, priority)
        }
						
		
        controllerClass.metaClass.getUnassignedTasksCount = {->
			session[sessionUsernameKey] = springSecurityService?.currentUser?.username;
            activitiService.getUnassignedTasksCount(session[sessionUsernameKey])
        }
				
        controllerClass.metaClass.getAssignedTasksCount = {->
			session[sessionUsernameKey] = springSecurityService?.currentUser?.username;
            activitiService.getAssignedTasksCount(session[sessionUsernameKey])
        }
				
        controllerClass.metaClass.getAllTasksCount = {->
            activitiService.getAllTasksCount()
        }
				
        controllerClass.metaClass.findUnassignedTasks = { Map params ->
			session[sessionUsernameKey] = springSecurityService?.currentUser?.username;
            params[sessionUsernameKey] = session[sessionUsernameKey]
            if (!params.sort) {
                params.sort = "createTime"
                params.order = "desc"
            }
            activitiService.findUnassignedTasks(params)
        }
				
        controllerClass.metaClass.findAssignedTasks = { Map params ->
			print "session da session"
			session[sessionUsernameKey] = springSecurityService?.currentUser?.username;			
            params[sessionUsernameKey] = session[sessionUsernameKey]
            if (!params.sort) {
                params.sort = "createTime"
                params.order = "desc"
            }
			print "PARAMS"
			print params
            activitiService.findAssignedTasks(params)
        }
				
        controllerClass.metaClass.findAllTasks = { Map params ->
            if (!params.sort) {
                params.sort = "createTime"
                params.order = "desc"
            }
            activitiService.findAllTasks(params)
        }
    }

    private getDomainClassName(delegate) {
        return "${delegate.class.package.name}.${GrailsNameUtils.getLogicalName(delegate.class.name, 'Controller')}"
    }
		
    def doWithApplicationContext = { applicationContext ->
        // TODO Implement post initialization spring config (optional)
    }

    def onChange = { event ->
        println "Reloading ${event.source}..."
        if (!(event.source instanceof Resource)) {  		  
            if(application.isControllerClass(event.source)) {
                def controllerClass = application.addArtefact(ControllerArtefactHandler.TYPE, event.source)			
                if (controllerClass.hasProperty("activiti") && controllerClass.clazz.activiti) {
                    controllerClass.metaClass.getActivitiService = {-> return event.ctx.activitiService}
                    addActivitiMethods(controllerClass)
                }
            }
        } else { // it is org.springframework.core.io.Resource
            event.ctx.repositoryService.createDeployment()
            .name(ActivitiConstants.PLUGIN_AUTO_DEPLOYMENT_NAME)
            .addInputStream(event.source.filename, event.source.inputStream)
            .deploy()
        } 		
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }
}
