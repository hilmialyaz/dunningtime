<%@ page import="com.dunningtime.domains.Customer" %>



			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'customerName', 'error')} ">
				<label for="customerName" class="control-label"><g:message code="customer.customerName.label" default="Customer Name" /></label>
				<div class="controls">
					<g:textField name="customerName" value="${customerInstance?.customerName}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'customerName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'invoices', 'error')} ">
				<label for="invoices" class="control-label"><g:message code="customer.invoices.label" default="Invoices" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${customerInstance?.invoices?}" var="i">
    <li><g:link controller="invoice" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="invoice" action="create" params="['customer.id': customerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'invoice.label', default: 'Invoice')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'invoices', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: customerInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="customer.status.label" default="Status" /></label>
				<div class="controls">
					<g:textField name="status" value="${customerInstance?.status}"/>
					<span class="help-inline">${hasErrors(bean: customerInstance, field: 'status', 'error')}</span>
				</div>
			</div>

