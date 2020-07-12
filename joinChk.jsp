<%@page import="java.sql.SQLException"%>
<%@page import="beans.User"%>
<%@page import="java.util.Date"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="beans.User_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	int maxsize = 1024*1024*5;
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,"utf-8", new DefaultFileRenamePolicy());
	if(multi.getParameter("pw").equals(multi.getParameter("pwChk")))
	{
		User user = new User();
		user.setName(multi.getParameter("name"));
		user.setId(multi.getParameter("id"));
		user.setPw(multi.getParameter("pw"));
		user.setPhone(multi.getParameter("phone"));
		user.setBirth(multi.getParameter("birth"));
		user.setAddr(multi.getParameter("addr"));
		user.setPic_name(multi.getFilesystemName("pic_name"));
		User_DB ud = new User_DB();
		try
		{
		ud.insertRecord(user);
%>
			<script>
				alert("말랑말랑북에 오신 것을 환영합니다. \n회원가입이 완료되었습니다.");
				location.href = "main.jsp";
			</script>
<%
		}catch(SQLException e)
		{
%>
			<script>
				alert("아이디가 중복되거나 필수 항목을 기입하지 않았습니다. 다시 입력해주세요");
				location.href ="join.jsp";
			</script>
<%
		}
%>		
		
<%
	}
	else
	{
%>
		<script>
			alert("비밀번호가 서로 일치하지 않습니다. 다시 확인해주세요.");
			location.href ="join.jsp";
		</script>
<%
	}
%>