
<%@ page import="com.dunningtime.domains.Policy" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'policy.label', default: 'Policy')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-policy" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="policy.bpmWorkflowName.label" default="Bpm Workflow Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: policyInstance, field: "bpmWorkflowName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="policy.policyDescription.label" default="Policy Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: policyInstance, field: "policyDescription")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="policy.policyName.label" default="Policy Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: policyInstance, field: "policyName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="policy.status.label" default="Status" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${policyInstance.status}" var="s">
						<li><g:link controller="dunningStatus" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
