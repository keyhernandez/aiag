package aiag



import org.junit.*
import grails.test.mixin.*

@TestFor(CargoController)
@Mock(Cargo)
class CargoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cargo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cargoInstanceList.size() == 0
        assert model.cargoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cargoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cargoInstance != null
        assert view == '/cargo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cargo/show/1'
        assert controller.flash.message != null
        assert Cargo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cargo/list'

        populateValidParams(params)
        def cargo = new Cargo(params)

        assert cargo.save() != null

        params.id = cargo.id

        def model = controller.show()

        assert model.cargoInstance == cargo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cargo/list'

        populateValidParams(params)
        def cargo = new Cargo(params)

        assert cargo.save() != null

        params.id = cargo.id

        def model = controller.edit()

        assert model.cargoInstance == cargo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cargo/list'

        response.reset()

        populateValidParams(params)
        def cargo = new Cargo(params)

        assert cargo.save() != null

        // test invalid parameters in update
        params.id = cargo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cargo/edit"
        assert model.cargoInstance != null

        cargo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cargo/show/$cargo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cargo.clearErrors()

        populateValidParams(params)
        params.id = cargo.id
        params.version = -1
        controller.update()

        assert view == "/cargo/edit"
        assert model.cargoInstance != null
        assert model.cargoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cargo/list'

        response.reset()

        populateValidParams(params)
        def cargo = new Cargo(params)

        assert cargo.save() != null
        assert Cargo.count() == 1

        params.id = cargo.id

        controller.delete()

        assert Cargo.count() == 0
        assert Cargo.get(cargo.id) == null
        assert response.redirectedUrl == '/cargo/list'
    }
}
