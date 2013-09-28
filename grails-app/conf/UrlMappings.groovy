class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
              //  "/"(view:"/login/auth")
		"500"(view:'/error')
	}
}
