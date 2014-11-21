package scripts.api

import scripts.libs.Cookies
import scripts.api.impl.alfresco.AlfContentServices;
import scripts.api.impl.alfresco.AlfClipboardServices;
import scripts.api.impl.subsystems.deployment.SpringDeploymentServices;

/**
 * workflow services
 */
class ServiceFactory {
	
	static createContext(applicationContext, request) {
		def context = [:]
		context.token = ""
		context.applicationContext = applicationContext

		if(request != null) {
			context.token = Cookies.getCookieValue("ccticket", request) 
		
			if(context.token == null) {
				context.token = request.getParameter("ticket")
			}
		}

		return context
	}

	/**
     * return the implementation for content services
	 */
	static getContentServices(context) {
		return new AlfContentServices(context)
	}

    /**
     * return the implementation for clipboard services
     *
     * @param context site context
     * @return ClipboardServices
     */
    static getClipboardServices(context) {
        return new AlfClipboardServices(context)
    }

	/**
	 * return the implementation for deployment services
	 *
	 * @param context site context
	 * @return DeploymentServices
	 */
	static getDeploymentServices(context) {
		return new SpringDeploymentServices(context)
	}
}