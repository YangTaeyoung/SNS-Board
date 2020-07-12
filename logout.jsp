<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 

	
	session.invalidate(); // 세션 만료

	Cookie[] cookies = request.getCookies();
	String id = null;
	String pw = null;
	Cookie cookieId;
	Cookie cookiePw;
	int flag = 0;
	
	for(int i = 0; i < cookies.length; i++)
	{
		if(cookies[i].getName().equals("id"))
		{
			id = cookies[i].getValue();
			break;
		}
		
	}
	for(int i = 0; i < cookies.length; i++)
	{
		if(cookies[i].getName().equals("pw"))
		{
			pw = cookies[i].getValue();
			break;
		}
	}
	for(int i = 0; i < cookies.length; i++)
	{
		if(cookies[i].getName().equals("flag"))
		{
			flag = Integer.parseInt(cookies[i].getValue());
			break;
		}
	}
	
	for(int i = 0; i < cookies.length; i++) // 쿠키 삭제
	{
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
	
	switch(flag)
	{
	case 2:
		cookieId = new Cookie("id", id);
		response.addCookie(cookieId);
		break;
	case 3:
		cookieId = new Cookie("id", id);
		response.addCookie(cookieId);
		cookiePw = new Cookie("pw", pw);
		response.addCookie(cookiePw);
		break;
	}
	Cookie cookieFlag = new Cookie("flag",flag+"");
	response.addCookie(cookieFlag);
	
	response.sendRedirect("main.jsp");
%>
