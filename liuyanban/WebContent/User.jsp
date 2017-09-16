<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.zafu.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" />
<style type="text/css">
a:link {color: white;text-decoration: none;font-weight:bold;}
a:visited {color: white;text-decoration: none;font-weight:bold;}
a:hover {color: yellow}
a:active {color: white}
div{
padding:5px;
margin:5px;
}
#first{float:left;width:6%;height:600px;}
#second{float:left;width:20%;background-color:#191970;height:600px;text-align: center;}
#third{float:left;width:60%;background-color:white;height:440px;overflow:auto; }
#fourth{float:left;width:60%;background-color:#191970;height:140px;}

#table_01 tbody tr:hover{ 
background-color:#EEECEB;; 
} 
</style>
</head>
<body background="img/back_2.jpg">
<%
String uphone=request.getParameter("uphone");
DBOperation db=new DBOperation();
userInfo user=new userInfo();
db.readuserbyid(uphone,user);
String uname=user.get_uname();
ArrayList<passageInfo> pdata=new ArrayList<passageInfo>();
db.readpassage(pdata);
Iterator<passageInfo> piter=pdata.iterator();
%>
<div id="first"></div>
<div id="second">
<table>
<tr><td height="100" width="280px"><span style="color:white;font-size:18px;font-weight:bold;"><%=uname %></span></td></tr>
<tr><td height="100" width="280px"><span style="color:yellow;font-size:18px;font-weight:bold;">留言本</span></td></tr>
<tr><td height="100"><a href="MYmessage.jsp?uphone=<%=uphone%>">我的留言</a></td></tr>
<tr><td height="100"><a href="MYreply.jsp?uphone=<%=uphone%>">我的回复</a></td></tr>
<tr><td height="100"><a href="Landing.jsp?uphone=<%=uphone%>">返回登录界面</a></td></tr>
</table>

</div><!-- second -->

<div id="third">
<table id="table_01">
<%while(piter.hasNext()){
	passageInfo passageinfo=piter.next();%>
<tr>
<td> <img src="img/two.gif"  /></td>
<td width="800"><%=passageinfo.getText() %></td>
<td width="50"> <button type="button" id="<%=passageinfo.getPid() %>" onclick="see(this)">查看留言</button></td>
</tr>
<%} %>

</table>
</div><!-- third -->
<div id="fourth">
<textarea style="width:800px;height:100px;" id="text"></textarea>

<button type="button" style="height:30px;background-color:black;" onClick="MESSAGE()">
<span style="font-weight:bold;color:white;font-size:14px;"> 发表留言 </span> 
</button>


</div><!-- fourth -->
</body>
<script type="text/javascript">
function see(it){
	var pid=it.id;
	window.location.href="Message.jsp?pid="+pid+"&uphone="+<%=uphone%>;
}
var  xmlhttp;
function loadXMLDoc(url,cfunc){
	  
	  if(window.XMLHttpRequest){
	 
	  xmlhttp = new XMLHttpRequest();
	  
	  }
	  else{
	     xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange = cfunc;
	  xmlhttp.open("GET",url,true);
	  xmlhttp.send(null);
}

function MESSAGE(){
	var a=document.getElementById("text");
	var text=a.value;
	var flag=<%=user.get_flag()%>;
	if(text=="")
		alert("发表留言不能为空");
	else if(flag==1)
		alert("正在禁言中");
	else
	 loadXMLDoc("passage_add_code.jsp?uphone=" +<%=uphone%> +"&text="+text
				+ "&timestamp="+ new Date().getTime(), proc_add );
}

function proc_add(){
	if (xmlhttp.readyState==4&&xmlhttp.status==200){
		alert("发表留言成功");
		window.location.href="User.jsp?uphone="+<%=uphone%>;
	}
}
</script>
</html>