package Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import Dao.ZwgkPageDao;
import Pojo.FixedData;
import Pojo.ZwgkPageData;

public class ZwgkPageService {

	public List<FixedData> getManagerInfo(){
		ZwgkPageDao dao = new ZwgkPageDao();
		return dao.getInfo("zwgk_manager");
	}
	
	public List<ZwgkPageData> getGkxxInfo(String type){
		ZwgkPageDao dao = new ZwgkPageDao();
		List<ZwgkPageData> list =  dao.getGkxxInfo(type);
		List<ZwgkPageData> resultList = new ArrayList<>();
		int num = list.size();
		Random ra =new Random();
		for(int i=0;i<num;i++) {
			int temp = ra.nextInt(list.size());
			resultList.add(list.get(temp));
			list.remove(temp);
			if(resultList.size() == 5) {
				break;
			}
		}
		
		return resultList;
	}
}
