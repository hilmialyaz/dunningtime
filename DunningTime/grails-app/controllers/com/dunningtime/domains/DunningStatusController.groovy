package com.dunningtime.domains

import org.springframework.dao.DataIntegrityViolationException

/**
 * DunningStatusController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DunningStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dunningStatusInstanceList: DunningStatus.list(params), dunningStatusInstanceTotal: DunningStatus.count()]
    }

    def create() {
        [dunningStatusInstance: new DunningStatus(params)]
    }

    def save() {
        def dunningStatusInstance = new DunningStatus(params)
        if (!dunningStatusInstance.save(flush: true)) {
            render(view: "create", model: [dunningStatusInstance: dunningStatusInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), dunningStatusInstance.id])
        redirect(action: "show", id: dunningStatusInstance.id)
    }

    def show() {
        def dunningStatusInstance = DunningStatus.get(params.id)
        if (!dunningStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), params.id])
            redirect(action: "list")
            return
        }

        [dunningStatusInstance: dunningStatusInstance]
    }

    def edit() {
        def dunningStatusInstance = DunningStatus.get(params.id)
        if (!dunningStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), params.id])
            redirect(action: "list")
            return
        }

        [dunningStatusInstance: dunningStatusInstance]
    }

    def update() {
        def dunningStatusInstance = DunningStatus.get(params.id)
        if (!dunningStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (dunningStatusInstance.version > version) {
                dunningStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dunningStatus.label', default: 'DunningStatus')] as Object[],
                          "Another user has updated this DunningStatus while you were editing")
                render(view: "edit", model: [dunningStatusInstance: dunningStatusInstance])
                return
            }
        }

        dunningStatusInstance.properties = params

        if (!dunningStatusInstance.save(flush: true)) {
            render(view: "edit", model: [dunningStatusInstance: dunningStatusInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), dunningStatusInstance.id])
        redirect(action: "show", id: dunningStatusInstance.id)
    }

    def delete() {
        def dunningStatusInstance = DunningStatus.get(params.id)
        if (!dunningStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), params.id])
            redirect(action: "list")
            return
        }

        try {
            dunningStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dunningStatus.label', default: 'DunningStatus'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
