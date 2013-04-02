/* Copyright 2010 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import com.vobject.identity.*
/**
 *
 * @author <a href='mailto:limcheekin@vobject.com'>Lim Chee Kin</a>
 *
 * @since 5.0.beta2
 */

class VacationRequestBootStrap {
	def springSecurityService
	def grailsApplication
	def repositoryService
	
	def init = { servletContext ->
		/* If you are sending username using gmail, you need to uncomment this code block
		 ["mail.smtp.auth":"true",
		 "mail.smtp.socketFactory.port":"465",
		 "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
		 "mail.smtp.socketFactory.fallback":"false",
		 "mail.smtp.starttls.required": "true"].each { k, v ->
		 System.setProperty k, v
		 }
		 */
		environments {
			production { createUsersAndGroups() }
			development { createUsersAndGroups() }
		}
	}
	
	private void createUsersAndGroups() {
 		def userRole = Roles.findByAuthority('ROLE_USER')
		if (!userRole) {
		 userRole = new Roles(authority: 'ROLE_USER', name: 'User')
		 userRole.id = 'ROLE_USER'
		 userRole.save(failOnError: true)
		}
		def managerRole = Roles.findByAuthority('ROLE_MANAGER')
		if (!managerRole) {
		 managerRole = new Roles(authority: 'ROLE_MANAGER', name: 'Manager')
		 managerRole.id = 'ROLE_MANAGER'
		 managerRole.save(failOnError: true)
		}
		def kermit = Users.findByUsername('kermit') ?: new Users(
				username: 'kermit',
				email: 'kermit@object.com',
				firstName: 'Kermit',
				lastName: 'User',
				password: 'kermit',
				enabled: true).save(failOnError: true)
		def fozzie = Users.findByUsername('fozzie') ?: new Users(
				username: 'fozzie',
				email: 'fozzie@object.com',
				firstName: 'Fozzie',
				lastName: 'Management',
				password: 'fozzie',
				enabled: true).save(failOnError: true)
		def peter = Users.findByUsername('peter') ?: new Users(
				username: 'peter',
				email: 'peter@object.com',
				firstName: 'Peter',
				lastName: 'Management',
				password: 'peter',
				enabled: true).save(failOnError: true)
		
		if (!kermit.authorities.contains(userRole)) {
			UsersRoles.create kermit, userRole
		}
		
		if (!fozzie.authorities.contains(managerRole)) {
			UsersRoles.create fozzie, managerRole
		}
		
		if (!peter.authorities.contains(managerRole)) {
			UsersRoles.create peter, managerRole
		}
	

	}
	def destroy = {
	}
}