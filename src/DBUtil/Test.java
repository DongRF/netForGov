package DBUtil;

import java.util.ArrayList;
import java.util.List;

import Pojo.IndexData;
import Pojo.IndexHeadline;
import Pojo.IndexRealTimeNews;

public class Test {
  /**
   * @param args
   */
  public static void main(String[] args) {
      DBUtils db = DBUtils.getInstance();
      db.getConnection();
      String sql = "select * from indexDataTable";
      List<IndexData> reslist = new ArrayList<IndexData>();
      List<Object> list = new ArrayList<Object>();
      //list.add(2014303342);

       try {
           reslist = db.executeQueryByRef(sql,list,IndexData.class);
           
           for(IndexData ac:reslist){
        	   System.out.println(ac.getTopic());
        	   System.out.println(ac.getContext());
        	   System.out.println(ac.getUrl());
        	   
           }
       } catch (Exception e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       }finally{
           db.closeDB();
       }
   }
}
