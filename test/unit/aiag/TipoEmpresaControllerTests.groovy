package aiag



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoEmpresaController)
@Mock(TipoEmpresa)
class TipoEmpresaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoEmpresa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoEmpresaInstanceList.size() == 0
        assert model.tipoEmpresaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoEmpresaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoEmpresaInstance != null
        assert view == '/tipoEmpresa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoEmpresa/show/1'
        assert controller.flash.message != null
        assert TipoEmpresa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoEmpresa/list'

        populateValidParams(params)
        def tipoEmpresa = new TipoEmpresa(params)

        assert tipoEmpresa.save() != null

        params.id = tipoEmpresa.id

        def model = controller.show()

        assert model.tipoEmpresaInstance == tipoEmpresa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoEmpresa/list'

        populateValidParams(params)
        def tipoEmpresa = new TipoEmpresa(params)

        assert tipoEmpresa.save() != null

        params.id = tipoEmpresa.id

        def model = controller.edit()

        assert model.tipoEmpresaInstance == tipoEmpresa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoEmpresa/list'

        response.reset()

        populateValidParams(params)
        def tipoEmpresa = new TipoEmpresa(params)

        assert tipoEmpresa.save() != null

        // test invalid parameters in update
        params.id = tipoEmpresa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoEmpresa/edit"
        assert model.tipoEmpresaInstance != null

        tipoEmpresa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoEmpresa/show/$tipoEmpresa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoEmpresa.clearErrors()

        populateValidParams(params)
        params.id = tipoEmpresa.id
        params.version = -1
        controller.update()

        assert view == "/tipoEmpresa/edit"
        assert model.tipoEmpresaInstance != null
        assert model.tipoEmpresaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoEmpresa/list'

        response.reset()

        populateValidParams(params)
        def tipoEmpresa = new TipoEmpresa(params)

        assert tipoEmpresa.save() != null
        assert TipoEmpresa.count() == 1

        params.id = tipoEmpresa.id

        controller.delete()

        assert TipoEmpresa.count() == 0
        assert TipoEmpresa.get(tipoEmpresa.id) == null
        assert response.redirectedUrl == '/tipoEmpresa/list'
    }
}
