<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="db.zafu.*"%>
<%
String ppid=request.getParameter("pid");
int pid=Integer.parseInt(ppid);
String uphone=request.getParameter("uphone");
String text=request.getParameter("text");
DBOperation db=new DBOperation();
ArrayList<replyInfo> rdata=new ArrayList<replyInfo>();
db.readreply(rdata);
Iterator<replyInfo> riter=rdata.iterator();
int rid=0;
while(riter.hasNext()){
	replyInfo replyinfo=riter.next();
	rid=replyinfo.get_rid();
}
++rid;
db.addreply(rid, pid, uphone, text);
%>