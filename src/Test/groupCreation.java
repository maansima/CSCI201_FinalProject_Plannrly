package Test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//price, location, type of activity 
@WebServlet("/groupCreation")
public class groupCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String groupName = request.getParameter("name");
		String memberNames = request.getParameter("members");
		String cityName = request.getParameter("cityName");
		String activityType = request.getParameter("activityType");
		String price = request.getParameter("price");
		int priceInt = 1;
		if(price.contentEquals("$$")) {
			priceInt = 2; 
		}
		else if(price.contentEquals("$$$")) {
			priceInt = 3; 
		}
		else if(price.contentEquals("$$$$")) {
			priceInt = 4; 
		}
		
		
		Vector<String> members = new Vector<String>(Arrays.asList(memberNames.split(" , ")));
		
		DatabaseHelper dh = new DatabaseHelper(); 
		
		try {
			dh.createGroup(groupName, members, cityName, priceInt, activityType);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
