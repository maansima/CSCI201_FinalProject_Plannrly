package Test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

/**
 * Servlet implementation class PostWaitingServ
 */
@WebServlet("/PostWaitingServ")
public class PostWaitingServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostWaitingServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cityName = request.getParameter("actLoc");
		String activityType = request.getParameter("typeAct");
		String price = request.getParameter("actPrice");
		String groupName  = request.getParameter("gName");
		String numMems  = request.getParameter("numMem");
		request.setAttribute("groupName", groupName);
		if(cityName == "" || activityType == "") {
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
		}
		System.out.println(activityType);
		StringBuilder sb = new StringBuilder(); //for Json response
		ArrayList<FinalYelpObj> results = new ArrayList<FinalYelpObj>(); // array for yelp results 
		String cityString = cityName.trim();
		cityString = cityString.replaceAll("\\s", "%");
		System.out.println(cityString);
		try {
			String url;
			if(activityType!=null) {
				url = "https://api.yelp.com/v3/businesses/search?location="+cityString+"&categories="+activityType+"&price="+price;
			}
			else
				url= "https://api.yelp.com/v3/businesses/search?location="+cityString;
            String token= "8l5DNfHJpSXq6t2-g8r5L0X3ps2fmQInSa8JPUIwhVRR-BjCGN51tn_eVeNhnsKmrYcyD2RnmIGB5g-itm4LnxB8AyUYcqgfZ9tccSEfxAc2vxYK8S4Qsm0-Q22pXHYx";
            URL object = new URL(url);
            HttpURLConnection con = (HttpURLConnection) object.openConnection();
            con.setDoInput(true);
            con.setRequestMethod("GET");
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            con.setRequestProperty("Accept", "application/json");
            con.setRequestProperty("Authorization", "Bearer " + token);

            //Display what the GET request returns
            int HttpResult = con.getResponseCode();
            if (HttpResult == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(con.getInputStream(), "utf-8"));
                String line = null;
                while ((line = br.readLine()) != null) {
                    sb.append(line + "\n");
                }
                br.close();
            } else {
                System.out.println(con.getResponseMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
		try {
			Gson gson = new Gson();
			FinalYelpObj location= gson.fromJson(sb.toString(), FinalYelpObj.class);
			results.add(location);	
		}catch(JsonSyntaxException e) {
			String empty= "No Results";
			request.setAttribute("cityName", empty);
		}
		request.setAttribute("resultList", results);

		HttpSession session = request.getSession();
		session.setAttribute("resultList", results);
		session.setAttribute("resultList1", results);
		RequestDispatcher pd = request.getRequestDispatcher("tinder.jsp");
		pd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
