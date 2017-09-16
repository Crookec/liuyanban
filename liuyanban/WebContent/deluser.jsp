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
background-color:#EEECEB;; 
} 

</style>
</head>
<body background="img/back_2.jpg">
<div id="first"></div>
<div id="second">
<table>
<tr><td height="100" width="280px"><span style="color:white;font-size:18px;font-weight:bold;">管理员</span></td></tr>
<tr><td height="100" ><a href="Manager.jsp">发言管理</a></td></tr>
<tr><td height="100" width="280px"><span style="color:yellow;font-size:18px;font-weight:bold;">用户管理</span></td></tr>
<tr><td height="100"><a href="Landing.jsp">返回登录界面</a></td></tr>
</table>

</div><!-- second -->

<div id="third">
<table id="table_01">
<%
DBOperation db=new DBOperation();
ArrayList<userInfo> udata=new ArrayList<userInfo>();
db.readuser(udata);
Iterator<userInfo> uiter=udata.iterator();
while(uiter.hasNext()){
	userInfo userinfo=uiter.next();
%>
<tr>
<td> <img src="img/four.gif"  /></td>
<td width="800"><%=userinfo.get_uphone() %></td>
<td width="50"> <button type="button" id="<%=userinfo.get_uphone() %>" onclick="del(this,1)">禁言</button></td>
<td width="50"> <button type="button" id="<%=userinfo.get_uphone() %>" onclick="del(this,0)">解禁</button></td>
</tr>
<%} %>
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

function del(a,flag){
	var uphone=a.id;
	 loadXMLDoc("user_del_code.jsp?uphone=" +uphone+"&flag="+flag
				+"&timestamp="+ new Date().getTime(), proc_add );
}

function proc_add(){
	if (xmlhttp.readyState==4&&xmlhttp.status==200){
		alert("设置成功");
		window.location.href="deluser.jsp";
	}
}
</script>
</html>