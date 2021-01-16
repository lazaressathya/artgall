<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
s = (String)request.getParameter("idofimg") ;
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
      <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/bootstrap.js"></script>
        <script src="Bootstrap/js/jquery.js"></script>
        <script src="Bootstrap/js/popper.js"></script>
</head>
<body>
<% while(resultSet.next()){	
							String imgid = resultSet.getString("image_id");                   		
							String name = resultSet.getString("name");
							String arname= resultSet.getString("arname");
							String price = resultSet.getString("price");
							String email = resultSet.getString("email");
							//INSERT TO TABLE
							
							//Connection con=null;
							
							
							try {
							
							
							//Class.forName("com.mysql.jdbc.Driver");
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection connection = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521/xe",
							"SYSTEM", "admin");
							
							PreparedStatement ps = connection.prepareStatement("INSERT INTO BILL VALUES(?,?,?,?,?)");
							ps.setString(1, imgid);
							ps.setString(2, name);
							ps.setString(3, arname);
							ps.setString(4, price);
							ps.setString(5, email);
							ps.executeUpdate();
						
							
							}
							catch(Exception e) 
							{
							System.out.println(e);
							
							}	
}%>					
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
<section>
		<div class="container">
				
		
			<div class="order_details_table">
				<h2>Order Details</h2>
				
				<table class="table table-dark">
						  <thead>
						    <tr>
						      <th scope="col">Image Id</th>
						      <th scope="col">Image Name</th>
						      <th scope="col">Artist Name</th>
						      <th scope="col">Email</th>
						      <th scope="col">Price</th>
						    </tr>
						  </thead>
						  <tbody>

	<%
		///String _id=request.getParameter("idofimg");
	//system.out.println();
	 Statement stmt = null;
	 ResultSet rs = null;
	 	try	
	  	{
	 		Class.forName(driver);
				conn = DriverManager.getConnection(ConnectionUrl , userId, password);
				Statement stat = conn.createStatement();
				rs=stat.executeQuery("Select * from BILL where imgid='"+request.getParameter("idofimg")+"'");
				while(rs.next())
				{
			%>
							   <tr>
							      	<td>
										<i><%=rs.getString("imgid") %></i>
									</td>
									<td>
										<i><%=rs.getString("name") %></i>
									</td>
									<td>
										<i><%=rs.getString("arname") %></i>
									</td>
									<td>
										<i><%=rs.getString("email") %></i>
									</td>
									<td>
									   <i> <%=rs.getString("price") %></i>
									</td>
							    </tr>
							
					
					<%
				}
			
			
		} 
		catch (Exception e) 
		{
			System.out.println(e);

		}
	 	
		%>
					</tbody>
						</table>
					</div>
					<button type="button" id="download" class="btn btn-outline-primary" onClick="printPdf()">download</button>
					<script type="text/javascript">
						
						function printPdf(){
							window.print();
						}
					</script>
								
				</div>
		</section>

		
							
</body>
</html>