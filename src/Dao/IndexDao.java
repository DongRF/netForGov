package Dao;

import java.util.ArrayList;
import java.util.List;

import DBUtil.DBUtils;
import Pojo.IndexData;

public class IndexDao {
	DBUtils db = DBUtils.getInstance();
	/*
	 * 获取index页面的所有信息
	 * */
	public List<IndexData> getAllNews() {
		  db.getConnection();
	      String sql = "select * from indexDataTable";
	      List<IndexData> reslist = new ArrayList<IndexData>();
	      List<Object> list = new ArrayList<Object>();
	      //list.add(2014303342);

	       try {
	           reslist = db.executeQueryByRef(sql,list,IndexData.class);
	       } catch (Exception e) {
	           e.printStackTrace();
	       }finally{
	           db.closeDB();
	       }
		return reslist;
	}
}
