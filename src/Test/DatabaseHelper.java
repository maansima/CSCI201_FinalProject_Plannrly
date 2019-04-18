package Test;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpSession;

public class DatabaseHelper {
	
	private Connection conn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	
	public DatabaseHelper() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PlannrlyUsers?user=root&password=Yj26Xcco&serverTimezone=UTC");

			if(conn == null) {
				System.out.println("it is null oh uh");
			}
	
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		}
		
	}
	public int GetID(String username) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT userID FROM User WHERE username=?");
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getInt("userID");
		}
		} catch (SQLException ex) {
	 		System.out.println("error");
		}
		return -1;
		
	}
	
	public int GetGroupID(String groupName) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT groupID FROM GroupInfo WHERE groupName=?");
		ps.setString(1, groupName);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getInt("groupID");
		}
		} catch (SQLException ex) {
	 		System.out.println("error");
		}
		return -1;

	}
	
	public ArrayList<String> GetGroups(Integer ID){
		ArrayList<String> GroupsIn = new ArrayList<String>();
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT groupID FROM GroupMember WHERE userID=?");
		ps.setInt(1,ID);
		ResultSet rs = ps.executeQuery();		
		while(rs.next()) {
			Integer x =rs.getInt("groupID");
			GroupsIn.add(GetGroupName(x));
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return GroupsIn;
	}
	
	public String GetGroupName (Integer GroupID) {
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT groupName FROM GroupInfo WHERE groupID=?");
		ps.setInt(1,GroupID);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getString("groupName");
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String GetGroupLocation (String GroupName) {
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT location FROM GroupInfo WHERE groupName=?");
		ps.setString(1,GroupName);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getString("location");
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int GetGroupPrice (String GroupName) {
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT price FROM GroupInfo WHERE groupName=?");
		ps.setString(1,GroupName);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getInt("price");
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Integer> GetGroupMembers (String GroupName) {
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT groupID FROM GroupInfo WHERE groupName=?");
		ps.setString(1,GroupName);
		ArrayList<Integer> members = new ArrayList<Integer>();
		Integer ID = 0;
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			ID= rs.getInt("groupID");
		}
		ps =  conn.prepareStatement("SELECT userID FROM GroupMember WHERE groupID=?");
		ps.setInt(1,ID);
		ResultSet ws = ps.executeQuery();
		while(ws.next()) {
			members.add(ws.getInt("userID"));
		}
		if(members.size()>0) {
			return members;
		}
		}catch(SQLException e) {
			System.out.println("error in getting group members " + e.getMessage());
			e.printStackTrace();
		}		
		return null;
	}
	
	public int GetMemberCount (String GroupName) {
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT memberCount FROM GroupInfo WHERE groupName=?");
		ps.setString(1,GroupName);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getInt("memberCount");
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String GetGroupActivity (String GroupName) {
		PreparedStatement ps;
		try {
		ps = conn.prepareStatement("SELECT activityType FROM GroupInfo WHERE groupName=?");
		ps.setString(1,GroupName);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getString("activityType");
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String GetUser(Integer ID) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT username FROM User WHERE userID=?");
			ps.setInt(1, ID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getString("username");
			}
			} catch (SQLException ex) {
		 		System.out.println("error");
			}
			return null;
	}
	
	public boolean createAccount(String username, String password) throws SQLException {
		boolean check = false;
		String query = "SELECT COUNT(*) FROM User WHERE username=?";
		st = conn.prepareStatement(query);
		st.setString(1, username);
		rs = st.executeQuery();
		while(rs.next() ) {
			check = (rs.getInt(1) == 0 );  //verifies that no user currently exists with this username 
		}
		
		if(check) {
			String insertQuery = "INSERT INTO User (username, password)"
			        + " values (?, ?)";
			st = conn.prepareStatement(insertQuery);
			st.setString(1, username);
			st.setString(2, password);
			st.executeUpdate();
			return true;
			
		}
		else { 
			return false;
		}
	}
	
	public boolean createGroup(String groupName, Vector<String> groupMembers, String location, int price, String activityType, String groupOwner) throws SQLException {
		boolean check = false;
		int memberCount = groupMembers.size();
		String query = "SELECT COUNT(*) FROM GroupInfo WHERE groupName=?";
		st = conn.prepareStatement(query);
		st.setString(1, groupName);
		rs = st.executeQuery();
		while(rs.next()) {
			check = (rs.getInt(1) == 0); //verifies that no group of this name currently exists
		}
		if(check) {
			String insertQuery = "INSERT INTO GroupInfo (groupName, memberCount, location, price, activityType)"
					+ " values (?,?,?,?,?)";
			st = conn.prepareStatement(insertQuery);
			st.setString(1, groupName);
			st.setInt(2, memberCount+1);
			st.setString(3,  location);
			st.setInt(4, price);
			st.setString(5, activityType);
			st.executeUpdate();
			
			//adding all the members in 
			
			for(int i = 0; i < groupMembers.size(); i++) {
				joinGroup(groupName, groupMembers.get(i));
			}
			
			
			//get current user and add them too
			joinGroup(groupName, groupOwner);
			
			return true;
		}
		return false;
	}
	
	public int validateLogin(String username, String password) throws SQLException {
		boolean check = false;
		boolean checkPass = false;
		String query = "SELECT COUNT(*) FROM User WHERE username=?";
		st = conn.prepareStatement(query);
		st.setString(1, username);
		rs = st.executeQuery();
		while(rs.next() ) {
			check = (rs.getInt(1) == 1 );  //verifies that a user with this username exists & that there's
			//only one 
		}
		
		if(check) {
			String passwordCheck = "SELECT COUNT(*) FROM User WHERE username=? AND password=?";
			st = conn.prepareStatement(passwordCheck);
			st.setString(1, username);
			st.setString(2, password);
			rs = st.executeQuery();
			while(rs.next() ) {
				checkPass = (rs.getInt(1) == 1 );  //verifies that the password is correct
			}
			if(checkPass)
			{
				return 1;
			}
			else 
			{
				return 2;
			}
		}
		else {
			System.out.println("Not found");
			return 3;
		}
	}
	
	public boolean joinGroup(String groupName, String username) throws SQLException {
		boolean check = false;
		String query = "SELECT COUNT(*) FROM GroupInfo WHERE groupName=?";
		st = conn.prepareStatement(query);
		st.setString(1, groupName);
		rs = st.executeQuery();
		while(rs.next()) {
			check = (rs.getInt(1) == 1); //verifies a group of this name currently exists
		}
		if(check) {
			String insertQuery = "INSERT INTO GroupMember (userID, groupID)"
					+ "values(?, ?)";
			st = conn.prepareStatement(insertQuery);
			int userId = GetID(username);
			int groupId = GetGroupID(groupName);
			st.setInt(1, userId);
			st.setInt(2, groupId);
			st.executeUpdate();
			return true;
		}
		return false; 
	}
	
	public boolean insertSearch(String searchQuery, String timestamp) throws SQLException {
		String insertQuery = "INSERT INTO SearchHistory (queryInfo, searchTime)"
		        + " values (?, ?)";
		st = conn.prepareStatement(insertQuery);
		st.setString(1, searchQuery);
		st.setString(2, timestamp);
		st.executeUpdate();
		return true;
	}
	public void addActivity(String ActivityName, Integer userID, Integer Time, Integer Date) {
		String query = "INSERT INTO Activities (userID, ActivityName,Time,Date)"
				+ "values(?, ?,?,?)";
		try {
		st = conn.prepareStatement(query);
		st.setInt(1, userID);
		st.setString(2,ActivityName);
		st.setInt(3,Time);
		st.setInt(4,Date);
		st.executeUpdate();
		}catch (SQLException ex) {
			System.out.println("error");
		}	
	}
	public ArrayList<Integer> getActivities(Integer userID, Integer Date){
		ArrayList<Integer> ActivityID = new ArrayList<Integer>();
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT idActivities FROM Activities WHERE userID=? AND Date=?");
		System.out.println("User ID" + userID + "Date" + Date);
		ps.setInt(1, userID);
		ps.setInt(2, Date);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			System.out.println("I am in!");
			Integer curr = rs.getInt("idActivities");
			ActivityID.add(curr);
		}
		} catch (SQLException ex) {
	 		System.out.println("errorAct3");
		}
		return ActivityID;		
	}
	public Integer getActivityGroup(Integer IDAct) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT groupID FROM Activities WHERE idActivities=?");
		ps.setInt(1, IDAct);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			return rs.getInt("groupID");
		}
		}catch (SQLException ex) {
	 		System.out.println("errorAct2");
		}
		return -1;
	}
	public String getActivityName(Integer IDAct) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT ActivityName FROM Activities WHERE idActivities=?");
		ps.setInt(1, IDAct);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			return rs.getString("ActivityName");
		}
		}catch (SQLException ex) {
	 		System.out.println("errorAct1");
		}
		return null;
	}
	public Integer getActivityTime(Integer IDAct) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT Time FROM Activities WHERE idActivities=?");
		ps.setInt(1, IDAct);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			return rs.getInt("Time");
		}
		}catch (SQLException ex) {
	 		System.out.println("error Act");
		}
		return null;
	}
	public String getActivityAddress(Integer IDAct) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT Time FROM Activities WHERE idActivities=?");
		ps.setInt(1, IDAct);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			return rs.getString("Address");
		}
		}catch (SQLException ex) {
	 		System.out.println("error Act");
		}
		return null;
	}
	public String getActivityPrice(Integer IDAct) {
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT Time FROM Activities WHERE idActivities=?");
		ps.setInt(1, IDAct);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			return rs.getString("Price");
		}
		}catch (SQLException ex) {
	 		System.out.println("error Act");
		}
		return null;
	}
	

}
