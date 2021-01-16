<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.util.*, java.sql.*"%>

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
//ResultSet lgrs=null;
%>
<%
try{ 
String s;
s = (String)request.getAttribute("payname") ;
conn = DriverManager.getConnection(ConnectionUrl , userId, password);
statement=conn.createStatement();
String sql ="SELECT * FROM seller WHERE IMAGE_ID='"+s+"'";
//String lgt ="SELECT * FROM ARTREG WHERE EMAIL='"+(String)session.getAttribute("email")+"'";
//lgrs = statement.executeQuery(lgt);
resultSet = statement.executeQuery(sql);
//out.println();
}catch (Exception e) {
  e.printStackTrace();
  }
%>
    
    
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="Bootstrap/css/.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="Bootstrap/css/mdb.css">
     <link rel="stylesheet" href="Bootstrap/css/style.css">
   <title></title> 
    
    
    </head>
    <style>
    body {
    background: #f5f5f5
}

.rounded {
    border-radius: 1rem
}

.nav-pills .nav-link {
    color: #555
}

.nav-pills .nav-link.active {
    color: white
}

input[type="radio"] {
    margin-right: 5px
}

.bold {
    font-weight: bold
}
.img-pay
        {
            border: 1px solid blue;
            height: auto;
            width: 500px;
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
   
   <div class="container py-5">
    <!-- For demo purpose -->
    <div class="row mb-4">
        <div class="col-lg-8 mx-auto text-center">
            <h1 class="display-4"> Payment Forms</h1>
        </div>
    </div><!-- End -->
     
       
       
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                        <!-- Credit card form tabs -->
                        <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                            <li class="nav-item"> <a data-toggle="pill" href="#credit-card" class="nav-link active "> <i class="fas fa-credit-card mr-2"></i> Credit Card </a> </li>
                           
                        </ul>
                    </div>
                <!-- End -->
                    <!-- Credit card form content -->
                   <% while(resultSet.next()){
///////////////////////////////////////////////////////////////////////////////////////////////
                	    
							
							
							
							/*String imgid = resultSet.getString("image_id");                   		
							String name = resultSet.getString("name");
							String arname= resultSet.getString("arname");
							String price = resultSet.getString("price");
							
							//INSERT TO TABLE
							
							//Connection con=null;
							
							
							try {
							
							if((name!=null)||(arname!=null)||(price!=null))
							{
							//Class.forName("com.mysql.jdbc.Driver");
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection connection = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521/xe",
							"SYSTEM", "admin");
							
							PreparedStatement ps = connection.prepareStatement("INSERT INTO BILL VALUES(?,?,?,?)");
							ps.setString(1, imgid);
							ps.setString(2, name);
							ps.setString(3, arname);
							ps.setString(4, price);
							ps.executeUpdate();
							}	
							
							
							
							}
							catch(Exception e) 
							{
							System.out.println(e);
							
							}	*/
						
//////////////////////////////////////////////////////////////////////////////////////////////
                   
                   
                   %><form action="billgen.jsp" method="get">
                    <div class="card-body">
                        <div class="row">
                        <div class="col-md-5">
                            <img src="<%=resultSet.getString("imgfile") %>" class="img-fluid img-pay"> 
                            
                            </div>
                            <div class="col-md-7">

              <div class="form-group">
                  <input type="hidden" name="idofimg" value="<%=resultSet.getString("image_id") %>"><center><h4><label for="username"><%=resultSet.getString("name") %></label></h4></center>
                 
                 </div>
                    <div class="form-group">
                  <center><h5><label for="username"><%=resultSet.getString("arname") %></label></h5></center>
                 </div>
                    <div class="form-group">
                  <center><h5><label for="username">Rs.<%=resultSet.getString("price") %></label></h5></center>
                 
                 </div>
              <% } %>

                            
                            
                            </div>
                          </div>
                    </div>
                    
                 <div class="tab-content">
                        <!-- credit card info-->
                        <div id="credit-card" class="tab-pane fade show active pt-3">
                            <form role="form">
                                <div class="form-group"> <label for="username">
                                        <h6>Card Owner</h6>
                                    </label> <input type="text" name="cusername" placeholder="Card Owner Name" required class="form-control "> </div>
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Card number</h6>
                                    </label>
                                    <div class="input-group"> <input type="text" name="cardNumber" placeholder="Valid card number" class="form-control " required>
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="form-group"> <label><span class="hidden-xs">
                                                    <h6>Expiration Date</h6>
                                                </span></label>
                                            <div class="input-group"> <input type="number" placeholder="MM" name="" class="form-control" required> <input type="number" placeholder="YY" name="" class="form-control" required> </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                            </label> <input type="text" required class="form-control"> </div>
                                    </div>
                                </div>
                                 </form>
                                 <button type="submit" class="btn btn-outline-primary btn-block">Confirm Payment</button>
                           <div><p class="lead text-center text-primary mt-1">or</p></div>
                           </form>  
                    </div> <!-- End -->
                    <!-- Paypal info -->
                   
                    <!-- End -->
                </div>
            </div>
        </div>
    </div>
       </div>
    </div>
    
    <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/bootstrap.js"></script>
        <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/popper.js"></script>
    </body>

</html>