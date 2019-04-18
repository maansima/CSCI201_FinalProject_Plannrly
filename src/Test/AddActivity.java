package Test;


import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddActivity
 */
@WebServlet("/AddActivity")
public class AddActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DatabaseHelper db = new DatabaseHelper();
		
		String ActivityDate = (String)request.getParameter("activitystart");
		System.out.println(ActivityDate);
		String ActivityName = (String)request.getParameter("Name");
		ActivityName = ActivityName.replace("*", " ");
		System.out.println(ActivityName);
		String ActivityTimeStr = (String)request.getParameter("time");
		Integer ActivityTime;
		if(ActivityTimeStr == "Morning") {
			ActivityTime = 1;
		}
		else if (ActivityTimeStr == "Afternoon") {
			ActivityTime = 2;
		}
		else {
			ActivityTime = 3;
		}
		Integer ActivityDay = Integer.parseInt((ActivityDate.split("-"))[2]);
		HttpSession session = request.getSession();
		Integer LoginID = (Integer)session.getAttribute("loginID");
		System.out.println(LoginID);
		db.addActivity(ActivityName, LoginID, ActivityTime, ActivityDay);

		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
