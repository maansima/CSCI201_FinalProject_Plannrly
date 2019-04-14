

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Test.DatabaseHelper;

/**
 * Servlet implementation class ServletSignUp
 */
@WebServlet("/ServletSignUp")
public class ServletSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DatabaseHelper db = new DatabaseHelper();
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String Password = request.getParameter("pass");
		String CPassword = request.getParameter("confirmpass");
		if(username.contentEquals("") || Password.contentEquals("") || CPassword.contentEquals("")) {
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatch.forward(request,response);
		}
		if(!Password.contentEquals(CPassword)) {
			request.setAttribute("error", "same");
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/signup.jsp");
			dispatch.forward(request,response);
		} else
			try {
				if(db.validateLogin(username, Password) != 3) {
					request.setAttribute("error", "taken");
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/signup.jsp");
					dispatch.forward(request,response);
				}
				else 			
				
				{
					db.createAccount(username, Password);
					HttpSession session = request.getSession();
					session.setAttribute("loginID", db.GetID(username));
					System.out.println(db.GetID(username));
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/Home.jsp");
					dispatch.forward(request,response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

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
