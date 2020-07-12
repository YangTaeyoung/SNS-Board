<%@page import="beans.Comment"%>
<%@page import="beans.Comment_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Comment_DB cd = new Comment_DB();
	Comment record = cd.getRecord(Integer.parseInt(request.getParameter("idx")));
	cd.deleteRecord(Integer.parseInt(request.getParameter("idx")));
	cd.close();
	response.sendRedirect("boardView.jsp?idx="+record.getPost_no());
%>