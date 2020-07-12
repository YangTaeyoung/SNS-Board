<%@page import="java.util.Date"%>
<%@page import="beans.Comment"%>
<%@page import="beans.Comment_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String user_id = request.getParameter("user_id");
	String content = request.getParameter("content");
	int post_no = Integer.parseInt(request.getParameter("post_no"));
	Comment_DB cd = new Comment_DB();
	Comment comment = new Comment();
	comment.setId(user_id);
	comment.setContent(content);
	comment.setPost_no(post_no);
	cd.insertRecord(comment);
	
	cd.close();
	response.sendRedirect("boardView.jsp?idx="+post_no);
%>