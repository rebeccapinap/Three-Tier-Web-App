/* Name: Rebecca Pina Partidas
Course: CNT 4714 – Fall 2023 – Project Four
Assignment title: A Three-Tier Distributed Web-Based Application
Date: November 5, 2023
*/

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.*;
import java.util.Properties;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;

@SuppressWarnings("serial")
public class ClientUserServlet extends HttpServlet{
	private Connection connection;
	private Statement statement;

	@Override
	protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException  
	{
		String table = "";
		String sqlCommand = request.getParameter( "query" );
		sqlCommand = sqlCommand.trim();
		
		Properties properties = new Properties();
	    FileInputStream filein = null;
	    MysqlDataSource dataSource = null;
	    
	    //read a properties file
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	filein = new FileInputStream("/Library/Tomcat10116/webapps/Project-4/WEB-INF/lib/client.properties");
	    	properties.load(filein);
	    	dataSource = new MysqlDataSource();
	    	dataSource.setURL(properties.getProperty("MYSQL_DB_URL"));
	    	dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
	    	dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));	 
	    	connection = dataSource.getConnection();
		    statement = connection.createStatement();
	    }
	    catch (SQLException e){
			e.printStackTrace();	
		}
	    catch (IOException e) {
	    	e.printStackTrace();
	    } 
	    catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		if (sqlCommand.toLowerCase().startsWith("select")) {
		    try {
		    	session.setAttribute("data", "");
		    	ResultSet totalRS = statement.executeQuery( sqlCommand );
		    	table = ResultSetToHTMLFormatterClass.getHtmlRows(totalRS);
		    	session.setAttribute("data", table);
		    	session.setAttribute("success", " ");
		    	session.setAttribute("businessLogic", " ");
		    	session.setAttribute("error", " ");
			}
		    catch (SQLException e) {
		    	session.setAttribute("data", "");
		    	session.setAttribute("success", " ");
		    	session.setAttribute("businessLogic", " ");
		    	session.setAttribute("error", "<span style = \"font-weight:bold;\">Error executing the SQL statement:</span><br>" + e.getMessage());
				e.printStackTrace();
			}  
		}
		else {
			
			try {
		    	statement.executeUpdate( sqlCommand );
		    		
			}
		    catch (SQLException e) {
		    	session.setAttribute("data", "");
		    	session.setAttribute("success", " ");
		    	session.setAttribute("businessLogic", " ");
		    	session.setAttribute("error", "<span style = \"font-weight:bold;\">Error executing the SQL statement:</span><br>" + e.getMessage());
		    	e.printStackTrace();
			}  
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/clientHome.jsp");
		dispatcher.forward(request, response);
	    
	    try 
	    {
	       statement.close();
	       connection.close();
	    } // end try
	      // handle database exceptions by returning error to client
	    catch( SQLException sqlException ) 
	    {
	       sqlException.printStackTrace();
	    } // end catch
	      
	   } //end doPost() method

}

