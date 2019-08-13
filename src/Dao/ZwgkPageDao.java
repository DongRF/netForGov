package Dao;

import java.util.ArrayList;
import java.util.List;

import DBUtil.DBUtils;
import Pojo.FixedData;
import Pojo.ZwgkPageData;

public class ZwgkPageDao {
	DBUtils db;
	public ZwgkPageDao(){
		db = DBUtils.getInstance();
	}
	
	public List<FixedData> getInfo(String param){
		db.getConnection();
	      String sql = "select * from fixedDataTable where newsType = '"+param+"' order by id asc";
	      List<FixedData> reslist = new ArrayList<FixedData>();
	      List<Object> list = new ArrayList<Object>();

	       try {
	           reslist = db.executeQueryByRef(sql,list,FixedData.class);
	       } catch (Exception e) {
	           e.printStackTrace();
	       }finally{
	           db.closeDB();
	       }
		return reslist;
	}

	public List<ZwgkPageData> getGkxxInfo(String type) {
		db.getConnection();
	      String sql = "select * from zwgkpagedatatable where type = '"+type+"'";
	      List<ZwgkPageData> reslist = new ArrayList<ZwgkPageData>();
	      List<Object> list = new ArrayList<Object>();

	       try {
	           reslist = db.executeQueryByRef(sql,list,ZwgkPageData.class);
	       } catch (Exception e) {
	           e.printStackTrace();
	       }finally{
	           db.closeDB();
	       }
		return reslist;
	}
}
