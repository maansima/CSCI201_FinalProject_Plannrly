package Test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;


/**
 * Servlet implementation class YelpApiTester
 */
@WebServlet("/YelpApiTester")
public class YelpApiTester extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cityName= request.getParameter("cityName");
		String locJson = HttpRequest.get("https://api.yelp.com/v3/businesses/search?location="+cityName+"&Authorization=8l5DNfHJpSXq6t2-g8r5L0X3ps2fmQInSa8JPUIwhVRR-BjCGN51tn_eVeNhnsKmrYcyD2RnmIGB5g-itm4LnxB8AyUYcqgfZ9tccSEfxAc2vxYK8S4Qsm0-Q22pXHYx").body();
		System.out.println(locJson);
//		try {
//			Gson gson = new Gson();
//			WeatherJSOBJ locWeather= gson.fromJson(locJson, WeatherJSOBJ.class);
//			results.add(locWeather);	
//		}catch(JsonSyntaxException e) {
//			String empty= "No Results";
//			request.setAttribute("cityName", empty);
//		}
	}


}
