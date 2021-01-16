package in.edu.kristhujayanthi;


public class bill_service {

	bill_dao dao=new bill_dao();
	public int insertData(String imgid,String imgname,String price,String cname,String cardno)
	{
	int i=dao.insertData(imgid,imgname,price,cname,cardno);
	return i;
	}
}