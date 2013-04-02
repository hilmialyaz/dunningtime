<%@ page import="com.dunningtime.domains.Invoice" %>



			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'createdDate', 'error')} required">
				<label for="createdDate" class="control-label"><g:message code="invoice.createdDate.label" default="Created Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="createdDate" precision="day"  value="${invoiceInstance?.createdDate}"  />
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'createdDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'currency', 'error')} ">
				<label for="currency" class="control-label"><g:message code="invoice.currency.label" default="Currency" /></label>
				<div class="controls">
					<g:textField name="currency" value="${invoiceInstance?.currency}"/>
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'currency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'customer', 'error')} required">
				<label for="customer" class="control-label"><g:message code="invoice.customer.label" default="Customer" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="customer" name="customer.id" from="${com.dunningtime.domains.Customer.list()}" optionKey="id" required="" value="${invoiceInstance?.customer?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'customer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'dueDate', 'error')} required">
				<label for="dueDate" class="control-label"><g:message code="invoice.dueDate.label" default="Due Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="dueDate" precision="day"  value="${invoiceInstance?.dueDate}"  />
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'dueDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'invoiceDate', 'error')} required">
				<label for="invoiceDate" class="control-label"><g:message code="invoice.invoiceDate.label" default="Invoice Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="invoiceDate" precision="day"  value="${invoiceInstance?.invoiceDate}"  />
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'invoiceDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'invoiceDescription', 'error')} ">
				<label for="invoiceDescription" class="control-label"><g:message code="invoice.invoiceDescription.label" default="Invoice Description" /></label>
				<div class="controls">
					<g:textField name="invoiceDescription" value="${invoiceInstance?.invoiceDescription}"/>
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'invoiceDescription', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'invoiceStatus', 'error')} required">
				<label for="invoiceStatus" class="control-label"><g:message code="invoice.invoiceStatus.label" default="Invoice Status" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="invoiceStatus" required="" value="${invoiceInstance.invoiceStatus}"/>
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'invoiceStatus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'isVisible', 'error')} ">
				<label for="isVisible" class="control-label"><g:message code="invoice.isVisible.label" default="Is Visible" /></label>
				<div class="controls">
					<bs:checkBox name="isVisible" value="${invoiceInstance?.isVisible}" />
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'isVisible', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'payDate', 'error')} required">
				<label for="payDate" class="control-label"><g:message code="invoice.payDate.label" default="Pay Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="payDate" precision="day"  value="${invoiceInstance?.payDate}"  />
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'payDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'referenceNo', 'error')} ">
				<label for="referenceNo" class="control-label"><g:message code="invoice.referenceNo.label" default="Reference No" /></label>
				<div class="controls">
					<g:textField name="referenceNo" value="${invoiceInstance?.referenceNo}"/>
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'referenceNo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'total', 'error')} required">
				<label for="total" class="control-label"><g:message code="invoice.total.label" default="Total" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="total" step="any" required="" value="${invoiceInstance.total}"/>
					<span class="help-inline">${hasErrors(bean: invoiceInstance, field: 'total', 'error')}</span>
				</div>
			</div>

