package Service;

import java.util.List;

import Dao.BmdhPageDao;
import Pojo.DepartmentData;

public class BmdhPageService {

	public List<DepartmentData> getDepartmentmentInfo(String type){
		BmdhPageDao dao = new BmdhPageDao();
		return dao.getDepartmentInfo(type);
	}
}
