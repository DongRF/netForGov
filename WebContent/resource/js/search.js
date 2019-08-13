function search(){
	 var sHref = window.location.href;
	    var args = sHref.split('?');
	    if(args[0] == sHref){
	        return "";
	    }
	    var arr = args[1].split('&');
	    var obj = {};
	    for(var i = 0;i< arr.length;i++){
	        var arg = arr[i].split('=');
	        obj[arg[0]] = arg[1];
	    }
	    var searchWord = obj['search'];
	    
	    searchFromDB(searchWord);
}

function searchFromDB(searchWord){
	$.ajax({
		type: "GET",
		async: false,
		url: "../servlet/IndexServlet?searchWord="+searchWord,
        //dataType: "json",  //返回的信息格式
        success: function(data, textStatus, jqXHR){
        	var result = JSON.parse(data); //由JSON字符串转换为JSON对象
        	wirteWord(result);
        }
	});
}

function wirteWord(result){
	var tableStr = "<table style='width:100%;border-right:1px solid #000;border-bottom:1px solid #000'>";
	var temp = "";
	
	if(result.length===0){
		tableStr = "未查询到与该关键字相关的内容！";
	}
	else{
		for(var i=0;i<result.length;i++){
			temp =  "<tr>" +
					"<td style='width:5%;height:30px;border-left:1px solid #000;border-top:1px solid #000'>"+ (i+1) +"</td>" +
					"<td style='width:80%;height:30px;border-left:1px solid #000;border-top:1px solid #000'><a href='"+result[i].url+"'>"+ result[i].topic +"</a></td>"+
					"<td style='width:15%;height:30px;border-left:1px solid #000;border-top:1px solid #000'>"+ result[i].savedate +"</td>"+
					"</tr>";
			tableStr = tableStr + temp;
		}
	}
	
	tableStr += "</table>";
	
	console.log(tableStr);
	
	document.getElementById("mianSearchDiv").innerHTML = tableStr;

}

function searchjumpPage(pageId){   //页面跳转
	window.open(pageId+"Page.jsp");
}