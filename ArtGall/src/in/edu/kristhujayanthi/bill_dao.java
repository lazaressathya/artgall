package in.edu.kristhujayanthi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class bill_dao {

public int insertData(String imgid,String imgname,String price,String cname,String cardno) {
	int i = 0;
	PreparedStatement pstmt = null;
	try {
		Connection con=DBUtility_For_Connection.getConnection();
		pstmt=con.prepareStatement("insert into BILL values(?,?,?,?,?)");
		pstmt.setString(1,imgid);  
		pstmt.setString(2,imgname);
		pstmt.setString(3,price);
		pstmt.setString(4,cname);
		pstmt.setString(5,cardno);
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
