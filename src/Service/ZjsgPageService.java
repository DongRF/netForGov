package Service;

import java.util.List;

import Dao.ZwgkPageDao;
import Pojo.FixedData;

public class ZjsgPageService {
	public List<FixedData> getShouGuangInfo(){
		ZwgkPageDao dao = new ZwgkPageDao();
		return dao.getInfo("shouguang");
	}
}
