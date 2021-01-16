package in.edu.kristhujayanthi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class seller_dao {

public int insertData(String name,String arname,String price,String image_id,String imgfile,String im_email) {
	int i = 0;
	PreparedStatement pstmt = null;
	try {
		Connection con=DBUtility_For_Connection.getConnection();
		pstmt=con.prepareStatement("insert into seller values(?,?,?,?,?,?)");
		pstmt.setString(1,name);  
		pstmt.setString(2,arname);
		pstmt.setString(3,price);
		pstmt.setString(4,image_id);
		pstmt.setString(5,imgfile);
		pstmt.setString(6,im_email);
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
	
public int deleteData(String name) {
		int j = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con=DBUtility_For_Connection.getConnection();	
			pstmt=con.prepareStatement("delete from seller where name=?");
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
