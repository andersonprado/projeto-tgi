
package mack.tgi.web;

import org.mortbay.jetty.Server;
import org.mortbay.jetty.nio.SelectChannelConnector;
import org.mortbay.jetty.webapp.WebAppContext;

public class StartWeb {

	public static void main(String[] args) throws Exception {
	    Server server = new Server();

	    SelectChannelConnector connector = new SelectChannelConnector();
	    connector.setPort(8090);
	    server.addConnector(connector);

	    WebAppContext webApp = new WebAppContext();
	    webApp.setContextPath("/tgi");
	    webApp.setWar("src/webapp");
	    server.setHandler(webApp);
	    server.start();
	    server.join();
	  }
}
