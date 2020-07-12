<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String fileName = request.getParameter("fileName");
	
%>
<!DOCTYPE html>

<html>
	<head>
	<meta charset="UTF-8">
	<title>팝업 이미지</title>
	</head>
	<style>
		*{
			margin:0px;
			padding:0px;
		}
	</style>
	<body>
		<img src="./upload/<%=fileName%>">
	</body>
</html>