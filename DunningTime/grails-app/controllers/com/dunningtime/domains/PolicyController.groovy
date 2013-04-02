package com.dunningtime.domains

import org.springframework.dao.DataIntegrityViolationException

/**
 * PolicyController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PolicyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [policyInstanceList: Policy.list(params), policyInstanceTotal: Policy.count()]
    }

    def create() {
        [policyInstance: new Policy(params)]
    }

    def save() {
        def policyInstance = new Policy(params)
        if (!policyInstance.save(flush: true)) {
            render(view: "create", model: [policyInstance: policyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'policy.label', default: 'Policy'), policyInstance.id])
        redirect(action: "show", id: policyInstance.id)
    }

    def show() {
        def policyInstance = Policy.get(params.id)
        if (!policyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'policy.label', default: 'Policy'), params.id])
            redirect(action: "list")
            return
        }

        [policyInstance: policyInstance]
    }

    def edit() {
        def policyInstance = Policy.get(params.id)
        if (!policyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'policy.label', default: 'Policy'), params.id])
            redirect(action: "list")
            return
        }

        [policyInstance: policyInstance]
    }

    def update() {
        def policyInstance = Policy.get(params.id)
        if (!policyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'policy.label', default: 'Policy'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (policyInstance.version > version) {
                policyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'policy.label', default: 'Policy')] as Object[],
                          "Another user has updated this Policy while you were editing")
                render(view: "edit", model: [policyInstance: policyInstance])
                return
            }
        }

        policyInstance.properties = params

        if (!policyInstance.save(flush: true)) {
            render(view: "edit", model: [policyInstance: policyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'policy.label', default: 'Policy'), policyInstance.id])
        redirect(action: "show", id: policyInstance.id)
    }

    def delete() {
        def policyInstance = Policy.get(params.id)
        if (!policyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'policy.label', default: 'Policy'), params.id])
            redirect(action: "list")
            return
        }

        try {
            policyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'policy.label', default: 'Policy'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'policy.label', default: 'Policy'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
