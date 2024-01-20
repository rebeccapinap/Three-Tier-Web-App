/* Name: Rebecca Pina Partidas
Course: CNT 4714 – Fall 2023 – Project Four
Assignment title: A Three-Tier Distributed Web-Based Application
Date: November 5, 2023
*/

import java.sql.*;

public class ResultSetToHTMLFormatterClass {
	
	public static synchronized String getHtmlRows(ResultSet results) throws SQLException {
		StringBuilder resultsHtml = new StringBuilder("<table border=\"1\">");
		int counter = 0;

        // Generate table header from ResultSet's column names
		resultsHtml.append("<tr>");
        int numColumn = results.getMetaData().getColumnCount();
        for (int i = 1; i <= numColumn; i++) {
        	resultsHtml.append("<th>").append(results.getMetaData().getColumnLabel(i)).append("</th>");
        }
        resultsHtml.append("</tr>");

        // Generate table rows from ResultSet's data
        while (results.next()) {
        	if (counter % 2 == 0) {
        		resultsHtml.append("<tr style = \"background-color: darkgrey;\">");
        	}
        	else {
        		resultsHtml.append("<tr style = \"background-color: lightgray;\">");
        	}
        	
            for (int i = 1; i <= numColumn; i++) {
            	resultsHtml.append("<td>").append(results.getString(i)).append("</td>");
            }
            counter++;
            resultsHtml.append("</tr>");
        }

        resultsHtml.append("</table>");
        
        return resultsHtml.toString();
	}
}
