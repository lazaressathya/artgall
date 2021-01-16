package in.edu.kristhujayanthi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String us = request.getParameter("username");
		String pas = request.getParameter("pass");
		out.print(us+","+pas);
		if(LoginDao.validate(us,pas)) {
			HttpSession session = request.getSession();
			session.setAttribute("email", us);
			RequestDispatcher rd = request.getRequestDispatcher("homesamp.jsp");
			rd.forward(request, response);
		}
		else {
			out.println("uname and passcode in db is empty....");
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.include(request, response);
		}
		out.close();
	}

	/*private String getParameter(String string) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
