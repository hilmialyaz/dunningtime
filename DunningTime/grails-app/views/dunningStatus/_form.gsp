<%@ page import="com.dunningtime.domains.DunningStatus" %>



			<div class="control-group fieldcontain ${hasErrors(bean: dunningStatusInstance, field: 'daysLateCumulative', 'error')} required">
				<label for="daysLateCumulative" class="control-label"><g:message code="dunningStatus.daysLateCumulative.label" default="Days Late Cumulative" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="daysLateCumulative" required="" value="${dunningStatusInstance.daysLateCumulative}"/>
					<span class="help-inline">${hasErrors(bean: dunningStatusInstance, field: 'daysLateCumulative', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: dunningStatusInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="dunningStatus.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${dunningStatusInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: dunningStatusInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: dunningStatusInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="dunningStatus.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${dunningStatusInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: dunningStatusInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: dunningStatusInstance, field: 'sequenceNumber', 'error')} required">
				<label for="sequenceNumber" class="control-label"><g:message code="dunningStatus.sequenceNumber.label" default="Sequence Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="sequenceNumber" required="" value="${dunningStatusInstance.sequenceNumber}"/>
					<span class="help-inline">${hasErrors(bean: dunningStatusInstance, field: 'sequenceNumber', 'error')}</span>
				</div>
			</div>

