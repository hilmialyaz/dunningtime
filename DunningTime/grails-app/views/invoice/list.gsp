
<%@ page import="com.dunningtime.domains.Invoice" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-invoice" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="invoice.policy.label" default="Policy" /></th>
			
				<g:sortableColumn property="createdDate" title="${message(code: 'invoice.createdDate.label', default: 'Created Date')}" />
			
				<g:sortableColumn property="currency" title="${message(code: 'invoice.currency.label', default: 'Currency')}" />
			
				<th><g:message code="invoice.customer.label" default="Customer" /></th>
			
				<g:sortableColumn property="dueDate" title="${message(code: 'invoice.dueDate.label', default: 'Due Date')}" />
			
				<th><g:message code="invoice.dunningStatus.label" default="Dunning Status" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${invoiceInstance.id}">${fieldValue(bean: invoiceInstance, field: "policy")}</g:link></td>
			
				<td><g:formatDate date="${invoiceInstance.createdDate}" /></td>
			
				<td>${fieldValue(bean: invoiceInstance, field: "currency")}</td>
			
				<td>${fieldValue(bean: invoiceInstance, field: "customer")}</td>
			
				<td><g:formatDate date="${invoiceInstance.dueDate}" /></td>
			
				<td>${fieldValue(bean: invoiceInstance, field: "dunningStatus")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${invoiceInstanceTotal}" />
	</div>
</section>

</body>

</html>
