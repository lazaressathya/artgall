package in.edu.kristhujayanthi;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class delete_img
 */
@WebServlet("/delete_img")
public class delete_img extends HttpServlet {
	private static final long serialVersionUID = 1L;
	delete_img_service service = new delete_img_service();   
    
    public delete_img() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

String del=request.getParameter("dele");/////////


//PrintWriter pw=response.getWriter();
System.out.println(del);
RequestDispatcher dispatcher;
/////
if(del!=null) {
	 service.deleteData(del);	
	 dispatcher = request.getRequestDispatcher("my_profile.jsp");
	 dispatcher.forward( request, response );
	}	 

	}

}
