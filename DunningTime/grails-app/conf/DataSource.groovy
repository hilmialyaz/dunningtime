dataSource {
	pooled = true
	dialect = "org.hibernate.dialect.PostgreSQLDialect"
	driverClassName = "org.postgresql.Driver"
	username = "jbilling"
	password = "jbilling"
}

hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql://localhost:5432/dunning"
		}
	}

	test {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:postgresql://localhost:5432/dunning"
		}
	}

	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql://localhost:5432/dunning"
		}
	}
}