
<%@ page import="com.dunningtime.domains.DunningStatus" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'dunningStatus.label', default: 'DunningStatus')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-dunningStatus" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="daysLateCumulative" title="${message(code: 'dunningStatus.daysLateCumulative.label', default: 'Days Late Cumulative')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'dunningStatus.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'dunningStatus.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="sequenceNumber" title="${message(code: 'dunningStatus.sequenceNumber.label', default: 'Sequence Number')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${dunningStatusInstanceList}" status="i" var="dunningStatusInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${dunningStatusInstance.id}">${fieldValue(bean: dunningStatusInstance, field: "daysLateCumulative")}</g:link></td>
			
				<td>${fieldValue(bean: dunningStatusInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: dunningStatusInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: dunningStatusInstance, field: "sequenceNumber")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${dunningStatusInstanceTotal}" />
	</div>
</section>

</body>

</html>
