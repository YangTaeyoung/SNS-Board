<%@page import="beans.Board_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
	request.setCharacterEncoding("UTF-8");
	Board_DB bd = new Board_DB();
	bd.likeDown(Integer.parseInt(request.getParameter("idx")));
	bd.close();
	response.sendRedirect("boardView.jsp?idx="+request.getParameter("idx"));
%>
