package Service;

import java.util.List;

import Dao.IndexDao;
import Pojo.IndexData;

public class IndexService {

	/*
	 * ��ȡindexҳ�����Ϣ
	 * */
	public List<IndexData> getAllNews() {
		IndexDao indexDao = new IndexDao();
		return indexDao.getAllNews();
	}
	
	public void getTodayNews(String id) {
		IndexDao indexDao = new IndexDao();
	}
}
