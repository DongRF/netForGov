<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="Pojo.FixedData"%>
<%@page import="Pojo.EnvirmentData"%>
<%@page import="Pojo.ZwgkPageData"%>
<%@page import="Service.ZwgkPageService"%>
<%@page import="Service.IndexService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>寿光·政务公开</title>

<link rel="stylesheet" href="./../resource/css/index.css">
<link rel="stylesheet" href="./../resource/css/zwgkPage.css">

<script src="./../resource/util/jquery-3.3.1.min.js"></script>  <!-- 引入jQuery -->
<script src="./../resource/js/index.js"></script>
<script src="./../resource/js/zwgkPage.js"></script>

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

	ZwgkPageService zwgkPageService = new ZwgkPageService();
	List<FixedData> managerList = zwgkPageService.getManagerInfo();
	
	List<ZwgkPageData> gkxxList = zwgkPageService.getGkxxInfo("gkxx");
	List<ZwgkPageData> zfxxList = zwgkPageService.getGkxxInfo("zfxx");
	
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
					<td align="center"><a href="#"><img src="./../resource/img/word2.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务公开</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="zwgkjumpPage('zjsg')"><img src="./../resource/img/word4.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;走进寿光</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="zwgkjumpPage('bmdh')"><img src="./../resource/img/word9.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;部门导航</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zwfu')"><img src="./../resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务服务</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('xwzx')"><img src="./../resource/img/word6.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;新闻中心</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zmhd')"><img src="./../resource/img/word3.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政民互动</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('sssg')"><img src="./../resource/img/word8.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;数说寿光</span></a></td>
				</tr>
			</table>
		</div>
		<div id="thirdDiv">
			<div id="mainThirdDiv">
				<table class="tableWH">
					<tr>
						<td rowspan="2" class="imgtd" align="center"><img class="zwgk_photo" src="./../resource/img/<%=managerList.get(0).getPath() %>"></td>
						<td style="width:30%; height:40%;"><span class="Bword"> <a href=""><%=managerList.get(0).getTopic() %></a></span></td>
						<td rowspan="2" class="imgtd" align="center"><img class="zwgk_photo" src="./../resource/img/<%=managerList.get(1).getPath() %>"></td>
						<td style="width:30%; height:40%;"><span class="Bword"> <a href=""><%=managerList.get(1).getTopic() %></a></span></td>
					</tr>
					<tr>
						<td class="Swordtd"><span class="Sword"> &emsp;&emsp;<%=managerList.get(0).getContext() %> <br/> &emsp;&emsp;<a href="http://www.shouguang.gov.cn/sq/sggk/ldbz_1/sw/">市委其他领导班子成员>></a></span></td>
						<td class="Swordtd"><span class="Sword"> &emsp;&emsp;<%=managerList.get(1).getContext() %> <br/> &emsp;&emsp;<a href="http://www.shouguang.gov.cn/sq/sggk/ldbz_1/sf/">政府其他领导班子成员>></a> </span></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="forthDiv">
			<div id="mainFourthDiv">
				<table class="tableWH">
					<tr>
						<td colspan="3"><span class="word1">最新公开信息</span></td>
						<td style="width:25%;"><span class="word1">政府信息公开专栏</span></td>
					</tr>
					<%
						for(int i=0;i<gkxxList.size();i++){
							
					%>
					<tr>
						<td>· <a href="<%=gkxxList.get(i).getUrl() %>"><span style="font-size:12px;"><%=gkxxList.get(i).getTopic() %></span></a></td>
						<td><span style="font-size:12px;">【<%=gkxxList.get(i).getDepartment() %>】</span></td>
						<td><span style="font-size:12px;"><%=gkxxList.get(i).getSavetime() %></span></td>
						<td class="td1"><a href="<%=zfxxList.get(i).getUrl() %>"><span style="font-size:12px;"><%=zfxxList.get(i).getTopic() %> >></span></a></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<div id="fifthDiv">
			<div id="mainFifthDiv">
				<div id="leftMainFifthDiv">
					<table class="tableWH">
						<tr>
							<td id="item1" align="center" rowspan="2" class="opac1" style="background-color: #01bf9d" onmouseover="funcmove1('item1')" onmouseout="funcout1('item1')"><a class="noline" href="http://xxgk.shouguang.gov.cn/XXGK/zwgk/xzqlyx/"><img src="./../resource/img/zwgk1.png" class="img1"><br/><span class="span2">行政权力运行公开</span></a></td>
							<td id="item2" align="center" rowspan="5" class="opac1" style="background-color: #5babe6" onmouseover="funcmove1('item2')" onmouseout="funcout1('item2')"><a class="noline" href="http://xxgk.shouguang.gov.cn/XXGK/zwgk/ggqsydw/"><img src="./../resource/img/zwgk2.png" style="width: 45px;height: 45px;"><br/><span class="span2">公共企事业单位信息公开</span></a></td>
							<td id="item3" align="center" rowspan="3" class="opac1" style="background-color: #e87e04" onmouseover="funcmove1('item3')" onmouseout="funcout1('item3')"><a class="noline" href="http://xxgk.shouguang.gov.cn/XXGK/zwgk/zwgkzzgl/"><img src="./../resource/img/zwgk3.png" class="img1"><br/><span class="span2">政务公开组织管理</span></a></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td id="item4" align="center" rowspan="3" class="opac1" style="background-color: #f3c500" onmouseover="funcmove1('item4')" onmouseout="funcout1('item4')"><a class="noline" href="http://xxgk.shouguang.gov.cn/XXGK/zwgk/zdly/"><img src="./../resource/img/zwgk4.png" class="img1"><br/><span class="span2">重点领域信息公开</span></a></td>
						</tr>
						<tr>
							<td id="item5" align="center" rowspan="2" class="opac1" style="background-color: #217fbc" onmouseover="funcmove1('item5')" onmouseout="funcout1('item5')"><a class="noline" href="http://xxgk.shouguang.gov.cn/XXGK/zwgk/zcjdyhy/"><img src="./../resource/img/zwgk5.png" class="img1"><br/><span class="span2">政策解读</span></a></td>
						</tr>
						<tr>
						</tr>
					</table>
				</div>
				<div id="rightMainFifthDiv">
					<table class="tableWH">
						<tr>
							<td align="center" class="td2"><a href="http://www.shouguang.gov.cn/hd/"><img src="./../resource/img/table1.png" class="img2"></a></td>
							<td align="center" class="td2"><a href="http://xxgk.shouguang.gov.cn/XXGK/ZFWJ/"><img src="./../resource/img/table2.png" class="img2"></a></td>
							<td align="center" class="td2"><a href="http://xxgk.shouguang.gov.cn/3933/3938/3940/4168/index_10275.html"><img src="./../resource/img/table3.png" class="img2"></a></td>
						</tr>
						<tr>
							<td align="center" class="td2"><a href="http://sgcredit.shouguang.gov.cn/sgs/xzcf.action"><img src="./../resource/img/table4.png" class="img2"></a></td>
							<td align="center" class="td2"><a href="http://qingdan.shouguang.gov.cn/front/main/index"><img src="./../resource/img/table5.png" class="img2"></a></td>
							<td align="center" class="td2"><a href="http://xxgk.shouguang.gov.cn/3933/4038/index_10275.html"><img src="./../resource/img/table6.png" class="img2"></a></td>
						</tr>
						<tr>
							<td align="center" class="td2"><a href="http://xxgk.shouguang.gov.cn/3933/3973/5261/index_10275.html"><img src="./../resource/img/table7.png" class="img2"></a></td>
							<td align="center" class="td2"><a href="http://xxgk.shouguang.gov.cn/XXGK/CYCS/"><img src="./../resource/img/table8.png" class="img2"></a></td>
							<td align="center" class="td2"><a href="http://xxgk.shouguang.gov.cn/XXGK/TJPH/"><img src="./../resource/img/table9.png" class="img2"></a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>	
				<div id="bottomDiv">
			<table style="width: 60%; height: 100%">
				<tr>
					<td align="right"><span style="color:#fff; font-size: 12px;">友情链接：</span></td>
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