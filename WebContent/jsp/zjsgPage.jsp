<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="Pojo.FixedData"%>
<%@page import="Pojo.EnvirmentData"%>
<%@page import="Pojo.ZwgkPageData"%>
<%@page import="Service.ZjsgPageService"%>
<%@page import="Service.IndexService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>寿光·走进寿光</title>

<link rel="stylesheet" href="./../resource/css/index.css">
<link rel="stylesheet" href="./../resource/css/zjsgPage.css">

<script src="./../resource/util/jquery-3.3.1.min.js"></script>  <!-- 引入jQuery -->
<script src="./../resource/js/index.js"></script>
<script src="./../resource/js/zjsgPage.js"></script>

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
	
	ZjsgPageService zjsgPageService = new ZjsgPageService();
	List<FixedData> list = zjsgPageService.getShouGuangInfo();
	
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
					<td align="center"><a href="javascript:void(0);" onclick="zjsgjumpPage('zwgk')"><img src="./../resource/img/word2.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务公开</span></a></td>
					<td align="center"><a href="#"><img src="./../resource/img/word4.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;走进寿光</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="zjsgjumpPage('bmdh')"><img src="./../resource/img/word9.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;部门导航</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zwfu')"><img src="./../resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务服务</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('xwzx')"><img src="./../resource/img/word6.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;新闻中心</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zmhd')"><img src="./../resource/img/word3.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政民互动</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('sssg')"><img src="./../resource/img/word8.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;数说寿光</span></a></td>
				</tr>
			</table>
		</div>
		<div id="thirdDiv">
			<div id="mainThirdDiv">
				<div id="topThirdDiv">
					<span style="color: red;">&emsp; ┃ </span><span style="font-weight: bolder;">寿光概况</span>
				</div>
				<div id="leftThirdDiv">
					<img src="./../resource/img/map.png" width="100%" height="100%">
				</div>
				<div id="rightThirdDiv">
					<table class="tableWH">
						<tr>
							<td colspan="4" style="height:70%;">&emsp;&emsp;<span class="span0"><%=list.get(0).getContext() %><a href="<%=list.get(0).getUrl() %>">[查看详情]</a></span></td>
						</tr>
						<tr>
							<%for(int i=1;i<5;i++){ %>
							<td><a href="<%=list.get(i).getUrl() %>"><span class="span1">▶ &nbsp;<%=list.get(i).getTopic() %></span></a></td>
							<%} %>
						</tr>
						<tr>
							<%for(int i=5;i<9;i++){ %>
							<td><a href="<%=list.get(i).getUrl() %>"><span class="span1">▶ &nbsp;<%=list.get(i).getTopic() %></span></a></td>
							<%} %>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="forthDiv">
			<div id="mianForthDiv">
				<div id="topForthDiv">
					<span style="color: red;">&emsp; ┃ </span><span style="font-weight: bolder;">投资寿光</span>
				</div>
				<div id="bottomForthDiv">
					<table class="tableWH">
						<tr>
							<td align="center" style="width:15%"><img src="./../resource/img/zjsg1.png" width="100px" height="70px"></td>
							<td align="left"><span class="span2">发展优势</span><br/><span class="span3">&emsp;&emsp;为进一步加快现代产业发展，提高区域综合竞争力，重点培育石油装备产业、生物医药产业、新型...……</span></td>
							<td align="center" style="width:15%"><img src="./../resource/img/zjsg2.png" width="100px" height="70px"></td>
							<td align="left"><span class="span2">投资环境</span><br/><span class="span3">&emsp;&emsp;“一主、一副、两轴”的市域城镇布局。“一主”是指寿光中心城区，重点发展居住、商贸物流、...……</span></td>
						</tr>
						<tr>
							<td align="center"><img src="./../resource/img/zjsg3.png" width="100px" height="70px"></td>
							<td align="left"><span class="span2">知名企业</span><br/><span class="span3">
							&emsp;<a href="http://www.shouguang.gov.cn/sq/tzsg/zmqy/201307/t20130716_3290582.html">鲁丽集团</a>&emsp;&emsp;&emsp;&emsp;
							<a href="http://www.shouguang.gov.cn/sq/tzsg/zmqy/201307/t20130716_3290579.html">凯马汽车</a>&emsp;&emsp;&emsp;&emsp;
							<a href="http://www.shouguang.gov.cn/sq/tzsg/zmqy/201307/t20130716_3290575.html">巨能控股</a>&emsp;&emsp;&emsp;&emsp;
							</span></td>
							<td align="center"><img src="./../resource/img/zjsg4.png" width="100px" height="70px"></td>
							<td align="left"><span class="span2">服务指南</span><br/><span class="span3">
							<a href="http://www.shouguang.gov.cn/sq/tzsg/fwzn/201307/t20130716_3290551.html">相关优惠政策</a>&emsp;&emsp;&emsp;&emsp;
							<a href="http://www.shouguang.gov.cn/sq/tzsg/fwzn/201307/t20130716_3290553.html">寿光市服务机构</a>&emsp;&emsp;&emsp;&emsp;
							</span></td>
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
</body>
</html>