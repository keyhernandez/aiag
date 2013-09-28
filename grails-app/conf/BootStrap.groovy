import aiag.SecUser
import aiag.SecRole
class BootStrap {

    def init = { servletContext ->
//        if(!SecUser.count()){
//			/*The default password is 'password'*/
//			def password = 'password'
//			def user = new SecUser(username : 'praveen', password:password,enabled:true,
//				accountExpired : false , accountLocked : false ,passwordExpired : false).save(flush: true, insert: true)
//			def role = new SecRole(authority : 'ROLE_USER').save(flush: true, insert: true)
//			
//			/*create the first user role map*/
//			SecUserSecRole.create user , role , true
//		}
    }
    def destroy = {
    }
}
