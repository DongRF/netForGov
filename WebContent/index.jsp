<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="Pojo.IndexRealTimeNews"%>
<%@page import="Pojo.IndexHeadline"%>
<%@page import="Pojo.IndexData"%>
<%@page import="Service.IndexService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>欢迎访问 XXX 政府网</title>

<link rel="stylesheet" href="./resource/css/index.css">

<%
	IndexService indexService = new IndexService();
	List<IndexData> allList = indexService.getAllNews();
	List<IndexData> list1 = new ArrayList<IndexData>();
	List<IndexData> list2 = new ArrayList<IndexData>();
	List<IndexData> list3 = new ArrayList<IndexData>();
	List<IndexData> list4 = new ArrayList<IndexData>();
	
	for(int i=0;i<allList.size();i++){
		if(allList.get(i).getNewsType() == "1"){
			list1.add(allList.get(i));
		}
		if(allList.get(i).getNewsType() == "2"){
			list2.add(allList.get(i));
		}
		if(allList.get(i).getNewsType() == "3"){
			list3.add(allList.get(i));
		}
		if(allList.get(i).getNewsType() == "4"){
			list4.add(allList.get(i));
		}
	}
	
	//String username = request.getSession().getAttribute("username").toString();
	String username = "张三";
	boolean isLogin = false;
	//if(username != null &&!username.equals("")) isLogin = true;
	
	IndexRealTimeNews realTimeNews = new IndexRealTimeNews();
	realTimeNews.setNewsContent("百度");
	realTimeNews.setNewsUrl("https://www.baidu.com/");
	
	IndexRealTimeNews realTimeNews1 = new IndexRealTimeNews();
	realTimeNews1.setNewsContent("百度12334214342432");
	realTimeNews1.setNewsUrl("https://www.baidu.com/");
	
	List<IndexRealTimeNews> list = new ArrayList<IndexRealTimeNews>();
	list.add(realTimeNews);
	list.add(realTimeNews1);
	
	IndexHeadline headline = new IndexHeadline();
	headline.setTopic("全面提升危化品企业安全管理水平");
	headline.setContext("1月6日至12日，国家应急管理部专家来我市，就如何提升危险化学品企业安全管理水平开展了为期1周的专家指导服务工作。23日，应急管理部危险化学品重点县（寿光市）专家指导服务情况反馈会在我市举行，专家对本次指导服务的整体情况、发现问题和下步工作进行了通报，应急管理部危化监管司司长孙广宇就...");
	headline.setUrl("http://www.shouguang.gov.cn/news/days/201901/t20190124_5297836.html");
%>

<script src="./resource/util/jquery-3.3.1.min.js"></script>  <!-- 引入jQuery -->
<script src="./resource/js/index.js"></script>
<script>
	function load(){
		isLogin();
		changaImg();	//图片切换
		time();			//启动计时器
		loadData();
	}

	function isLogin(){		
		var isLogin = <%=isLogin %>;
		var username = "<%=username %>";
		if(isLogin){
			$("#welcome").text("欢迎 "+username);
		}else{
			$("#welcome").html("您还没有登录，点击 <a href='#' style='color: #ddd;'> 登录 </a>");
		}
	}
</script>

</head>
<body class="tableWH" style="position: absolute;" onload="load()">
	<div id="mainDiv"  class="tableWH">
		<div id="firstDiv">
			<div id="topFirst">
				<table border="0" class="tableWH">
					<tr>
						<td align="center" style="padding-right: 40px">
							<span id="time" class="spanTop">  </span>
						</td>
						<td align="center" style="padding-right: 40px">
							<span id="welcome" class="spanTop"></span>
						</td>
					</tr>
				</table>				
			</div>
			<div id="middleFirst">
				<table  border="0" class="tableWH">
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
				<table border="0" class="tableWH">
					<tr>
						<td align="center">
							<img src="./resource/img/guohui.png" width="65px" height="65px">
						</td>
					</tr>
					<tr>
						<td align="center">
							<span style="font-size:23px;font-weight: bolder;color: #0766ab;">中国 · 汉东</span><br/>
							<span style="font-size:10px;font-weight: bolder;color: #0766ab;">China HanDong</span>
						</td>
					</tr>
				</table>
			</div>
			<div id="bottomFirst">
				<table border="0" class="tableWH">
					<tr>
						<td align="center">
							<div style="width:30%; height:95%;">
								<input type="text" style="width:80%; height:80%; font-size:10px; color:#111; float:left" placeholder="请输入您要搜索的关键字">
								<input type="button" value="搜索" style="width:50px; height:100%; float:left; background-color:#0766ab; border:none; color:#fff; font-size:10px;">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="secondDiv">
			<table border="0" style="width:80%;">
				<tr>
					<td align="center"><img src="./resource/img/word1.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;首页</span></td>
					<td align="center"><img src="./resource/img/word2.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务公开</span></td>
					<td align="center"><img src="./resource/img/word3.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政民互动</span></td>
					<td align="center"><img src="./resource/img/word4.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;走进汉东</span></td>
					<td align="center"><img src="./resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务服务</span></td>
				</tr>
			</table>
		</div>
		<div id="thirdDiv">
			<div id="mainThirdDiv">
				<div id="leftThird">
					<div id="imgDiv">
						<div class="pic" style="display: block;">
							<a href="http://www.hao123.com"><img class="cImg" src="./resource/img/1.jpg" /></a>
							<a href="http://www.hao123.com"><span class="urlWord">全面提升危化品企业安全管理水平 >></span></a>
						</div>
						<div class="pic" style="display: none;">
							<a href="http://www.hao123.com"><img class="cImg" src="./resource/img/2.jpg" /></a>
							<a href="http://www.hao123.com"><span class="urlWord">全面提升危化品企业安全管理水平 >></span></a>
						</div>
						<div class="pic" style="display: none;">
							<a href="http://www.hao123.com"><img class="cImg" src="./resource/img/3.jpg" /></a>
							<a href="http://www.hao123.com"><span class="urlWord">全面提升危化品企业安全管理水平 >></span></a>
						</div>
						<div class="pic" style="display: none;">
							<a href="http://www.baidu.com"><img class="cImg" src="./resource/img/4.jpg" /></a>
							<a href="http://www.hao123.com"><span class="urlWord">全面提升危化品企业安全管理水平 >></span></a>
						</div>
					</div>
				</div>
				<div id="rightThird">
					<table border="0" class="tableWH">
						<tr>
							<td style="height: 15%;"><a href="<%=headline.getUrl() %>" style="text-decoration:none"><span style="color:#fff; font-size:13px; font-weight: bolder;"><%=headline.getTopic() %></span></a></td>
						</tr>
						<tr>
							<td style=""><span style="font-size:12px; color: #ddd;">&nbsp;&nbsp;&nbsp;&nbsp;<%=headline.getContext() %></span></td>
						</tr>
						<tr>
							<td style="height: 15%;" align="right"><a href="<%=headline.getUrl() %>" style="text-decoration:none"><input type="button" value="了解详情 >>" style="font-style: italic; color: #fff; background-color: #0766ab; border: none"></a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="forthDiv">
			<div id="mainForthDiv">
				<table border="1" class="tableWH">
					<tr style="height:60px">
						<td align="center" style="width:10%;background-color:#0766ab">
							<span class="spanNow">实时</span><br>
							<span class="spanNow">新闻</span>
						</td>
						<td>
							<%for(int i=0;i<list.size();i++){ %>
								<marquee>
									<a href="<%=list.get(i).getNewsUrl() %>"><span  style="font-size:10px"><%=list.get(i).getNewsContent() %></span></a>&emsp;&emsp;&emsp;&emsp;
								</marquee>
								<%if(i != list.size()-1){ %>
								<br/>
								<%} %>
							<%} %>
						</td>
						<td style="width:25%"><a href="http://www.shouguang.gov.cn/zt/stjj/"><img src="./resource/img/logo1.png" width="100%" height="70%"></a></td>
						<td style="width:25%"><a href="http://www.shouguang.gov.cn/zt/ygcj/"><img src="./resource/img/logo2.png" width="100%" height="70%"></a></td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="itemForthLeft" style="width: 100%;height: 15%;">
								<table border="0" style="width: 85%; height:100%;">
									<tr>
										<td id="item1" align="center" onmousemove="funcmove('item1')" onmouseout="funcout('item1')"><span class="smailWord">今日要闻</span></td>
										<td id="item2" align="center" onmousemove="funcmove('item2')" onmouseout="funcout('item2')"><span class="smailWord">今日信息</span></td>
										<td id="item3" align="center" onmousemove="funcmove('item3')" onmouseout="funcout('item3')"><span class="smailWord">部门动态</span></td>
									</tr>
								</table>
							</div>
							<div id="tableForthLeft" style="width: 100%;height: 80%; background-color: #444;">
								<table>
									<tr>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr style="height:50px">
						<td colspan="4" align="center">
							<span class="bala">Copyright ©20190121 不想睡觉的程序员</span>&emsp; 
							<span class="bala">版权所有，保留一切权利。</span><br/>
							<span class="bala">推荐使用IE8.0及以上浏览器浏览本站 </span> &emsp; 
							<a href="#" class="bala">帮助</a> &emsp;
							<a href="#" class="bala">反馈</a> &emsp; 
							<a href="#" class="bala">投诉</a> &emsp; 
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>