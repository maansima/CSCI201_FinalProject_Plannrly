package Test;


import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletResults
 */
@WebServlet("/ServletResults")
public class ServletResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletResults() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Activity = (String)request.getParameter("Value");
		System.out.println("Activity1:" + Activity);
		Activity = Activity.replaceAll("%", " ");
		Business business = new Business();
		List<Business> businesses = new ArrayList<Business>(); 
		ArrayList<FinalYelpObj> results = (ArrayList<FinalYelpObj>) session.getAttribute("resultList1");
		System.out.println("Activity:" + Activity);
		for(int i = 0; i<results.size();i++) {
			businesses = results.get(i).getBusinesses();
			for(int j = 0; j<businesses.size();j++) {
				System.out.println("Business name: " + businesses.get(j).getName());
				if(((businesses.get(j)).getName().toLowerCase().trim()).contentEquals(Activity.toLowerCase())) {
					System.out.println("Did go in!");
					business = businesses.get(j).withName(Activity);
					break;
				}
				System.out.println("did not go in");
			}
		}		
		String Image = business.getImageUrl();
		String Phone = business.getPhone();
		String URL = business.getUrl();
		String Location2 = business.getLocation().getAddress1();
		Double Latitude = business.getCoordinates().getLatitude();
		Double Longitude = business.getCoordinates().getLongitude();
		String Price = business.getPrice();
		Double Rating = business.getRating();
		request.setAttribute("ImageURL", Image);
		request.setAttribute("PhoneNum", Phone);
		request.setAttribute("YelpURL", URL);
		request.setAttribute("Latitude", Latitude);
		request.setAttribute("Longitude", Longitude);
		request.setAttribute("Price", Price);
		request.setAttribute("Rating", Rating);
		request.setAttribute("Name", Activity);
		request.setAttribute("Location", Location2);
		RequestDispatcher rd = request.getRequestDispatcher("Results.jsp");
		rd.forward(request, response);
		
		
		
		
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
