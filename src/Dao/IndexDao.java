package Dao;

import java.util.ArrayList;
import java.util.List;

import DBUtil.DBUtils;
import Pojo.EnvirmentData;
import Pojo.FixedData;
import Pojo.IndexData;

public class IndexDao {
	DBUtils db;
	public IndexDao() {
		db = DBUtils.getInstance();
	}
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
	public List<FixedData> getTodayNews(String id) {
		db.getConnection();
		String sql = "select * from fixeddatatable where newsType = '" +id+ "'";
		List<FixedData> reslist = new ArrayList<FixedData>();
	    List<Object> list = new ArrayList<Object>();
	    //list.add(2014303342);
	    try {
	        reslist = db.executeQueryByRef(sql,list,FixedData.class);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        db.closeDB();
	    }
		return reslist;
	}
	public List<EnvirmentData> getEnvList() {
		db.getConnection();
		String sql = "select * from envirmentdatatable";
		List<EnvirmentData> reslist = new ArrayList<EnvirmentData>();
	    List<Object> list = new ArrayList<Object>();
	    //list.add(2014303342);
	    try {
	        reslist = db.executeQueryByRef(sql,list,EnvirmentData.class);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        db.closeDB();
	    }
		return reslist;
	}
	public List<FixedData> getSearchNews(String searchWord) {
		db.getConnection();
		String sql = "select * from fixeddatatable WHERE topic like '%"+searchWord+"%'";
		List<FixedData> reslist = new ArrayList<FixedData>();
	    List<Object> list = new ArrayList<Object>();
	    //list.add(2014303342);
	    try {
	        reslist = db.executeQueryByRef(sql,list,FixedData.class);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        db.closeDB();
	    }
		return reslist;
	}
}
