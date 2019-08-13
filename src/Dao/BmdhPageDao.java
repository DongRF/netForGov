package Dao;

import java.util.ArrayList;
import java.util.List;

import DBUtil.DBUtils;
import Pojo.DepartmentData;

public class BmdhPageDao {
	DBUtils db;
	public BmdhPageDao(){
		db = DBUtils.getInstance();
	}
	
	public List<DepartmentData> getDepartmentInfo(String type){
		db.getConnection();
	      String sql = "select * from departmentinfotable where type = '"+type+"'";
	      List<DepartmentData> reslist = new ArrayList<DepartmentData>();
	      List<Object> list = new ArrayList<Object>();

	       try {
	           reslist = db.executeQueryByRef(sql,list,DepartmentData.class);
	       } catch (Exception e) {
	           e.printStackTrace();
	       }finally{
	           db.closeDB();
	       }
		return reslist;
	}
}
