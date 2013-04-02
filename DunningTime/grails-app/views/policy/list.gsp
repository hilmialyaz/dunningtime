
<%@ page import="com.dunningtime.domains.Policy" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'policy.label', default: 'Policy')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-policy" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="bpmWorkflowName" title="${message(code: 'policy.bpmWorkflowName.label', default: 'Bpm Workflow Name')}" />
			
				<g:sortableColumn property="policyDescription" title="${message(code: 'policy.policyDescription.label', default: 'Policy Description')}" />
			
				<g:sortableColumn property="policyName" title="${message(code: 'policy.policyName.label', default: 'Policy Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${policyInstanceList}" status="i" var="policyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${policyInstance.id}">${fieldValue(bean: policyInstance, field: "bpmWorkflowName")}</g:link></td>
			
				<td>${fieldValue(bean: policyInstance, field: "policyDescription")}</td>
			
				<td>${fieldValue(bean: policyInstance, field: "policyName")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${policyInstanceTotal}" />
	</div>
</section>

</body>

</html>
