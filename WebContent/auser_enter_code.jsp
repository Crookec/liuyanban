<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.zafu.*"%>
<%@page import="java.util.*" %>

<%
String uid=request.getParameter("uid");
String upswd=request.getParameter("upswd");
DBOperation db=new DBOperation();
ArrayList<auserInfo> adata=new ArrayList<auserInfo>();
db.readauser(adata);
Iterator<auserInfo> aiter=adata.iterator();
int flag=0;
while(aiter.hasNext()){
	auserInfo auserinfo=aiter.next();
	if(uid.equals(auserinfo.get_uid())){
		if(upswd.equals(auserinfo.getUpswd())){
			flag=1;
		}
		else
			flag=2;
	}
}

if(flag==0){
		response.setContentType("text/xml; charset=UTF-8");  
		response.setHeader("Cache-Control","no-cache"); 
		out.println("<result>");
		out.println( "<uidrepeat>false</uidrepeat>" );
		out.println("</result>");
}
else if(flag==1){
		response.setContentType("text/xml; charset=UTF-8");  
		response.setHeader("Cache-Control","no-cache"); 
		out.println("<result>");
		out.println( "<uidrepeat>true</uidrepeat>" );
		out.println( "<upswdrepeat>true</upswdrepeat>" );
		out.println("</result>");
}
else{
		response.setContentType("text/xml; charset=UTF-8");  
		response.setHeader("Cache-Control","no-cache"); 
		out.println("<result>");
		out.println( "<uidrepeat>true</uidrepeat>" );
		out.println( "<upswdrepeat>false</upswdrepeat>" );
		out.println("</result>");
}
%>