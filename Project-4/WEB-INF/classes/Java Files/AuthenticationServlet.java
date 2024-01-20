/* Name: Rebecca Pina Partidas
Course: CNT 4714 – Fall 2023 – Project Four
Assignment title: A Three-Tier Distributed Web-Based Application
Date: November 5, 2023
*/

import java.util.Properties;
import java.util.Scanner;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;

@SuppressWarnings("serial")
public class AuthenticationServlet extends HttpServlet{
   
	@Override
	protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException  
	{
		String location = "";
		String usrNameInput = request.getParameter( "username" );
		String pswInput = request.getParameter( "password" );
		String usrNameCredentials = "";
		String pswCredentials = "";
		String credentials;
		
		boolean foundUsrName;
		boolean foundPsw;
		boolean usrCredentialsOK = false;
		
		File credentialsFile = new File("/Library/Tomcat10116/webapps/Project-4/WEB-INF/lib/credentials.txt");
		FileReader credentialsFileReader = null;
		BufferedReader credentialsFileBufferedReader = null;
		Scanner aScanner = null;
		
		try {
			credentialsFileReader = new FileReader(credentialsFile);
			credentialsFileBufferedReader = new BufferedReader(credentialsFileReader);
			credentials = credentialsFileBufferedReader.readLine();
			
			while(credentials != null && !usrCredentialsOK) {
				aScanner = new Scanner(credentials).useDelimiter("\\s*, \\s*");
				usrNameCredentials = aScanner.next();
				
				if (usrNameCredentials.equals(usrNameInput)) {
					foundUsrName = true;
					pswCredentials = aScanner.next();
					
					if (pswCredentials.equals(pswInput)) {
						usrCredentialsOK = true;
						break;
					}
				}
				credentials = credentialsFileBufferedReader.readLine();
			}
		}
		catch(FileNotFoundException fileNotFoundException) {
			fileNotFoundException.printStackTrace();
		}
		catch(IOException ioException) {
			ioException.printStackTrace();

		}
		
		
		if (usrCredentialsOK == true) {
		    if (usrNameInput.equals("root")) 
		        response.sendRedirect("rootHome.jsp");
		   if (usrNameInput.equals("client1")) 
		        response.sendRedirect("clientHome.jsp");
		   if (usrNameInput.equals("dataEntry")) 
		        response.sendRedirect("dataEntryHome.jsp");
		  if (usrNameInput.equals("accountant")) 
		        response.sendRedirect("accountantHome.jsp");
		    }
		 else {
		    // Redirect to the error page
		    response.sendRedirect("errorPage.html");
		}
		
		// Other authentication method
		// Initialization for reading in properties files and placing information in data source
//		Properties userProperties = new Properties();
//		FileInputStream userFilein = null;
//		
//        //read properties file
//	    try {
//	    	
//	    	if (usrNameInput.equals("root")) {
//	    		userFilein = new FileInputStream("/Library/Tomcat10116/webapps/Project-4/WEB-INF/lib/root.properties");
//		    	userProperties.load(userFilein);
//		    	location = "rootHome.jsp";
//	    	}
//	    	else if (usrNameInput.equals("client1")) {
//	    		userFilein = new FileInputStream("/Library/Tomcat10116/webapps/Project-4/WEB-INF/lib/client.properties");
//		    	userProperties.load(userFilein);
//		    	location = "clientHome.jsp";
//	    	}
//	    	else if (usrNameInput.equals("dataEntry")) {
//	    		userFilein = new FileInputStream("/Library/Tomcat10116/webapps/Project-4/WEB-INF/lib/dataEntry.properties");
//		    	userProperties.load(userFilein);
//		    	location = "dataEntryHome.jsp";
//	    	}
//	    	else if (usrNameInput.equals("accountant")) {
//	    		userFilein = new FileInputStream("/Library/Tomcat10116/webapps/Project-4/WEB-INF/lib/accountant.properties");
//		    	userProperties.load(userFilein);
//		    	location = "accountantHome.jsp";
//	    	}
//	    	
//	    	// Gets correct username and password from properties files with proper url for the corresponding database that was chosen
//	    	String reqUsr = userProperties.getProperty("MYSQL_DB_USERNAME");
//	    	String reqPass = userProperties.getProperty("MYSQL_DB_PASSWORD");
//	    	
//	    	// User authentication in order to make connection
//	    	if (reqUsr.equals(usrNameInput) && reqPass.equals(pswInput)) {
//	    		response.sendRedirect(location);
//	    	}
//	    	else {
//	    		response.sendRedirect("errorPage.html");
//	    	}
//	    	
//		}
//	    catch (IOException e1) {
//	   	     e1.printStackTrace();
//	    }  
	      
	   } //end doPost() method
	   
}
