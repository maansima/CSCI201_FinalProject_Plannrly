package Test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/WaitingLobby")
public class WaitingLobby extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String groupName = request.getParameter("groupName");
		System.out.println(groupName);
		DatabaseHelper db = new DatabaseHelper(); 
		String location = db.GetGroupLocation(groupName);
		int price = db.GetGroupPrice(groupName);
		int numMembers = db.GetMemberCount(groupName);
		String groupActivity = db.GetGroupActivity(groupName);
		System.out.println(location + " " + price + " " + numMembers + " " + groupActivity);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
