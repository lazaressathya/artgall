<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
if(session.getAttribute("email")==null)
{
    response.sendRedirect("index.html");	
}

%> 
<%--<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
 <%  
        
try
  {     
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/ORCL","SYSTEM","admin");
        String name,arname,price,image;
        name=request.getParameter("name");
        arname=request.getParameter("arname");
        price=request.getParameter("price");
        image=request.getParameter("image");

        //String s;
        //s="insert into seller values('"+name+"','"+arname+"','"+price+"','"+image+"')";
        
        if(name!=null && arname!=null && price!=null && image!=null)
        { 
            /*PreparedStatement pst=con.prepareStatement(s);
            Statement stmt=con.createStatement();
            
                int i=pst.executeUpdate();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select *from seller");
                out.println("Successfully  registered!!");*/
        	Statement st=con.createStatement();
        	int i=st.executeUpdate("insert into seller values('"+name+"','"+arname+"','"+price+"','"+image+"')");
        	Statement str=con.createStatement();
            ResultSet rs=str.executeQuery("select *from seller");
            out.println("Successfully  registered!!");
        	if(i>0){
        		response.sendRedirect("home.html");
        	}
        	else
        		response.sendRedirect("index.html");
        }
   }
   catch(Exception e)
      {
         out.println(e);
   }
        
        %>
        
 --%>
<html>
<head>
 <title>
    
    </title> 
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link rel="stylesheet" href="Bootstrap/css/.css">
        <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="Bootstrap/css/mdb.css">
        <link rel="stylesheet" href="Bootstrap/css/style.css">
    
    </head>
    <style>
    .card
        {
            box-shadow: 0 0 5px black;
        }
 #upload 
        {
    opacity: 0;
}

#upload-label {
    position: absolute;
    top: 50%;
    left: 1rem;
    transform: translateY(-50%);
}

.image-area {
    border: 2px dashed rgba(255, 255, 255, 0.7);
    padding: 1rem;
    position: relative;
}

.image-area::before {
    content: 'Uploaded image result';
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 0.8rem;
    z-index: 1;
}

.image-area img {
    z-index: 2;
    position: relative;
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
        <div class="row mt-5 justify-content-center">
            <div class="col-md-6">
       <div class="card">
        <div class="card-header">
          <h1 class="display-4 text-center text-primary font-weight-bold">Seller Form</h1> 
           
           
           </div>
           <div class="card-body">
           <form method="post" action="sell">
             <div class="form-group">
               
               <input type="text" class="form-control text-primary " placeholder="Art Name" name="name" pattern="[A-Za-z.\s]{1,}" required autocomplete="off" title="Fullname should only contain letters. e.g. john" />
               </div>
                <div class="form-group">
               <input type="text" class="form-control text-primary " placeholder="Artist Name" name="arname" pattern="[A-Za-z.\s]{1,}" required autocomplete="off" title="Fullname should only contain letters. e.g. john" />
               </div>
                <div class="form-group">
               <input type="text" class="form-control text-primary " placeholder="Set Price" name="price" Pattern= "[0-9]{1,}" required autocomplete="off" title="Price should not contain characters" />
               </div>
               
               <div class="form-group">
               <input type="text" class="form-control text-primary " placeholder="Enter Unique Id for Image" name="image_id" Pattern= "[A-Za-z0-9._%+-]{6}" required autocomplete="off" title="Image ID should be unique & should contain 6 digit " />
               </div>
               
            <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
                <input id="upload" type="file" onchange="readURL(this);" class="form-control border-0" name="imgfile" Pattern= "[A-Za-z0-9._%+-]{1,}" required autocomplete="off" />
                <label id="upload-label" for="upload" class="font-weight-light text-muted">Choose file</label>
                <div class="input-group-append">
                    <label for="upload" class="btn btn-light m-0 rounded-pill px-4"> <i class="fa fa-cloud-upload mr-2 text-muted"></i><small class="text-uppercase font-weight-bold text-muted">Choose file</small></label>
                </div>
            </div>
            <div class="image-area mt-4"><img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block">
              <p class="font-italic text-white text-center">The image uploaded will be rendered inside the box below.</p>
            </div>
            
            	<div class="form-group">
               <input type="hidden" name="email" value="<%=session.getAttribute("email") %>">
               </div>
            
              <input type="submit"/>
               </form>
           
           </div>
        </div> 
            </div>
        </div>
        
        </div>
        
        
    
         
   <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/bootstrap.js"></script>
        <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/popper.js"></script>
        
        <script>
        function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imageResult')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(function () {
    $('#upload').on('change', function () {
        readURL(input);
    });
});

/*  ==========================================
    SHOW UPLOADED IMAGE NAME
* ========================================== */
var input = document.getElementById( 'upload' );
var infoArea = document.getElementById( 'upload-label' );

input.addEventListener( 'change', showFileName );
function showFileName( event ) {
  var input = event.srcElement;
  var fileName = input.files[0].name;
  infoArea.textContent = 'File name: ' + fileName;
}
        </script>
    </body>


</html>