package com.vobject.identity

class Users {

	transient springSecurityService

	
	String id
	String username
	String email
	String firstName
	String lastName
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email email: true, blank: false, unique: true
		firstName blank: false
		lastName blank: false
	}

	static mapping = {
		password column: '`password`'
		id generator: 'uuid'
	}

	Set<Roles> getAuthorities() {
		UsersRoles.findAllByUsers(this).collect { it.roles } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
