package in.edu.kristhujayanthi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegServlet_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RegServlet_Service service=new RegServlet_Service();
	
   
    public RegServlet_Controller() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
String username=request.getParameter("username");
String address=request.getParameter("address");
String pincode=request.getParameter("pincode");
String email=request.getParameter("email");
String mobileno=request.getParameter("mobileno");
String passcode=request.getParameter("passcode");

PrintWriter pw=response.getWriter();
RequestDispatcher dispatcher;
if((username!=null&&passcode!=null)&&(username!=""&&passcode!=""))
{
int i=service.insertData(username,address,pincode,email,mobileno,passcode);


System.out.println("Getting User Name from UI to Servlet-Controller"+username);
System.out.println("Getting Father Name from UI to Servlet-Controller"+address);
System.out.println("Getting personal address from UI to Servlet-Controller"+pincode);
System.out.println("Getting gender from UI to Servlet-Controller"+email);
System.out.println("Getting City from UI to Servlet-Controller"+mobileno);
System.out.println("Getting Course from UI to Servlet-Controller"+passcode);
if(i==1)
{
	dispatcher = request.getRequestDispatcher("index.html");
	dispatcher.forward( request, response );
}
else
{
	pw.println("<html>");
	pw.println("<head>");
	pw.println("<body style='background-color:red'>");
	pw.println("<h1>");
	pw.println("<center>");

	pw.println("Unable to insert the data Mr"+username+"Pleae Contact Admin");

	pw.println("</center>");
	pw.println("</h1>");
	pw.println("</body>");
	pw.println("</head>");
	pw.println("</html>");
	
}


	}
else
{
	pw.println("<html>");
	pw.println("<head>");
	pw.println("<body style='background-color:red'>");
	pw.println("<h1>");
	pw.println("<center>");

	pw.println("Dear user..Please Enter the valid data and submit..");


	pw.println("</center>");
	pw.println("</h1>");
	pw.println("</body>");
	pw.println("</head>");
	pw.println("</html>");
}
	}
	

}
