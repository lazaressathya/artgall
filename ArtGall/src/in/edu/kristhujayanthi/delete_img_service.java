package in.edu.kristhujayanthi;

public class delete_img_service {

	delete_img_dao dao1=new delete_img_dao();
	public int deleteData(String name)
	{
	int j=dao1.deleteData(name);
	return j;
	}
	
}