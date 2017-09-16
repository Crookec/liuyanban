<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" />
<style type="text/css">
div{
padding:5px;
margin:5px;
}
#Tou{width:1320px;height:120px;margin: 0 auto;}
#All{
width:500px;
height:300px;
margin: 0 auto;
background-color:white;}
#hx{float:left;}
#BT{float:left;}
#use{width:480px;float:left;}
</style>
</head>
<body background="img/back_2.jpg" >
<form name="addform">
<div id="Tou"></div>
<div id="All">
<div id="BT" ><span style="font-weight:bold;font-size:22px;" > |用户注册|</span></div>

<div id="hx">——————————————————————————————</div>


<div id="use">
&nbsp;&nbsp;&nbsp;用户名：<input type="text" style="height:15px" name="uname"><br><br>
&nbsp;&nbsp;&nbsp;手机号码：<input type="text" style="height:15px" name="uphone"><br><br>
&nbsp;&nbsp;&nbsp;登录密码：<input type="text" style="height:15px" name="upswd"><br><br>
&nbsp;&nbsp;&nbsp;确认密码：<input type="text" style="height:15px" name="rupswd"><br><br>

&nbsp;&nbsp;&nbsp;
<button type="button" style="height:30px;background-color:#008080;" onClick="ZHUCE()">
<span style="font-weight:bold;color:white;font-size:14px;"> 注  册</span> 
</button>&nbsp;&nbsp;
<button type="button" style="height:30px;background-color:#008080;" onClick="LAND()">
<span style="font-weight:bold;color:white;font-size:14px;"> 返回登录界面</span> 
</button>
</div><!-- use -->


</div><!-- All -->
</form>
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

function ZHUCE(){
	alert("注册");
	var uname=document.addform.uname.value;
	var uphone=document.addform.uphone.value;
	var upswd=document.addform.upswd.value;
	var rupswd=document.addform.rupswd.value;
	if(uname==''){
		alert("用户名不能为空");
		document.addform.uname.focus();
		return false;
	}
	if(uphone==''){
		alert("手机号不能为空");
		document.addform.uphone.focus();
		return false;
	}
	if(uphone.length!=11){
		alert("请输入正确的手机号");
		document.addform.uname.value="";
		document.addform.upswd.value="";
		document.addform.rupswd.value="";
		document.addform.uphone.focus();
		return false;
	}
	if(upswd==''){
		alert("密码不能为空");
		document.addform.upswd.value="";
		document.addform.rupswd.value="";
		document.addform.upswd.focus();
		return false;
	}
	if(upswd.length!=6){
		alert("密码必须为六位数");
		document.addform.upswd.value="";
		document.addform.rupswd.value="";
		document.addform.upswd.focus();
		return false;
	}
	if(rupswd==''){
		alert("请再次输入密码确认");
		document.addform.rupswd.focus();
		return false;
	}
	if(upswd!=rupswd){
		alert("两次密码输入不同,请重新输入");
		document.addform.rupswd.value="";
		document.addform.upswd.value="";
		document.addform.rupswd.foucus();
		return false;
	}
	 loadXMLDoc("user_add_code.jsp?uphone=" + uphone +"&uname="+uname
				+ "&upswd="+upswd+"&timestamp="+ new Date().getTime(), proc_add );
}

function proc_add(){
	if (xmlhttp.readyState==4&&xmlhttp.status==200){
	     var uphonerepeat = xmlhttp.responseXML.getElementsByTagName(
		 "uphonerepeat")[0].firstChild.nodeValue;
		if(uphonerepeat=="true"){
			alert("每个手机号最多注册一个账号");
			document.addform.uphone.value="";
			document.addform.upswd.value="";
			document.addform.rupswd.value="";
			document.addform.uphone.foucus();
		}
		else{
		     var unamerepeat = xmlhttp.responseXML.getElementsByTagName(
			 "unamerepeat")[0].firstChild.nodeValue;
		     if(unamerepeat=="true"){
		    	 alert("该用户名已被使用");
				 document.addform.uname.value="";
				 document.addform.upswd.value="";
				 document.addform.rupswd.value="";
		    	 document.addform.uname.foucus();
		     }
		     else{
			     var addresult = xmlhttp.responseXML.getElementsByTagName(
				 "addresult")[0].firstChild.nodeValue;
			     if(addresult=="true"){
			    	 alert("注册成功");
			    	 window.location.href="Landing.jsp";
			     }
			     else{
			    	 alert("注册失败");
			     }
		     }
		}
	}
}
	
function LAND(){
	window.location.href="Landing.jsp";
}
</script>
</html>