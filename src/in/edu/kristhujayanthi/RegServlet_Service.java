package in.edu.kristhujayanthi;


public class RegServlet_Service {

	RegServlet_Dao dao=new RegServlet_Dao();
	public int insertData(String username,String address,String pincode,String email,String mobileno,String passcode)
	{
	int i=dao.insertData(username,address,pincode,email,mobileno,passcode);
	return i;
	}
}
