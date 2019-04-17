

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Test.DatabaseHelper;

/**
 * Servlet implementation class ServletProfile
 */
@WebServlet("/ServletProfile")
public class ServletProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Integer> dayWeek = new ArrayList<Integer>();
		ArrayList<String> compare = new ArrayList<String> ();
		ArrayList<String> Groups = new ArrayList<String>();
		DatabaseHelper db = new DatabaseHelper();
		HttpSession session = request.getSession();
		//set calendar
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DAY_OF_MONTH,1);
		System.out.println(c.getTime());

		for(int i = 0; i<7;i++) {
			dayWeek.add((c.get(Calendar.DAY_OF_WEEK))); 
			c.add(Calendar.DATE, 1);
			System.out.println("Day of Week" + c.get(Calendar.DAY_OF_WEEK));
		}
		for(int i = 0; i<7;i++) {
			if(dayWeek.get(i) == 1) {
				compare.add("Sunday");
			}
			if(dayWeek.get(i) == 2) {
				compare.add("Monday");
			}
			if(dayWeek.get(i) == 3) {
				compare.add("Tuesday");
			}
			if(dayWeek.get(i) == 4) {
				compare.add("Wednesday");
			}
			if(dayWeek.get(i) == 5) {
				compare.add("Thursday");
			}
			if(dayWeek.get(i) == 6) {
				compare.add("Friday");
			}
			if(dayWeek.get(i) == 7) {
				compare.add("Saturday");
			}
		}
		
		//set groups
		Groups = db.GetGroups((Integer)session.getAttribute("loginID"));
		
		request.setAttribute("groups", Groups);
		request.setAttribute("weekdays", compare);
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Profile.jsp");
		dispatch.forward(request,response);
		
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
