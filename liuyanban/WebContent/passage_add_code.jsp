<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="db.zafu.*"%>

<%
String uphone=request.getParameter("uphone");
String text=request.getParameter("text");
DBOperation db=new DBOperation();
ArrayList<passageInfo> pdata=new ArrayList<passageInfo>();
db.readpassage(pdata);
Iterator<passageInfo> piter=pdata.iterator();
int pid=0;
while(piter.hasNext()){
	passageInfo passageinfo=piter.next();
	pid=passageinfo.getPid();
}
++pid;
db.addpassage(pid, uphone, text);
%>