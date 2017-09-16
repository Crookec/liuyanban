<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="db.zafu.*"%>

<%
String rrid=request.getParameter("rid");
int rid=Integer.parseInt(rrid);
DBOperation db=new DBOperation();
db.deletereply(rid);
%>