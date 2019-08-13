package Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import Dao.IndexDao;
import Pojo.EnvirmentData;
import Pojo.FixedData;
import Pojo.IndexData;

public class IndexService {
	IndexDao indexDao;
	public IndexService() {
		indexDao = new IndexDao();
	}
	
	public static void main(String[] args) {
		Random ra =new Random();
		int num2 = ra.nextInt(2)+1;
		System.out.println(num2);
	}

	/*
	 * ��ȡindexҳ�����Ϣ
	 * */
	public List<IndexData> getAllNews() {
		List<IndexData> list = new ArrayList<>();
		list = indexDao.getAllNews();
		List<IndexData> returnlist = new ArrayList<>();
		
		//�������ݿ��õ���ֵ

		List<IndexData> list2 = new ArrayList<IndexData>();
		List<IndexData> list4 = new ArrayList<IndexData>();
		
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getNewsType().equals("2")){ //���ѡ��  ����2  ��һ��ֵ
				list2.add(list.get(i));
			}else if(list.get(i).getNewsType().equals("4")){ //���ѡ��  ����4  ������ֵ
				list4.add(list.get(i));
			}else {
				returnlist.add(list.get(i));
			}
		}
		
		Random ra =new Random();
		
		int num2 = ra.nextInt(list2.size());
		returnlist.add(list2.get(num2));
		
		int num4 = ra.nextInt(list4.size());
		returnlist.add(list4.get(num4));
		list4.remove(num4);
		num4 = ra.nextInt(list4.size());
		returnlist.add(list4.get(num4));
		
		return returnlist;
	}
	
	public List<FixedData> getTodayNews(String id) {
		return indexDao.getTodayNews(id);
	}
	
	public List<EnvirmentData> getEnvList(){
		return indexDao.getEnvList();
	}

	public List<FixedData> getSearchNews(String searchWord) {
		return indexDao.getSearchNews(searchWord);
	}
}
