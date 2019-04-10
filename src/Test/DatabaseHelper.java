package Test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseHelper {
	
	private Connection conn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	
	public DatabaseHelper() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WeatherUsers?user=root&password=root");
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		}
		
	}
	
	public boolean createAccount(String username, String password, String password2) throws SQLException {
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
