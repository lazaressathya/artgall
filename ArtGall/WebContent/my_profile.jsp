<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
if(session.getAttribute("email")==null)
{
    response.sendRedirect("index.html");	
}

String driver = "oracle.jdbc.driver.OracleDriver";
String ConnectionUrl = "jdbc:oracle:thin:@localhost:1521/ORCL";
String userId = "SYSTEM";
String password = "Sathya";

try{
  Class.forName(driver);
}catch(ClassNotFoundException e){
  e.printStackTrace();
}
Connection conn = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet lgrs = null;
%>
<%
try{ 
String s;
s = (String)request.getAttribute("prof") ;
conn = DriverManager.getConnection(ConnectionUrl , userId, password);
statement=conn.createStatement();
String sql ="SELECT * FROM seller WHERE EMAIL='"+session.getAttribute("email")+"'";
String lgt ="SELECT * FROM ARTREG WHERE EMAIL='"+(String)session.getAttribute("email")+"'";
lgrs = statement.executeQuery(lgt);
resultSet = statement.executeQuery(sql);
//out.println(resultSet);
}catch (Exception e) {
  e.printStackTrace();
  }
%>
    
        
    
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="Bootstrap/css/mdb.css">
    <link rel="stylesheet" href="Bootstrap/css/style.css">
    <link rel="stylesheet" href="Bootstrap/css/style.css">
 <title> My Profile</title>   
    </head>
    <style>
    .image
        {
            width: 270px;
      height: 270px;
            border-radius: 135px;
            
        }
        .card-header .card .card-body
        {
            box-shadow: 0 0 15px 0 black;
        }
        .card-body{
            padding:0;
        }
        .image-gal
        {
            width: 1500px;
            height: 200px;
            position: relative;
        }
        .icon
        {
            position: absolute;
            top:270px;
            right: 27px;
        }
        .row{
        	margin:10px;
        }
        i 
        {
            background-color: red;
		    border-radius: 50%;
		    border: 1x solid grey;
		    padding: 10px;
        }
        
    
    </style>
  
   <body>
            <header class="main-header">
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container ">
                <a href="" class="navbar-brand font-weight-bold"><i class="fas fa-paint-brush fa-2x"></i>  Online Art Gallery</a>
                <button class="navbar-toggler " data-toggle="collapse" data-target="#travellersimple">
                <span class="navbar-toggler-icon">
                    </span></button>
                 <div class="collapse navbar-collapse" id="travellersimple">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item px-2"></li>
                    <a href="homesamp.jsp" class="nav-link active">Home</a>
                     <li class="nav-item px-2"></li>
                    <a href="homesamp.jsp#gallery" class="nav-link">Gallery</a>
                     <li class="nav-item px-2"></li>
                    <a href="homesamp.jsp#about" class="nav-link">About Us</a>
                    <li class="nav-item px-2"></li>
                     <li class="nav-item px-2"></li>
                       <form method="GET" action="my_pro">
                                 
                       		<input type="hidden" name="myprofile" value="<%=session.getAttribute("email") %>">
		                    <button type="submit" class="btn btn-outline-primary nav-link active"><%=session.getAttribute("email") %></button>
		                   
		               </form>
                     <li class="nav-item px-2"></li>
                       <form method="GET" action="logout">
		                    <button type="submit" class="btn btn-outline-primary nav-link active">Logout</button>
		               </form>
		             
                </ul>
            
            </div>
          </div>
        </nav>
    </header>
        
        <div class="container">
            <h1 class="display-4 text-center text-primary mt-5">My Profile</h1>
            <div class="row justify-content-center text-center ">
            <div class="col-md-8">
                <div class="card ">
                <div class="card-header ">
                    <div class="row  text-center ">
                    <div class="col-md-6">
                       
                        <img src="images/abstract-abstract-painting-acrylic-acrylic-paint-1585325.jpg" class="rounded-circle image-fluid image">
                        <label class="m-3 lead font-weight-bold text-primary">USER : <%=session.getAttribute("email") %></label>
                    
                        </div>
                        
                        <%while(lgrs.next()){ %>
                        	<div class="col-md-6  ">
                            <div class="display-2 text-center text-primary m-4 "><p><%=lgrs.getString("username") %></p></div>
                            <p class="lead text-primary">Art's Uploaded</p>
                            
                        </div>
                        	
                        <%} %>
                        
                        <a href="seller.jsp"><div class="btn btn-outline-primary text-center btn-block btn-lg"><b>Upload</b></div></a>
                     </div>
                    </div>
                    <div class="card-body">
                        
                        <h1 class="text-center mt-4 mb-5 font-weight-bold text-primary">My Uploads</h1>
                        <hr class="m-4 ">
                        
			        
                        
                    <div class="row">
                    <% while(resultSet.next()){%>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                <h4 class="card-title"><%=resultSet.getString("name") %></h4>
                          <p class="lead-muted text-center">ID: <%=resultSet.getString("image_id") %></p>
                                
                                </div>
                               <div class="card-body">
                    <img src="<%=resultSet.getString("imgfile") %>" class="card-img-bottom img-fluid image-gal ">          
                                   
                    </div>
                                
                                
                    <form action="delt" method="POST">
                        <div class=" ">
                         <input type="hidden" name="dele" value="<%=resultSet.getString("image_id") %>">
                         <button type="submit"><i class="far fa-trash-alt text-black mb-3 icon"></i></button>
                        </div>
                    </form>    
                                
            <!--  <div class="modal" id="modal-register">
                <div class="modal-dialog">
                    <div class="">
                    <form action="delt" method="POST">
                        <div class=" ">
                            <h2 class="text-primary font-weight-bold "><input type="hidden" name="dele" value="">Delete</h2>
                        <button class="close" data-dismiss="modal"><i class="fa fa-times-circle text-danger"></i></button>
                        </div>
                    </form>    
                     </div>
                </div>
            </div>-->
                            
                            </div>
                         </div>
                         <%}%>
                         </div>
             </div>
             </div>
             </div>
             </div>           
    
    <div style="margin-bottom: 500px;"></div>
    <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/bootstrap.js"></script>
        <script src="Bootstrap/js/mdb.js"></script>
        <script src="Bootstrap/js/popper.js"></script>
    </body>



</html>