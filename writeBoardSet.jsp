<%@page import="java.util.Enumeration"%>
<%@page import="beans.AddedFile_DB"%>
<%@page import="beans.AddedFile"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="beans.User_DB"%>
<%@page import="beans.User"%>
<%@page import="beans.Board_DB"%>
<%@page import="java.util.Date"%>
<%@page import="beans.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 

	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	int maxsize = 1024*1024*5;
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,"utf-8", new DefaultFileRenamePolicy());
	
	Board record = new Board();
	
	record.setTitle(multi.getParameter("title"));
	record.setContent(multi.getParameter("content").replace("\r\n", "<br/>"));
	record.setId(new User_DB().getRecord(Integer.parseInt(session.getAttribute("USER_NO")+"")).getId());
	record.setLike_no(0);
	record.setView_no(0);
	
	

	
	Board_DB bd = new Board_DB();
	bd.insertRecord(record);
	int post_no = bd.getPostNo(record);
	bd.close();
	int count = 0;
	for(int i = 0; multi.getFilesystemName("file_name"+i) != null; i++)
	{
		count++;
	}
	
	AddedFile[] af = new AddedFile[count];
	AddedFile_DB ad = new AddedFile_DB();
	for(int i = 0; i < count; i++)
	{
		af[i] = new AddedFile();
		af[i].setPost_no(post_no);
		af[i].setFile_name(multi.getFilesystemName("file_name"+i));
		ad.insertRecord(af[i]);
	}
	ad.close();
	response.sendRedirect("main.jsp");
	
%>
