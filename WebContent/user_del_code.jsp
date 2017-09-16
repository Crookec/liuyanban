<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="db.zafu.*"%>

<%
String uphone=request.getParameter("uphone");
String fflag=request.getParameter("flag");
int flag=Integer.parseInt(fflag);
DBOperation db=new DBOperation();
db.updateuser(uphone, flag);
%>