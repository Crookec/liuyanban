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
#AJ_01{float:left;}
#AJ_02{float:left;}
#man{width:480px;float:left;}
#use{width:480px;float:left;}
</style>
</head>
<body background="img/back_2.jpg" >
<form name="enterform">
<div id="Tou"></div>
<div id="All">
<div id="AJ_01" onClick='showhidediv("man");' style="color:red"><span style="font-weight:bold;font-size:22px;" > |管理员|</span></div>
<div id="AJ_02" onClick='showhidediv("use");' style="color:black"> <span style="font-weight:bold;font-size:22px;" >  |用户|</span></div>
<div id="hx">——————————————————————————————</div>
<div id="man" style="display: ">
&nbsp;&nbsp;&nbsp;登录账号：<input type="text" style="height:15px" name="m_name"><br><br>
&nbsp;&nbsp;&nbsp;登录密码：<input type="text" style="height:15px" name="m_pass"><br><br>

&nbsp;&nbsp;&nbsp;
<button type="button" style="height:30px;background-color:#008080;" onClick="MDENGLU()">
<span style="font-weight:bold;color:white;font-size:14px;"> 登  录</span> 
</button>

</div><!-- man -->

<div id="use" style="display:none ">
&nbsp;&nbsp;&nbsp;登录账号：<input type="text" style="height:15px" name="u_name"><br><br>
&nbsp;&nbsp;&nbsp;登录密码：<input type="text" style="height:15px" name="u_pass"><br><br>

&nbsp;&nbsp;&nbsp;
<button type="button" style="height:30px;background-color:#008080;" onClick="ZHUCE()">
<span style="font-weight:bold;color:white;font-size:14px;"> 注  册</span> 
</button>&nbsp;&nbsp;
<button type="button" style="height:30px;background-color:#008080;" onClick="UDENGLU()">
<span style="font-weight:bold;color:white;font-size:14px;"> 登  录</span> 
</button>
</div><!-- use -->


</div><!-- All -->

</form>
</body>
<script type="text/javascript">
function showhidediv(id){
	var M=document.getElementById("man");
	var U=document.getElementById("use");
	var A1=document.getElementById("AJ_01");
	var A2=document.getElementById("AJ_02");
	if (id == 'man') {
	if (M.style.display=='none') {
	M.style.display='block';       A1.style.color="red";
	U.style.display='none';    A2.style.color="black";
	}
	} else {
	if (U.style.display=='none') {
	M.style.display='none';          A1.style.color="black";
	U.style.display='block';          A2.style.color="red";
	}
	} 
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

function ZHUCE(){
	window.location.href="Register.jsp";
}

function MDENGLU(){
	var uid=document.enterform.m_name.value;
	var upswd=document.enterform.m_pass.value;
	 loadXMLDoc("auser_enter_code.jsp?uid=" + uid +"&upswd="+upswd
				+"&timestamp="+ new Date().getTime(), auser_enter );
}

function auser_enter(){
	if (xmlhttp.readyState==4&&xmlhttp.status==200){
		var uidrepeat=xmlhttp.responseXML.getElementsByTagName(
		 "uidrepeat")[0].firstChild.nodeValue;
		if(uidrepeat=="false"){
			alert("非管理员账号");
			document.enterform.m_name.value="";
			document.enterform.m_pass.value="";
			}
		else{
			var upswdrepeat=xmlhttp.responseXML.getElementsByTagName(
			 "upswdrepeat")[0].firstChild.nodeValue;
			if(upswdrepeat=="false"){
				alert("密码错误");
				document.enterform.m_pass.value="";
				}
			else{
				alert("登录成功");
				window.location.href="Manager.jsp";
					}
			}
		}
}

function UDENGLU(){
	var uphone=document.enterform.u_name.value;
	var upswd=document.enterform.u_pass.value;
	 loadXMLDoc("user_enter_code.jsp?uphone=" + uphone +"&upswd="+upswd
				+"&timestamp="+ new Date().getTime(), user_enter );
}

function user_enter(){
	if (xmlhttp.readyState==4&&xmlhttp.status==200){
		var uidrepeat=xmlhttp.responseXML.getElementsByTagName(
		 "uidrepeat")[0].firstChild.nodeValue;
		if(uidrepeat=="false"){
			alert("账号不存在");
			document.enterform.u_name.value="";
			document.enterform.u_pass.value="";
			}
		else{
			var upswdrepeat=xmlhttp.responseXML.getElementsByTagName(
			 "upswdrepeat")[0].firstChild.nodeValue;
			if(upswdrepeat=="false"){
				alert("密码错误");
				document.enterform.u_pass.value="";
				}
			else{
				alert("登录成功");
				var uphone=document.enterform.u_name.value;
				window.location.href="User.jsp?uphone="+uphone;
					}
			}
		}
	
}
</script>
</html>