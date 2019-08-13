<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="Pojo.FixedData"%>
<%@page import="Pojo.EnvirmentData"%>
<%@page import="Pojo.DepartmentData"%>
<%@page import="Service.BmdhPageService"%>
<%@page import="Service.IndexService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>寿光·走进寿光</title>

<link rel="stylesheet" href="./../resource/css/index.css">
<link rel="stylesheet" href="./../resource/css/bmdhPage.css">

<script src="./../resource/util/jquery-3.3.1.min.js"></script>  <!-- 引入jQuery -->
<script src="./../resource/js/index.js"></script>
<script src="./../resource/js/bmdhPage.js"></script>

<%
	IndexService indexService = new IndexService();
	//获取环境数据
	List<EnvirmentData> envList = new ArrayList<EnvirmentData>();
	envList = indexService.getEnvList();
	String str = "";
	String temp = "";
	for(int i=0;i<envList.size();i++){
		temp = envList.get(i).getCity() + "：" + envList.get(i).getPm2_5() + "  ";
		str = str + temp;
		temp = "";
	}
	
	BmdhPageService bmdhPageService = new BmdhPageService();
	List<DepartmentData> list1 = new ArrayList<DepartmentData>();
	list1 = bmdhPageService.getDepartmentmentInfo("1");
	
	List<DepartmentData> list2 = new ArrayList<DepartmentData>();
	list2 = bmdhPageService.getDepartmentmentInfo("2");
	
	List<DepartmentData> list3 = new ArrayList<DepartmentData>();
	list3 = bmdhPageService.getDepartmentmentInfo("3");
	
%>

</head>
<body class="tableWH" style="position: absolute;" onload="load()">
	<div id="mainDiv"  class="tableWH">
		<div id="firstDiv">
			<div id="topFirst">
				<table class="tableWH">
					<tr>
						<td align="center" style="padding-right: 40px; width:60%">
							<span id="time" class="spanTop">  </span>
						</td>
						<td align="center" style="padding-right: 40px">
							<marquee><span id="env" class="spanTop">PM2.5：  <%=str %></span></marquee>
						</td>
					</tr>
				</table>				
			</div>
			<div id="middleFirst">
				<table class="tableWH">
					<tr style="width:100%; height:45%">
						<td></td>
					</tr>
					<tr style="background-color: #0766ab;">
						<td></td>
					</tr>
					<tr style="width:100%; height:45%">
						<td></td>
					</tr>
				</table>
			</div>
			<div id="floatDiv">
				<table class="tableWH">
					<tr>
						<td align="center">
							<img src="./../resource/img/guohui.png" width="65px" height="65px">
						</td>
					</tr>
					<tr>
						<td align="center">
							<span style="font-size:23px;font-weight: bolder;color: #0766ab;">中国 · 寿光</span><br/>
							<span style="font-size:10px;font-weight: bolder;color: #0766ab;">China ShouGuang</span>
						</td>
					</tr>
				</table>
			</div>
			<div id="bottomFirst">
				<table class="tableWH">
					<tr>
						<td align="center">
							<div style="width:30%; height:95%;">
								<input id="userInput" type="text" style="width:80%; height:80%; font-size:10px; color:#111; float:left" placeholder="请输入您要搜索的关键字">
								<input type="button" value="搜索" onclick="searchL()" style="width:50px; height:100%; float:left; background-color:#0766ab; border:none; color:#fff; font-size:10px;">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="secondDiv">
			<table style="width:80%;">
				<tr>
					<td align="center"><a href="http://127.0.0.1:8080/netForGov/"><img src="./../resource/img/word1.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;首页</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="bmdhjumpPage('zwgk')"><img src="./../resource/img/word2.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务公开</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="bmdhjumpPage('zjsg')"><img src="./../resource/img/word4.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;走进寿光</span></a></td>
					<td align="center"><a href="#"><img src="./../resource/img/word4.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;部门导航</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zwfu')"><img src="./../resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务服务</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('xwzx')"><img src="./../resource/img/word6.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;新闻中心</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zmhd')"><img src="./../resource/img/word3.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政民互动</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('sssg')"><img src="./../resource/img/word8.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;数说寿光</span></a></td>
				</tr>
			</table>
		</div>
		<div id="thirdDiv">
			<div id="mianThirdDiv">
				<table class="tableWH">
					<tr>
						<td colspan="5"><span class="span1">四大班子、党群系统：</span></td>
					</tr>
					<%for(int i=0;i<list1.size();i++){ 
						if(i%5 == 0){
					%>
						<tr>
						<%} %>
						<td align="center" class="td1">
							<a href="<%=list1.get(i).getUrl() %>">
							<img src="./../resource/img/<%=list1.get(i).getPath() %>" width="40px" height="40px"><br/>
							<span class="span2"><%=list1.get(i).getName() %></span>
							</a>
						</td>
						<%if(i%5 == 4 || i==list1.size()-1){ %>
						</tr>
						<%} %>
					<%} %>
				</table>
			</div>
		</div>
		<div id="forthDiv">
			<div id="mianForthDiv">
				<table class="tableWH">
					<tr>
						<td colspan="5"><span class="span1">政府部门：</span></td>
					</tr>
					<%for(int i=0;i<list2.size();i++){ 
						if(i%5 == 0){
					%>
						<tr>
						<%} %>
						<td align="center" class="td1">
							<a href="<%=list2.get(i).getUrl() %>">
							<img src="./../resource/img/<%=list2.get(i).getPath() %>" width="40px" height="40px"><br/>
							<span class="span2"><%=list2.get(i).getName() %></span>
							</a>
						</td>
						<%if(i%5 == 4 || i==list2.size()-1){ %>
						</tr>
						<%} %>
					<%} %>
				</table>
			</div>
		</div>
		<div id="fifthDiv">
			<div id="mianFifthDiv">
				<table class="tableWH">
					<tr>
						<td colspan="5"><span class="span1">开发区、镇（街区）:</span></td>
					</tr>
					<%for(int i=0;i<list3.size();i++){
						if(i%5 == 0){
					%>
						<tr>
						<%} %>
						<td align="center" class="td1">
							<a href="<%=list3.get(i).getUrl() %>">
							<img src="./../resource/img/<%=list3.get(i).getPath() %>" width="40px" height="40px"><br/>
							<span class="span2"><%=list3.get(i).getName() %></span>
							</a>
						</td>
						<%if(i%5 == 4 || i==list3.size()-1){ %>
						</tr>
						<%} %>
					<%} %>
				</table>
			</div>
		</div>
		<div id="bottomDiv">
			<table style="width: 60%; height: 100%">
				<tr>
					<td align="right"><span style="color: #fff; font-size: 12px;">友情链接：</span></td>
					<td align="center" style="width: 27%;"><div class="balaDiv"><a href="http://www.gov.cn/" class="balaaa"><img src="./../resource/img/guohui.png" class="imgBottom"><span class="balaSpan">&emsp;中国政府网</span></a></div></td>
					<td align="center" style="width: 29%;"><div class="balaDiv"><a href="http://www.sd.gov.cn/" class="balaaa"><img src="./../resource/img/guohui.png" class="imgBottom"><span class="balaSpan">&emsp;山东省人民政府</span></a></div></td>
					<td align="center" style="width: 27%;"><div class="balaDiv"><a href="http://www.weifang.gov.cn/" class="balaaa"><img src="./../resource/img/guohui.png" class="imgBottom"><span class="balaSpan">&emsp;潍坊市人民政府</span></a></div></td>
				</tr>
				<tr style="height:50%">
					<td align="right">
						<img src="./../resource/img/jg.png" style="width: 35px;height: 35px;">
					</td>
					<td colspan="2" align="left">
						<span class="bala"><a class="balaa" href="http://sgsxfj.weifang.gov.cn/login">网上信访受理平台</a> | <a class="balaa" href="http://sgsxfj.weifang.gov.cn/login">交通安全综合服务管理平台 </a>|<a class="balaa" href="http://www.shouguang.gov.cn/map/"> 站点地图</a> | <a class="balaa" href="http://en.shouguang.gov.cn/">ENGLISH</a></span>&emsp; 
						<span class="bala">中共寿光市委 寿光市人民政府主办 Tel：1234-12345678 鲁ICP备00000000号 网站标识码：1234567890 </span><br/>
						<span class="bala">技术支持：XXX有限公司。推荐使用IE8.0及以上浏览器浏览本站 </span> &emsp; 
					</td>
					<td>
						<img src="./../resource/img/zc.png" style="width: 75px;height: 35px;">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>