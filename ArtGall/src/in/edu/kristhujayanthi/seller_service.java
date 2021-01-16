package in.edu.kristhujayanthi;


public class seller_service {

	seller_dao dao=new seller_dao();
	public int insertData(String name,String arname,String price,String image_id,String imgfile,String im_email)
	{
	int i=dao.insertData(name,arname,price,image_id,imgfile,im_email);
	return i;
	}
	
	seller_dao dao1=new seller_dao();
	public int deleteData(String name)
	{
	int j=dao1.deleteData(name);
	return j;
	}
	
}