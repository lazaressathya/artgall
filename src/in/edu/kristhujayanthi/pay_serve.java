package in.edu.kristhujayanthi;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pay_serve
 */
@WebServlet("/pay_serve")
public class pay_serve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pay_serve() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String s = request.getParameter("data");
				request.setAttribute("payname", s);
				RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
				rd.forward(request,response);
	}

	

}
