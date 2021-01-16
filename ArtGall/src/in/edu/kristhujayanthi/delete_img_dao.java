package in.edu.kristhujayanthi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class delete_img_dao {


	
public int deleteData(String name) {
		int j = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con=DBUtility_For_Connection.getConnection();	
			pstmt=con.prepareStatement("delete from seller where image_id=?");
			pstmt.setString(1,name); 
			j=pstmt.executeUpdate();  
			System.out.println(j+" records deleted"); 
	        
		} catch (SQLException e) {
			try {
				pstmt.close();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return j;
	}
}
