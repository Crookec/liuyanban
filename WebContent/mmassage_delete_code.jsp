<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="db.zafu.*"%>

<%
String ppid=request.getParameter("pid");
int pid=Integer.parseInt(ppid);
DBOperation db=new DBOperation();
db.deletepassage(pid);
db.deletereplybyid(pid);
%>