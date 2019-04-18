package Test;

import java.io.IOException;

import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//price, location, type of activity 
@WebServlet("/groupCreation")
public class groupCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String groupName = request.getParameter("name");
		String memberNames = request.getParameter("members");
		String cityName = request.getParameter("cityName");
		String activityType = request.getParameter("activityType");
		String price = request.getParameter("price");
		Integer username = (Integer) session.getAttribute("loginID");
		DatabaseHelper db = new DatabaseHelper();
		if(groupName == null || groupName.equals("") || memberNames == null || memberNames.equals("") ||
				cityName == null || cityName.equals("") || activityType == null || price == null) {
			request.setAttribute("error", "blank");
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CreateGroup.jsp");
			dispatch.forward(request,response);
			return;
		}
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
		
		String[] members = memberNames.split(",");
		for(int i = 0; i<members.length;i++) {
			System.out.println("Member" + i + ": " + members[i]);
			try {
				if(db.validateLogin(members[i].trim(), "password") == 3) {
					request.setAttribute("error", "user");
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CreateGroup.jsp");
					dispatch.forward(request,response);
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Vector<String> GroupMembers = new Vector<String>();
		for(int i = 0; i<members.length;i++) {
			GroupMembers.add(members[i]);
		}
				
		try {
			db.createGroup(groupName, GroupMembers, cityName, priceInt, activityType);
		} catch (SQLException e) {
			System.out.println("error in creating group : " + e.getMessage());
		}
		request.setAttribute("numGroup", members.length);
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/WaitingLobby.jsp");
		dispatch.forward(request,response);
		
		
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
