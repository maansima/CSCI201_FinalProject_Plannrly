package Test;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


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
	
	public boolean createGroup(String groupName, Vector<String> groupMembers, String location, int price, String activityType) throws SQLException {
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
			st.setInt(2, memberCount);
			st.setString(3,  location);
			st.setInt(4, price);
			st.setString(5, activityType);
			st.executeUpdate();
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
			st.setString(1, username);
			st.setString(2, groupName);
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

}
