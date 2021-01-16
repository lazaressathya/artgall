package in.edu.kristhujayanthi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class LoginDao
 */
@WebServlet("/LoginDao")
public class LoginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDao() {
        super();
        // TODO Auto-generated constructor stub
    }
    public static boolean validate(String email,String passcode)
    {
    	boolean i = false;
    	PreparedStatement pstmt = null;
    	try {
    		Connection con = DBUtility_For_Connection.getConnection();
    		pstmt = con.prepareStatement("select * from ARTREG where email=? and passcode=?");
    		System.out.println(email+" ,"+passcode);
    		pstmt.setString(1,email);
    		pstmt.setString(2,passcode);
    		
    		ResultSet rs = pstmt.executeQuery();
    		i = rs.next();
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	return i;
    }
}
