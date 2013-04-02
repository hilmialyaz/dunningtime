
<%@ page import="vacationRequest.VacationRequest" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vacationRequest.label', default: 'VacationRequest')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<div class="nav" role="navigation">
			 <ul>  
			    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			    <li><g:link class="list" controller="task" action="myTaskList"><g:message code="myTasks.label" default="My Tasks ({0})" args="[myTasksCount]" /></g:link></li>            
			    <li><g:link class="create" action="start"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
</div>	
<section id="list-vacationRequest" class="first">	            
	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="employeeName" title="${message(code: 'vacationRequest.employeeName.label', default: 'Employee Name')}" />
			
				<g:sortableColumn property="numberOfDays" title="${message(code: 'vacationRequest.numberOfDays.label', default: 'Number Of Days')}" />
			
				<g:sortableColumn property="vacationDescription" title="${message(code: 'vacationRequest.vacationDescription.label', default: 'Vacation Description')}" />
			
				<g:sortableColumn property="approvalStatus" title="${message(code: 'vacationRequest.approvalStatus.label', default: 'Approval Status')}" />
			
				<g:sortableColumn property="approvalRemark" title="${message(code: 'vacationRequest.approvalRemark.label', default: 'Approval Remark')}" />
			
				<g:sortableColumn property="resendRequest" title="${message(code: 'vacationRequest.resendRequest.label', default: 'Resend Request')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vacationRequestInstanceList}" status="i" var="vacationRequestInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vacationRequestInstance.id}">${fieldValue(bean: vacationRequestInstance, field: "employeeName")}</g:link></td>
			
				<td>${fieldValue(bean: vacationRequestInstance, field: "numberOfDays")}</td>
			
				<td>${fieldValue(bean: vacationRequestInstance, field: "vacationDescription")}</td>
			
				<td>${fieldValue(bean: vacationRequestInstance, field: "approvalStatus")}</td>
			
				<td>${fieldValue(bean: vacationRequestInstance, field: "approvalRemark")}</td>
			
				<td><g:formatBoolean boolean="${vacationRequestInstance.resendRequest}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${vacationRequestInstanceTotal}" />
	</div>
</section>

</body>

</html>
