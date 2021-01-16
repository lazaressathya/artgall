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
%>
<%--<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>id</b></td>
<td><b>user_id</b></td>
<td><b>Password</b></td>
<td><b>Name</b></td>
</tr>
<%
try{ 
conn = DriverManager.getConnection(ConnectionUrl , userId, password);
statement=conn.createStatement();
String sql ="SELECT * FROM seller";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("arname") %></td>
<td><%=resultSet.getString("price") %></td>
<td><%=resultSet.getString("image") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
--%>    
<%
try{ 
conn = DriverManager.getConnection(ConnectionUrl , userId, password);
statement=conn.createStatement();
String sql ="SELECT * FROM seller";
resultSet = statement.executeQuery(sql);
//out.println(resultSet);
}catch (Exception e) {
  e.printStackTrace();
  }
%>
   
<html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link rel="stylesheet" href="Bootstrap/css/.css">
        <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="Bootstrap/css/mdb.css">
        <link rel="stylesheet" href="Bootstrap/css/style.css">
        
        <title></title>
    
    
    </head>
    <body>
        <!--navbar section-->
        <header class="main-header">
            <nav class="navbar navbar-expand-sm  scrolling-navbar navbar-dark bg-dark fixed-top  ">
            <div class="container ">
                <a href="" class="navbar-brand font-weight-bold"><i class="fas fa-paint-brush fa-2x"></i>  Online Art Gallery</a>
                <button class="navbar-toggler " data-toggle="collapse" data-target="#travellersimple">
                <span class="navbar-toggler-icon">
                    </span></button>
                 <div class="collapse navbar-collapse" id="travellersimple">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item px-2"></li>
                    <a href="" class="nav-link active">Home</a>
                     <li class="nav-item px-2"></li>
                    <a href="#gallery" class="nav-link">Gallery</a>
                     <li class="nav-item px-2"></li>
                    <a href="#about" class="nav-link">About Us</a>
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
            <div class="landing-div">
            <div class="landing-wrapper d-flex flex-column justify-content-center text-align-center text-center h-100 ">
             <div>
                <h1 class="text-center text-white font-weight-bold display-2">Online Art Gallery</h1>
                 <p class="text-center text-white lead">"Art don't have to be pretty. It has to be meaningful"</p>
                </div>   
                
                
                </div>
            
            </div>
        </header>
        <!-- carousel section-->
         <section class="mt-5">
             <h1 class="diplay-3 text-center mb-5 font-weight-bold">Images</h1>
        <div class="carousel slide"  data-ride="carousel">
            <ol class="carousel-indicators">
    <li data-target="#traveller" data-slide-to="0" class="active"></li>
    <li data-target="#traveller" data-slide-to="1"></li>
    <li data-target="#traveller" data-slide-to="2"></li>
  </ol>
            <div class="carousel-inner"  id="traveller">
            <div class="carousel-item active">
                <img src="images/abstract-abstract-painting-acrylic-acrylic-paint-1585325.jpg" alt="" class="img-fluid w-100">
                <div class="carousel-caption text-right">
                <h3 class="display-4 animated zoomIn delay-1s"> Abstract Painting</h3>
                <div class="animated jackInTheBox delay-2s">
                    <p>Art is freedom. Being able to bend things most people see as a straight line.</p>
                    </div>
                </div>
                </div>
                <div class="carousel-item">
                <img src="images/blue-and-cream-abstract-painting-1981468%20(2).jpg" alt="" class="img-fluid w-100">
                 <div class="carousel-caption text-left">
                <h3 class="display-4 animated zoomIn delay-1s"> Acryclic Paint</h3>
                <div class="animated jackInTheBox delay-2s">
                    <p>An artist can show things that other people are terrified of expressing.</p>
                    </div>
                </div>
                </div>
                <div class="carousel-item">
                <img src="images/white-walls-1764702.jpg" alt="" class="img-fluid w-100">
                 <div class="carousel-caption text-right">
                <h3 class="display-4 animated zoomIn delay-1s"> Abstract Art Background</h3>
                <div class="animated jackInTheBox delay-2s">
                    <p>The artist is nothing without the gift but the gift is nothing without the work.</p>
                    </div>
                </div>
                </div>
      <a class="carousel-control-prev" href="#traveller" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#traveller" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>     
            </div>
            </div>
        </section>
    
      
        <!-- gallery-->
        
        <div class="container mt-5" id="gallery" >
		        <div class="row text-center">
		            <div class="col">
		            <h1 class="display-2 font-weight-bold"> Gallery</h1>
		             </div>
		        </div>
            <!-- photos-->
              
          
                
                
          <div class="row mt-5">
              <% while(resultSet.next()){%>
                <div class="col-md-4">
                <form method="POST"  action="pay">
                  <div class="card">
                    <div class="card-header">
                      <h1 class="text-center"><input type="hidden" name="data" value="<%=resultSet.getString("image_id") %>"><%=resultSet.getString("name") %></h1>
                          <p class="lead-muted text-center">Art by <%=resultSet.getString("arname") %> </p>
                      </div>
                   <div class="card-body">
                    <img src="<%=resultSet.getString("imgfile") %>" class="img-fluid img-gallery ">
                    </div> 
                    <div class="card-footer text-center">
                    <p>&#8377;<%=resultSet.getString("price") %></p>
                    <button type="submit" class="btn btn-outline-primary">Purchase</button>
                    </div>
                    
                    </div>
                
                </form>
                </div>
              
     		<%}%>
         </div>         
       </div>
        
        
        <!--about gallery-->
        <div class="container mt-5" id="about">
           <div class="row text-center">
           <div class="col text-center">
               <h1 class="display-4 font-weight-bold mt-3">About Us</h1>
              <p class="lead">Online Art Gallery in a form of electronic commerce which allows consumer to directly buy goods or services from a seller over the internet using a web browser.  Consumers find a product of interest by visiting the website of the retailer directly or by the searching among alternative venors using a shopping search engine, which displays the same products availablility and pricing at different e-retailer.  As of 2016, customers can shop online using arange of different computers and devices including desktop computers, tablet computers and smartphones. 
An Online  Shop invokes the physical analogy of buying products of servisces at a regular "bricks and mortars" retailer or shopping center; the process is called bussiness to consumer online shopping.  A typical onlin store enables the customer to browse the firms range of products and sevices. view photos or images of the products.  along with information about the product specifications, features and prices.<br><br>

	Online stores typically enbles shoppers to use "search" features to find specific models, brands or items.  Online customers must have access to the internet an valid method of payment in order to complete a transaction. such as a credit card, an interac- enabled debit card. or a service such as PayPal.
    for example: paperback books or clothes.  the e-tailer ships the products to the customer, for digital products.  such as digital audio files of songs or software. the e-tailer typically sends the file to the customer over the internet.  The largest of these online retailing corporations are Alibaba, Amazon.com and eBay</p>
               
               </div>
           </div>
         </div> 
        
        <!-- footer-->
         <footer class="mt-5 p-3 bg-light">
        
        <div class="container">
    <div class="row text-blue">
        <div class="col-md-8">
        <a href="" >About Us</a>|
        <a href="" >Contact Us</a>|
            <a href="" >Terms of Use</a>|
            <a href=""  >Privacy Policy</a>
            <p class="mt-4" class="text-blue">Copy right &copy; 2020</p>
             <p class="mt-4" class="text-blue">All Right Reserved</p>
          
        </div>
        <div class="col-md-4">
        <i class="fab fa-facebook-square fa-4x text-primary m-3" ></i>
                    <i class="fab fa-whatsapp fa-4x text-success m-3" ></i>
                                <i class="fab fa-instagram fa-4x text-secondary m-3" ></i>
              <p class="lead mt-1" class="text-blue">Developed by Shobhan and Sathya</p>
  </div>
        
        </div>
    
    </div>
    </footer>
        
      
        
    <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/bootstrap.js"></script>
        <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/popper.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script>
           
        $('.carousel').carousel({
            
            interval:3000,
            pause:'hover'
        });
        
        </script> 

        
    </body>


</html>