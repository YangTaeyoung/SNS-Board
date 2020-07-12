<%@page import="java.io.File"%>
<%@page import="beans.User"%>
<%@page import="beans.User_DB"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% 		
	User_DB ud = new User_DB();
	User record = ud.getRecord(session.getAttribute("ID")+"");
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	int maxsize = 1024*1024*5;
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,"utf-8", new DefaultFileRenamePolicy());
	
	if(multi.getParameter("addr") != null)
		record.setAddr(multi.getParameter("addr"));
	if(multi.getParameter("phone") != null)
		record.setPhone(multi.getParameter("phone"));
	
	if(record.getPic_name()!= null)
	{
		File oldFile = new File(realFolder + "//" + record.getPic_name());
		oldFile.delete();
	}
	
	if(multi.getFilesystemName("pic_name") != null)
	record.setPic_name(multi.getFilesystemName("pic_name"));
	
	ud.updateRecord(record);
	
	response.sendRedirect("myInfo.jsp");
	
	ud.close();
%>