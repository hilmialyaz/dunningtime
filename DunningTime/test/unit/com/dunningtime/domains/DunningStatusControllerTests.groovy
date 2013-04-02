package com.dunningtime.domains



import org.junit.*
import grails.test.mixin.*

/**
 * DunningStatusControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(DunningStatusController)
@Mock(DunningStatus)
class DunningStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dunningStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dunningStatusInstanceList.size() == 0
        assert model.dunningStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.dunningStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dunningStatusInstance != null
        assert view == '/dunningStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dunningStatus/show/1'
        assert controller.flash.message != null
        assert DunningStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dunningStatus/list'


        populateValidParams(params)
        def dunningStatus = new DunningStatus(params)

        assert dunningStatus.save() != null

        params.id = dunningStatus.id

        def model = controller.show()

        assert model.dunningStatusInstance == dunningStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dunningStatus/list'


        populateValidParams(params)
        def dunningStatus = new DunningStatus(params)

        assert dunningStatus.save() != null

        params.id = dunningStatus.id

        def model = controller.edit()

        assert model.dunningStatusInstance == dunningStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dunningStatus/list'

        response.reset()


        populateValidParams(params)
        def dunningStatus = new DunningStatus(params)

        assert dunningStatus.save() != null

        // test invalid parameters in update
        params.id = dunningStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dunningStatus/edit"
        assert model.dunningStatusInstance != null

        dunningStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dunningStatus/show/$dunningStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dunningStatus.clearErrors()

        populateValidParams(params)
        params.id = dunningStatus.id
        params.version = -1
        controller.update()

        assert view == "/dunningStatus/edit"
        assert model.dunningStatusInstance != null
        assert model.dunningStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dunningStatus/list'

        response.reset()

        populateValidParams(params)
        def dunningStatus = new DunningStatus(params)

        assert dunningStatus.save() != null
        assert DunningStatus.count() == 1

        params.id = dunningStatus.id

        controller.delete()

        assert DunningStatus.count() == 0
        assert DunningStatus.get(dunningStatus.id) == null
        assert response.redirectedUrl == '/dunningStatus/list'
    }
}
