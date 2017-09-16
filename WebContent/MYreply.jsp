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
#third{float:left;width:60%;background-color:white;height:600px;overflow:auto; }


#table_01 tbody tr:hover{ 
background-color:#EEECEB;
} 
#table_01 th{background-color:#00FFFF;}
</style>
</head>
<body background="img/back_2.jpg">
<%
String uphone=request.getParameter("uphone");
DBOperation db=new DBOperation();
userInfo user=new userInfo();
db.readuserbyid(uphone,user);
String uname=user.get_uname();
ArrayList<replyInfo> rdata=new ArrayList<replyInfo>();
db.readreply(rdata);
Iterator<replyInfo> riter=rdata.iterator();
%>
<div id="first"></div>
<div id="second">
<table>
<tr><td height="100" width="280px"><span style="color:white;font-size:18px;font-weight:bold;"><%=uname %></span></td></tr>
<tr><td height="100" width="280px"><a href="User.jsp?uphone=<%=uphone%>">留言本</a></td></tr>
<tr><td height="100"><a href="MYmessage.jsp?uphone=<%=uphone%>">我的留言</a></td></tr>
<tr><td height="100"><span style="color:yellow;font-size:18px;font-weight:bold;"> 我的回复</span></td></tr>
<tr><td height="100"><a href="Landing.jsp?uphone=<%=uphone%>">返回登录界面</a></td></tr>
</table>

</div><!-- second -->

<div id="third">
<table id="table_01">
<%while(riter.hasNext()){
	replyInfo replyinfo=riter.next();
	if(replyinfo.get_uphone().equals(uphone))
	{
		passageInfo pinfo=new passageInfo();
		db.readpassagebyid(replyinfo.get_pid(), pinfo);
		userInfo puser=new userInfo();
		db.readuserbyid(pinfo.getUphone(), puser);
	%>
	
<tr><th width="150" height="50"><%=puser.get_uname() %></th>
<th width="700"><%=pinfo.getText() %></th>
<th width="50">操作</th></tr>

<tr>
<td> <img src="img/six.gif"  /></td>
<td><%=replyinfo.getText() %></td>
<td width="50"> <button type="button" id="<%=replyinfo.get_rid()%>" onclick="del(this)">删除</button></td>
</tr>
<%}} %>

</table>
</div><!-- third -->
</body>
<script type="text/javascript">
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

function del(a){
	var rid=a.id;
	 loadXMLDoc("reply_delete_code.jsp?rid=" +rid
				+"&timestamp="+ new Date().getTime(), proc_add );
}

function proc_add(){
	if (xmlhttp.readyState==4&&xmlhttp.status==200){
		alert("删除回复成功");
		window.location.href="MYreply.jsp?uphone="+<%=uphone%>;
	}
}
</script>
</html>