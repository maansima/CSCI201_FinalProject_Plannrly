package Test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VotingServlet
 */
@WebServlet("/VotingServlet")
public class VotingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VotingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voteResults = request.getParameter("hiddenField");
		String groupName = request.getParameter("groupName");
		String parameters[] = voteResults.split(",");
		Set<String> resultSet = new HashSet<String>();
		for(String s : parameters) {
			resultSet.add(s);
		}
		String dataString ="";
		for(String s : resultSet) {
			dataString+=s+",";
		}
		dataString = dataString.substring(0, dataString.length()-1);
		DatabaseHelper db = new DatabaseHelper();
		db.addVoted(dataString);
		int voteCount=0;
		try {
			voteCount =db.getVotedCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int memberCount = new DatabaseHelper().GetMemberCount(groupName);
		System.out.println(memberCount+":"+voteCount);
		//check if amount of 
		if(memberCount==voteCount) {
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
