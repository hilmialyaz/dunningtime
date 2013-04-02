<%@ page import="vacationRequest.VacationRequest" %>



			<div class="control-group fieldcontain ${hasErrors(bean: vacationRequestInstance, field: 'employeeName', 'error')} required">
				<label for="employeeName" class="control-label"><g:message code="vacationRequest.employeeName.label" default="Employee Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="employeeName" maxlength="50" required="" value="${vacationRequestInstance?.employeeName}"/>
					<span class="help-inline">${hasErrors(bean: vacationRequestInstance, field: 'employeeName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: vacationRequestInstance, field: 'numberOfDays', 'error')} required">
				<label for="numberOfDays" class="control-label"><g:message code="vacationRequest.numberOfDays.label" default="Number Of Days" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="numberOfDays" from="${1..14}" class="range" required="" value="${fieldValue(bean: vacationRequestInstance, field: 'numberOfDays')}"/>
					<span class="help-inline">${hasErrors(bean: vacationRequestInstance, field: 'numberOfDays', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: vacationRequestInstance, field: 'vacationDescription', 'error')} required">
				<label for="vacationDescription" class="control-label"><g:message code="vacationRequest.vacationDescription.label" default="Vacation Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="vacationDescription" cols="40" rows="5" maxlength="255" required="" value="${vacationRequestInstance?.vacationDescription}"/>
					<span class="help-inline">${hasErrors(bean: vacationRequestInstance, field: 'vacationDescription', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: vacationRequestInstance, field: 'approvalStatus', 'error')} required">
				<label for="approvalStatus" class="control-label"><g:message code="vacationRequest.approvalStatus.label" default="Approval Status" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="approvalStatus" from="${org.grails.activiti.ApprovalStatus?.values()}" keys="${org.grails.activiti.ApprovalStatus.values()*.name()}" required="" value="${vacationRequestInstance?.approvalStatus?.name()}"/>
					<span class="help-inline">${hasErrors(bean: vacationRequestInstance, field: 'approvalStatus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: vacationRequestInstance, field: 'approvalRemark', 'error')} ">
				<label for="approvalRemark" class="control-label"><g:message code="vacationRequest.approvalRemark.label" default="Approval Remark" /></label>
				<div class="controls">
					<g:textField name="approvalRemark" value="${vacationRequestInstance?.approvalRemark}"/>
					<span class="help-inline">${hasErrors(bean: vacationRequestInstance, field: 'approvalRemark', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: vacationRequestInstance, field: 'resendRequest', 'error')} ">
				<label for="resendRequest" class="control-label"><g:message code="vacationRequest.resendRequest.label" default="Resend Request" /></label>
				<div class="controls">
					<bs:checkBox name="resendRequest" value="${vacationRequestInstance?.resendRequest}" />
					<span class="help-inline">${hasErrors(bean: vacationRequestInstance, field: 'resendRequest', 'error')}</span>
				</div>
			</div>

