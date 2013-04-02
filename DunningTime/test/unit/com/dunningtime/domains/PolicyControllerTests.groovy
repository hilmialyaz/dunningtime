package com.dunningtime.domains



import org.junit.*
import grails.test.mixin.*

/**
 * PolicyControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PolicyController)
@Mock(Policy)
class PolicyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/policy/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.policyInstanceList.size() == 0
        assert model.policyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.policyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.policyInstance != null
        assert view == '/policy/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/policy/show/1'
        assert controller.flash.message != null
        assert Policy.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/policy/list'


        populateValidParams(params)
        def policy = new Policy(params)

        assert policy.save() != null

        params.id = policy.id

        def model = controller.show()

        assert model.policyInstance == policy
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/policy/list'


        populateValidParams(params)
        def policy = new Policy(params)

        assert policy.save() != null

        params.id = policy.id

        def model = controller.edit()

        assert model.policyInstance == policy
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/policy/list'

        response.reset()


        populateValidParams(params)
        def policy = new Policy(params)

        assert policy.save() != null

        // test invalid parameters in update
        params.id = policy.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/policy/edit"
        assert model.policyInstance != null

        policy.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/policy/show/$policy.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        policy.clearErrors()

        populateValidParams(params)
        params.id = policy.id
        params.version = -1
        controller.update()

        assert view == "/policy/edit"
        assert model.policyInstance != null
        assert model.policyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/policy/list'

        response.reset()

        populateValidParams(params)
        def policy = new Policy(params)

        assert policy.save() != null
        assert Policy.count() == 1

        params.id = policy.id

        controller.delete()

        assert Policy.count() == 0
        assert Policy.get(policy.id) == null
        assert response.redirectedUrl == '/policy/list'
    }
}
