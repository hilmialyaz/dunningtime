<%--
/* Copyright 2010 the original author or authors.
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
 *
 * @author <a href='mailto:limcheekin@vobject.com'>Lim Chee Kin</a>
 *
 * @since 5.0.beta2
 */
 --%>
 
<%@ page import="org.activiti.engine.task.Task" %>
<%@ page import="org.activiti.engine.form.TaskFormData" %>
<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder" %>
<%@ page import="org.grails.activiti.ActivitiConstants" %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Task')}" />
	<g:set var="sessionUsernameKey" value="${ConfigurationHolder.config.activiti.sessionUsernameKey?:ActivitiConstants.DEFAULT_SESSION_USERNAME_KEY}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-task" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customer.customerName.label" default="Customer Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: task, field: "assignee")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customer.invoices.label" default="Invoices" /></td>
				
				<td valign="top" style="text-align: left;" class="value">					
				</td>
			</tr>
		
		</tbody>
	</table>
</section>

</body>