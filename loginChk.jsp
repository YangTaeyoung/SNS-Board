<%@page import="beans.User_DB"%>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Cookie cookieId = new Cookie("id",id);
	Cookie cookiePw = new Cookie("pw",pw);
	response.addCookie(cookieId);
	response.addCookie(cookiePw);
	int flag = 0;
	if(request.getParameter("flag")!= null)
		flag = Integer.parseInt(request.getParameter("flag"));
	else
		flag = 1;
	Cookie cookieFlag = new Cookie("flag", flag+""); // 쿠키 저장. 얘는 절대 null이 저장되면 안된당.
	response.addCookie(cookieFlag);
	
	User_DB ud = new User_DB();
	
	User chkUser = ud.getRecord(request.getParameter("id"));
	ud.close();
	if ( chkUser != null)
	{
		if(pw.equals(chkUser.getPw()))
		{
			session.setAttribute("ID", chkUser.getId());
			session.setAttribute("USER_NO", chkUser.getUser_no());
%>
			<script>
				alert("로그인에 성공하셨습니다.");
				location.href = "main.jsp";
			</script>			
<%
		}
		else
		{
%>
			<script>
				alert("아이디 혹은 비밀번호가 틀렸습니다.");
				location.href ="login.jsp";	
			</script>
<%		
		}
	}
	else
	{
%>
		<script>
			alert("아이디 혹은 비밀번호가  틀렸습니다.");
			location.href ="login.jsp";	
		</script>
<%				
	}
%>
