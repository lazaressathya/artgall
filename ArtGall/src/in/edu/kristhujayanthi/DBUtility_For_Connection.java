package in.edu.kristhujayanthi;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtility_For_Connection {


	public static Connection getConnection()
	{
		Connection con = null;
		String url="jdbc:oracle:thin:@localhost:1521/ORCL";
		String userName="SYSTEM";
		String passcode="Sathya";
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url, userName, passcode);
			
			System.out.println("Calling DB utility.........."+con);
		}
		catch(Exception e)
		{
			System.out.println("Catch block @ DB utility........Not able to load the driver"+e.getMessage());
			//e.printStackTrace();
		}
		
		return con;

	}


}
