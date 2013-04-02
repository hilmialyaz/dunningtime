
<%@ page import="com.dunningtime.domains.DunningStatus" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'dunningStatus.label', default: 'DunningStatus')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-dunningStatus" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dunningStatus.daysLateCumulative.label" default="Days Late Cumulative" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dunningStatusInstance, field: "daysLateCumulative")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dunningStatus.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dunningStatusInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dunningStatus.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dunningStatusInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dunningStatus.sequenceNumber.label" default="Sequence Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dunningStatusInstance, field: "sequenceNumber")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
