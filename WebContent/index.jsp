<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="Pojo.IndexData"%>
<%@page import="Pojo.EnvirmentData"%>
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

	
	List<IndexData> allList = new ArrayList<IndexData>();
	allList = indexService.getAllNews();
	List<IndexData> list1 = new ArrayList<IndexData>();
	List<IndexData> list2 = new ArrayList<IndexData>();
	List<IndexData> list3 = new ArrayList<IndexData>();
	List<IndexData> list4 = new ArrayList<IndexData>();
	
	for(int i=0;i<allList.size();i++){
		if(allList.get(i).getNewsType().equals("1")){
			list1.add(allList.get(i));
		}
		if(allList.get(i).getNewsType().equals("2")){
			list2.add(allList.get(i));
		}
		if(allList.get(i).getNewsType().equals("3")){
			list3.add(allList.get(i));
		}
		if(allList.get(i).getNewsType().equals("4")){
			list4.add(allList.get(i));
		}
	}
	
	//String username = request.getSession().getAttribute("username").toString();
	String username = "张三";
	boolean isLogin = false;
	//if(username != null &&!username.equals("")) isLogin = true;
%>

<script src="./resource/util/jquery-3.3.1.min.js"></script>  <!-- 引入jQuery -->
<script src="./resource/js/index.js"></script>
<script>
	function load(){
		changaImg();	//图片切换
		time();			//启动计时器	
		funcmove("item1");
		Rfuncmove("item4");
	}
	
</script>

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
							<img src="./resource/img/guohui.png" width="65px" height="65px">
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
								<input type="button" value="搜索" onclick="search()" style="width:50px; height:100%; float:left; background-color:#0766ab; border:none; color:#fff; font-size:10px;">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="secondDiv">
			<table style="width:80%;">
				<tr>
					<td align="center"><a href="#"><img src="./resource/img/word1.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;首页</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPage('zwgk')"><img src="./resource/img/word2.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务公开</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPage('zjsg')"><img src="./resource/img/word4.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;走进寿光</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPage('bmdh')"><img src="./resource/img/word9.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;部门导航</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zwfu')"><img src="./resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政务服务</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('xwzx')"><img src="./resource/img/word6.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;新闻中心</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('zmhd')"><img src="./resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;政民互动</span></a></td>
					<td align="center"><a href="javascript:void(0);" onclick="jumpPageOnPage('sssg')"><img src="./resource/img/word5.png" class="imgBottom"><span class="spanBottom">&nbsp;&nbsp;数说寿光</span></a></td>
				</tr>
			</table>
		</div>
		<div id="thirdDiv">
			<div id="mainThirdDiv">
				<div id="leftThird">
					<div id="imgDiv">
					<%for(int i=0;i<list1.size();i++){
						if(i==0){
						%>
						<div class="pic" style="display: block;">
						<a href="<%=list1.get(i).getUrl() %>"><img class="cImg" title="<%=list1.get(i).getTopic() %>" src="./resource/img/<%=list1.get(i).getPath() %>" /></a>
						<a href="<%=list1.get(i).getUrl() %>"><span class="urlWord"><%=list1.get(i).getTopic() %> >></span></a>
						</div>
						<%
						}else{
						%>
						<div class="pic" style="display: none;">
						<a href="<%=list1.get(i).getUrl() %>"><img class="cImg" title="<%=list1.get(i).getTopic() %>" src="./resource/img/<%=list1.get(i).getPath() %>" /></a>
						<a href="<%=list1.get(i).getUrl() %>"><span class="urlWord"><%=list1.get(i).getTopic() %> >></span></a>
						</div>
						<%
						}
					} %>
					</div>
				</div>
				<div id="rightThird">
					<table class="tableWH">
						<tr>
							<td style="height: 15%;"><a href="<%=list2.get(0).getUrl() %>" style="text-decoration:none"><span style="color:#fff; font-size:13px; font-weight: bolder;"><%=list2.get(0).getTopic() %></span></a></td>
						</tr>
						<tr>
							<td style=""><span style="font-size:12px; color: #ddd;">&nbsp;&nbsp;&nbsp;&nbsp;<%=list2.get(0).getContext() %></span></td>
						</tr>
						<tr>
							<td style="height: 15%;" align="right"><a href="<%=list2.get(0).getUrl() %>" style="text-decoration:none"><input type="button" value="了解详情 >>" style="font-style: italic; color: #fff; background-color: #0766ab; border: none"></a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="forthDiv">
			<div id="mainForthDiv">
				<table class="tableWH" style="border-collapse:collapse;">
					<tr style="height:60px; border-bottom:1px solid #000;">
						<td align="center" style="width:10%;background-color:#0766ab">
							<span class="spanNow">实时</span><br>
							<span class="spanNow">新闻</span>
						</td>
						<td>
							<marquee>
								<%for(int i=0;i<list3.size();i+=2){ %>
									<a href="<%=list3.get(i).getUrl() %>"><span  style="font-size:10px"><%=list3.get(i).getTopic() %></span></a>&emsp;&emsp;&emsp;&emsp;
								<%} %>
							</marquee>
							<marquee>
								<%for(int i=1;i<list3.size();i+=2){ %>
									<a href="<%=list3.get(i).getUrl() %>"><span  style="font-size:10px"><%=list3.get(i).getTopic() %></span></a>&emsp;&emsp;&emsp;&emsp;
								<%} %>
							</marquee>
						</td>
						<td style="width:25%"><a href="<%=list4.get(0).getUrl() %>"><img src="./resource/img/<%=list4.get(0).getPath() %>" width="100%" height="70%"></a></td>
						<td style="width:25%"><a href="<%=list4.get(1).getUrl() %>"><img src="./resource/img/<%=list4.get(1).getPath() %>" width="100%" height="70%"></a></td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="itemForthLeft" style="width: 100%;height: 15%;border-bottom: solid 2px;">
								<table style="width: 85%; height:100%;">
									<tr>
										<td id="item1" align="center" onmouseover="funcmove('item1')" onmouseout="funcout('item1')"><span class="smailWord">今日要闻</span></td>
										<td id="item2" align="center" onmouseover="funcmove('item2')" onmouseout="funcout('item2')"><span class="smailWord">今日信息</span></td>
										<td id="item3" align="center" onmouseover="funcmove('item3')" onmouseout="funcout('item3')"><span class="smailWord">部门动态</span></td>
									</tr>
								</table>
							</div>
							<div id="tableForthLeft" style="width: 100%;height: 80%; background-color: #fff;">
								<table class="tableWH">
									<tr>
										<td style="width:70%">· <a id="a0" class="aa" href="" target="new_window"><span class="dataStyle" id="data0"></span></a></td>
										<td align="right"><span class="dataStyle" id="time0"></span></td>
									</tr>
									<tr>
										<td>· <a id="a1" class="aa" href="" target="new_window"><span class="dataStyle" id="data1"></span></a></td>
										<td align="right"><span class="dataStyle" id="time1"></span></td>
									</tr>
									<tr>
										<td>· <a id="a2" class="aa" href="" target="new_window"><span class="dataStyle" id="data2"></span></a></td>
										<td align="right"><span class="dataStyle" id="time2"></span></td>
									</tr>
									<tr>
										<td>· <a id="a3" class="aa" href="" target="new_window"><span class="dataStyle" id="data3"></span></a></td>
										<td align="right"><span class="dataStyle" id="time3"></span></td>
									</tr>
									<tr>
										<td>· <a id="a4" class="aa" href="" target="new_window"><span class="dataStyle" id="data4"></span></a></td>
										<td align="right"><span class="dataStyle" id="time4"></span></td>
									</tr>
								</table>
							</div>
						</td>
						<td colspan="2">
							<div id="itemForthRight" style="width: 100%;height: 15%;border-bottom: solid 2px;">
								<table style="width: 85%; height:100%;">
									<tr>
										<td id="item4" align="center" onmouseover="Rfuncmove('item4')" onmouseout="Rfuncout('item4')"><span class="smailWord">公示公告</span></td>
										<td id="item5" align="center" onmouseover="Rfuncmove('item5')" onmouseout="Rfuncout('item5')"><span class="smailWord">国务院信息</span></td>
									</tr>
								</table>
							</div>
							<div id="tableForthRight" style="width: 100%;height: 80%; background-color: #fff;">
								<table class="tableWH">
									<tr>
										<td style="width:70%">· <a id="a5" class="aa" href="" target="new_window"><span class="dataStyle" id="data5"></span></a></td>
										<td align="right"><span class="dataStyle" id="time5"></span></td>
									</tr>
									<tr>
										<td>· <a id="a6" class="aa" href="" target="new_window"><span class="dataStyle" id="data6"></span></a></td>
										<td align="right"><span class="dataStyle" id="time6"></span></td>
									</tr>
									<tr>
										<td>· <a id="a7" class="aa" href="" target="new_window"><span class="dataStyle" id="data7"></span></a></td>
										<td align="right"><span class="dataStyle" id="time7"></span></td>
									</tr>
									<tr>
										<td>· <a id="a8" class="aa" href="" target="new_window"><span class="dataStyle" id="data8"></span></a></td>
										<td align="right"><span class="dataStyle" id="time8"></span></td>
									</tr>
									<tr>
										<td>· <a id="a9" class="aa" href="" target="new_window"><span class="dataStyle" id="data9"></span></a></td>
										<td align="right"><span class="dataStyle" id="time9"></span></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="bottomDiv">
			<table style="width: 60%; height: 100%">
				<tr>
					<td align="right"><span style="color:#fff; font-size: 12px;">友情链接：</span></td>
					<td align="center" style="width: 27%;"><div class="balaDiv"><a href="http://www.gov.cn/" class="balaaa"><img src="./resource/img/guohui.png" class="imgBottom"><span class="balaSpan">&emsp;中国政府网</span></a></div></td>
					<td align="center" style="width: 29%;"><div class="balaDiv"><a href="http://www.sd.gov.cn/" class="balaaa"><img src="./resource/img/guohui.png" class="imgBottom"><span class="balaSpan">&emsp;山东省人民政府</span></a></div></td>
					<td align="center" style="width: 27%;"><div class="balaDiv"><a href="http://www.weifang.gov.cn/" class="balaaa"><img src="./resource/img/guohui.png" class="imgBottom"><span class="balaSpan">&emsp;潍坊市人民政府</span></a></div></td>
				</tr>
				<tr style="height:50%">
					<td align="right">
						<img src="./resource/img/jg.png" style="width: 35px;height: 35px;">
					</td>
					<td colspan="2" align="left">
						<span class="bala"><a class="balaa" href="http://sgsxfj.weifang.gov.cn/login">网上信访受理平台</a> | <a class="balaa" href="http://sgsxfj.weifang.gov.cn/login">交通安全综合服务管理平台 </a>|<a class="balaa" href="http://www.shouguang.gov.cn/map/"> 站点地图</a> | <a class="balaa" href="http://en.shouguang.gov.cn/">ENGLISH</a></span>&emsp; 
						<span class="bala">中共寿光市委 寿光市人民政府主办 Tel：1234-12345678 鲁ICP备00000000号 网站标识码：1234567890 </span><br/>
						<span class="bala">技术支持：XXX有限公司。推荐使用IE8.0及以上浏览器浏览本站 </span> &emsp; 
					</td>
					<td>
						<img src="./resource/img/zc.png" style="width: 75px;height: 35px;">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>