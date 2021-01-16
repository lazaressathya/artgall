package in.edu.kristhujayanthi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class seller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	seller_service service=new seller_service();
	
   
    public seller() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
String name=request.getParameter("name");
String arname=request.getParameter("arname");
String price=request.getParameter("price");
String image_id=request.getParameter("image_id");
//String del=request.getParameter("del");/////////
String imgfile=request.getParameter("imgfile");
String im_email=request.getParameter("email");

PrintWriter pw=response.getWriter();
System.out.println(imgfile);
RequestDispatcher dispatcher;
/*////
if(del!=null) {
	 service.deleteData(del);	
	 dispatcher = request.getRequestDispatcher("homesamp.jsp");
	 dispatcher.forward( request, response );
}	 
////*/
if((name!=null&&arname!=null&&price!=null&&image_id!=null&&imgfile!=null)&&(name!=""&&arname!=""&&price!=null&&price!=null&&image_id!=null&&imgfile!=null))
{
int i=service.insertData(name,arname,price,image_id,imgfile,im_email);


System.out.println("Getting User Name from UI to Servlet-Controller"+name);
System.out.println("Getting Father Name from UI to Servlet-Controller"+arname);
System.out.println("Getting personal address from UI to Servlet-Controller"+price);
System.out.println("Getting gender from UI to Servlet-Controller"+image_id);
System.out.println("Getting gender from UI to Servlet-Controller"+imgfile);
System.out.println("Getting gender from UI to Servlet-Controller"+im_email);
if(i==1)
{
	dispatcher = request.getRequestDispatcher("homesamp.jsp");
	dispatcher.forward( request, response );
}
else
{
	dispatcher = request.getRequestDispatcher("seller.jsp");
	dispatcher.forward( request, response );
	
}


	}

	}
	

}
