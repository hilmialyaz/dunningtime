
<%@ page import="vacationRequest.VacationRequest" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vacationRequest.label', default: 'VacationRequest')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-vacationRequest" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.employeeName.label" default="Employee Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: vacationRequestInstance, field: "employeeName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.numberOfDays.label" default="Number Of Days" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: vacationRequestInstance, field: "numberOfDays")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.vacationDescription.label" default="Vacation Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: vacationRequestInstance, field: "vacationDescription")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.approvalStatus.label" default="Approval Status" /></td>
				
				<td valign="top" class="value">${vacationRequestInstance?.approvalStatus?.encodeAsHTML()}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.approvalRemark.label" default="Approval Remark" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: vacationRequestInstance, field: "approvalRemark")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.resendRequest.label" default="Resend Request" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${vacationRequestInstance?.resendRequest}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vacationRequestInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="vacationRequest.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${vacationRequestInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
