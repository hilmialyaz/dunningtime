
<%@ page import="com.dunningtime.domains.Invoice" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-invoice" class="first">
	<g:form action="performApproval">
	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.createdDate.label" default="Created Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${invoiceInstance?.createdDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.currency.label" default="Currency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "currency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.customer.label" default="Customer" /></td>
				
				<td valign="top" class="value"><g:link controller="customer" action="show" id="${invoiceInstance?.customer?.id}">${invoiceInstance?.customer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.dueDate.label" default="Due Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${invoiceInstance?.dueDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.invoiceDate.label" default="Invoice Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${invoiceInstance?.invoiceDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.invoiceDescription.label" default="Invoice Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "invoiceDescription")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.invoiceStatus.label" default="Invoice Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "invoiceStatus")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.isVisible.label" default="Is Visible" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${invoiceInstance?.isVisible}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.payDate.label" default="Pay Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${invoiceInstance?.payDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.referenceNo.label" default="Reference No" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "referenceNo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="invoice.total.label" default="Total" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: invoiceInstance, field: "total")}</td>
				
			</tr>
		
		</tbody>		
	</table>
			<g:hiddenField name="taskId" value="${params.taskId}" />
			<fieldset class="buttons">
				<g:submitButton name="create" class="save" value="${message(code: 'default.button.complete.label', default: 'Complate')}" />
			</fieldset>
	</g:form>
</section>

</body>

</html>
