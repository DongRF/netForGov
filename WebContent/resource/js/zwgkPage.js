function funcmove1(id){   //鼠标移入
	$('#'+id).attr('class','opac0');
}

function funcout1(id){    //鼠标移出
	$('#'+id).attr('class','opac1');
}

function zwgkjumpPage(pageId){   //页面跳转
	window.open(pageId+"Page.jsp");
}