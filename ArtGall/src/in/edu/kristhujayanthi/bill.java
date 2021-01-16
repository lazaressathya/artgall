package in.edu.kristhujayanthi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class bill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	bill_service service=new bill_service();
	
   
    public bill() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
String imgid=request.getParameter("imgid");
String imgname=request.getParameter("imgname");
String price=request.getParameter("price");		
String cname=request.getParameter("cusername");
String cardno=request.getParameter("cardNumber");

PrintWriter pw=response.getWriter();
RequestDispatcher dispatcher;
if((cname!=null&&cardno!=null)&&(cname!=""&&cardno!=""))
{
int i=service.insertData(imgid,imgname,price,cname,cardno);


System.out.println("Getting User Name from UI to Servlet-Controller"+imgid);
System.out.println("Getting Father Name from UI to Servlet-Controller"+imgname);
System.out.println("Getting personal address from UI to Servlet-Controller"+price);
System.out.println("Getting gender from UI to Servlet-Controller"+cname);
System.out.println("Getting City from UI to Servlet-Controller"+cardno);
if(i==1)
{
	dispatcher = request.getRequestDispatcher("homesamp.jsp");
	dispatcher.forward( request, response );
}
else
{
	pw.println("<html>");
	pw.println("<head>");
	pw.println("<body style='background-color:red'>");
	pw.println("<h1>");
	pw.println("<center>");

	pw.println("Unable to insert the data Mr"+imgid+"Pleae Contact Admin");

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
