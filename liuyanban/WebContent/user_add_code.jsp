<%@page import="test.test"%>
<%@page import="java.util.*"%>
<%@page import="db.zafu.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    ArrayList<userInfo> data=new ArrayList<userInfo>();
    ArrayList<userInfo> data1=new ArrayList<userInfo>();
	DBOperation db=new DBOperation();
    db.readuser(data);
    //String uname = new String(request.getParameter("uname").getBytes("iso-8859-1"), "utf-8");  
    //String upswd = new String(request.getParameter("upswd").getBytes("iso-8859-1"), "utf-8");
    //String uphone = new String(request.getParameter("uphone").getBytes("iso-8859-1"), "utf-8");
    String uphone=request.getParameter("uphone");
    String uname=request.getParameter("uname");
    String upswd=request.getParameter("upswd");
    int flag1=0,flag2=0,flag=0;
    Iterator<userInfo> iter=data.iterator();
    while(iter.hasNext()){
    	userInfo info=new userInfo();
    	info=iter.next();
    	if(uphone.equals(info.get_uphone())){
    		flag1=1;
    		break;
    	}
    	if(uname.equals(info.get_uname()))
    		flag2=1;
    }
    if(flag1==1){
    	System.out.println("0");
		response.setContentType("text/xml; charset=UTF-8");  
		response.setHeader("Cache-Control","no-cache"); 
		out.println("<result>");
		out.println( "<uphonerepeat>true</uphonerepeat>" );
		out.println("</result>");
    }
    else if(flag2==1){
		response.setContentType("text/xml; charset=UTF-8");  
		    response.setHeader("Cache-Control","no-cache"); 
		out.println("<result>");
		out.println( "<uphonerepeat>false</uphonerepeat>" );
		out.println( "<unamerepeat>true</unamerepeat>" );
		out.println("</result>");
    }
    else{
    	db.adduser(uname,uphone, upswd);
    	db.readuser(data1);
    	Iterator<userInfo> it=data1.iterator();
    	while(it.hasNext()){
    		userInfo info=new userInfo();
    		info=it.next();
    		if(uphone.equals(info.get_uphone())){
    			flag=1;
        		response.setContentType("text/xml; charset=UTF-8");  
       		    response.setHeader("Cache-Control","no-cache"); 
        		out.println("<result>");
        		out.println( "<unamerepeat>false</unamerepeat>" );
        		out.println("<uphonerepeat>false</uphonerepeat>");
        		out.println("<addresult>true</addresult>");
        		out.println("</result>");
        		break;
        		}
    		}
    	
    	if(flag==0){
    		response.setContentType("text/xml; charset=UTF-8");  
   		    response.setHeader("Cache-Control","no-cache"); 
    		out.println("<result>");
    		out.println( "<unamerepeat>false</unamerepeat>" );
    		out.println("<uphonerepeat>false</uphonerepeat>");
    		out.println("<addresult>false</addresult>");
    		out.println("</result>");
    	}
    }
%>