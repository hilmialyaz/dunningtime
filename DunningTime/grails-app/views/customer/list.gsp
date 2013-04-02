
<%@ page import="com.dunningtime.domains.Customer" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-customer" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="customerName" title="${message(code: 'customer.customerName.label', default: 'Customer Name')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'customer.status.label', default: 'Status')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${customerInstanceList}" status="i" var="customerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "customerName")}</g:link></td>
			
				<td>${fieldValue(bean: customerInstance, field: "status")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${customerInstanceTotal}" />
	</div>
</section>

</body>

</html>
