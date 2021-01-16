package in.edu.kristhujayanthi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegServlet_Dao {

public int insertData(String username,String address,String pincode,String email,String mobileno,String passcode) {
	int i = 0;
	PreparedStatement pstmt = null;
	try {
		Connection con=DBUtility_For_Connection.getConnection();
		pstmt=con.prepareStatement("insert into ARTREG values(?,?,?,?,?,?)");
		pstmt.setString(1,username);  
		pstmt.setString(2,address);
		pstmt.setString(3,pincode);
		pstmt.setString(4,email);
		pstmt.setString(5,mobileno);
		pstmt.setString(6,passcode);
		i=pstmt.executeUpdate();  
		System.out.println(i+" records inserted"); 
		
		
		
		
	} catch (SQLException e) {
		try {
			pstmt.close();
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		e.printStackTrace();
	}

	return i;
	
	
	}
}
