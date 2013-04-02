
<%@ page import="com.dunningtime.domains.Customer" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-customer" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customer.customerName.label" default="Customer Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "customerName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customer.invoices.label" default="Invoices" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${customerInstance.invoices}" var="i">
						<li><g:link controller="invoice" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="customer.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: customerInstance, field: "status")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
