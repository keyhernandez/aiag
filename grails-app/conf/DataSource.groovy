//dataSource {
//    pooled = true
//    driverClassName = "org.h2.Driver"
//    username = "sa"
//    password = ""
//}
//hibernate {
//    cache.use_second_level_cache = true
//    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
//}
//// environment specific settings
//environments {
//    development {
//        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//        }
//    }
//    test {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//        }
//    }
//    production {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            pooled = true
//            properties {
//               maxActive = -1
//               minEvictableIdleTimeMillis=1800000
//               timeBetweenEvictionRunsMillis=1800000
//               numTestsPerEvictionRun=3
//               testOnBorrow=true
//               testWhileIdle=true
//               testOnReturn=true
//               validationQuery="SELECT 1"
//            }
//        }
//    }
//}


dataSource {
	pooled = true
	driverClassName = "org.postgresql.Driver"
	username = "postgres"
	password = "123456"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql:aiag"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql:aiag"
		}
	}
	production {
//		dataSource {
//			dbCreate = "update"
//			url = "jdbc:postgresql:aiag"
//		}
dataSource {
        dbCreate = "update"
        driverClassName = "org.postgresql.Driver"
        dialect = org.hibernate.dialect.PostgreSQLDialect
    
        uri = new URI(System.env.DATABASE_URL?:"postgres://wkoitqnfwkpkjg:h35QATGbuu8bhYZSnMr9NI2AmK@ec2-54-227-243-78.compute-1.amazonaws.com:5432/d2njgsgg9pruvs")

        url = "jdbc:postgresql://"+uri.host+uri.path
        username = uri.userInfo.split(":")[0]
        password = uri.userInfo.split(":")[1]
    }
	}
}
