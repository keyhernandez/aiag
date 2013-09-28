package aiag



import org.junit.*
import grails.test.mixin.*

@TestFor(ProduccionController)
@Mock(Produccion)
class ProduccionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/produccion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.produccionInstanceList.size() == 0
        assert model.produccionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.produccionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.produccionInstance != null
        assert view == '/produccion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/produccion/show/1'
        assert controller.flash.message != null
        assert Produccion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/produccion/list'

        populateValidParams(params)
        def produccion = new Produccion(params)

        assert produccion.save() != null

        params.id = produccion.id

        def model = controller.show()

        assert model.produccionInstance == produccion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/produccion/list'

        populateValidParams(params)
        def produccion = new Produccion(params)

        assert produccion.save() != null

        params.id = produccion.id

        def model = controller.edit()

        assert model.produccionInstance == produccion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/produccion/list'

        response.reset()

        populateValidParams(params)
        def produccion = new Produccion(params)

        assert produccion.save() != null

        // test invalid parameters in update
        params.id = produccion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/produccion/edit"
        assert model.produccionInstance != null

        produccion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/produccion/show/$produccion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        produccion.clearErrors()

        populateValidParams(params)
        params.id = produccion.id
        params.version = -1
        controller.update()

        assert view == "/produccion/edit"
        assert model.produccionInstance != null
        assert model.produccionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/produccion/list'

        response.reset()

        populateValidParams(params)
        def produccion = new Produccion(params)

        assert produccion.save() != null
        assert Produccion.count() == 1

        params.id = produccion.id

        controller.delete()

        assert Produccion.count() == 0
        assert Produccion.get(produccion.id) == null
        assert response.redirectedUrl == '/produccion/list'
    }
}
