<%@ page import="com.dunningtime.domains.Policy" %>



			<div class="control-group fieldcontain ${hasErrors(bean: policyInstance, field: 'bpmWorkflowName', 'error')} ">
				<label for="bpmWorkflowName" class="control-label"><g:message code="policy.bpmWorkflowName.label" default="Bpm Workflow Name" /></label>
				<div class="controls">
					<g:textField name="bpmWorkflowName" value="${policyInstance?.bpmWorkflowName}"/>
					<span class="help-inline">${hasErrors(bean: policyInstance, field: 'bpmWorkflowName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: policyInstance, field: 'policyDescription', 'error')} ">
				<label for="policyDescription" class="control-label"><g:message code="policy.policyDescription.label" default="Policy Description" /></label>
				<div class="controls">
					<g:textField name="policyDescription" value="${policyInstance?.policyDescription}"/>
					<span class="help-inline">${hasErrors(bean: policyInstance, field: 'policyDescription', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: policyInstance, field: 'policyName', 'error')} ">
				<label for="policyName" class="control-label"><g:message code="policy.policyName.label" default="Policy Name" /></label>
				<div class="controls">
					<g:textField name="policyName" value="${policyInstance?.policyName}"/>
					<span class="help-inline">${hasErrors(bean: policyInstance, field: 'policyName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: policyInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="policy.status.label" default="Status" /></label>
				<div class="controls">
					<g:select name="status" from="${com.dunningtime.domains.DunningStatus.list()}" multiple="multiple" optionKey="id" size="5" value="${policyInstance?.status*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: policyInstance, field: 'status', 'error')}</span>
				</div>
			</div>

