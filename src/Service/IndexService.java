package Service;

import java.util.List;

import Dao.IndexDao;
import Pojo.IndexData;

public class IndexService {

	/*
	 * 获取index页面的信息
	 * */
	public List<IndexData> getAllNews() {
		IndexDao indexDao = new IndexDao();
		return indexDao.getAllNews();
	}
	
	public void getTodayNews(String id) {
		IndexDao indexDao = new IndexDao();
	}
}
