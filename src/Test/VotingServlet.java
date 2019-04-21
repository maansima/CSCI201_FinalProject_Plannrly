//CSCI 201 Final Project Plannrly 
//Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
//Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu

 
package Test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
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
		Map<String, Integer> voteMap = new HashMap<String, Integer>();
		System.out.println(memberCount+":"+voteCount);
		//check if amount of 
		if(memberCount==voteCount) {
			String votes="";
			try {
				votes = db.getVotes();
				votes = votes.substring(0, votes.length()-1);
				System.out.println(votes);
				String array[] = votes.split(",");
				for(String s: array) {
					if(voteMap.containsKey(s)) {
					    voteMap.put(s, voteMap.get(s)+1);
					} else {
					    voteMap.put(s, 1);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
			String maxVote="";
			int maxCount=0;
			 Iterator it = voteMap.entrySet().iterator();
			    while (it.hasNext()) {
			        Map.Entry pair = (Map.Entry)it.next();
			        System.out.println(pair.getKey() + " = " + pair.getValue());
			       if((int)pair.getValue()>maxCount) {
			    	   maxCount=(int)pair.getValue();
			    	   maxVote=(String)pair.getKey();
			       }
			    }
			    String finalVote = maxVote.trim();
				finalVote = finalVote.replaceAll("\\s", "*");
				groupName = groupName.trim();
				groupName = groupName.replaceAll("\\s", "*");
			    String link = "/Plannrly/ServletResults?Value="+finalVote+"&GroupName="+groupName;
			    try {
					db.createNotification(link);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				}
		}
		RequestDispatcher pd = request.getRequestDispatcher("/ServletProfile");
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
