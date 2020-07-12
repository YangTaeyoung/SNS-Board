<%@page import="java.io.File"%>
<%@page import="beans.AddedFile"%>
<%@page import="beans.AddedFile_DB"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="beans.Board_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	int maxsize = 1024*1024*5;
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxsize,"utf-8", new DefaultFileRenamePolicy());

	int idx = Integer.parseInt(multi.getParameter("idx"));
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	
	Board_DB bd = new Board_DB();
	AddedFile_DB ad = new AddedFile_DB();
	bd.updateRecord(idx, title, content);
	
	AddedFile[] af = ad.getRecords(idx);
	
	
	if(af != null)
	{
		File[] oldFile = new File[af.length];
		
		for(int i = 0; i < oldFile.length; i++)
		{
			oldFile[i] = new File(realFolder + "//" + af[i].getFile_name());
			oldFile[i].delete();
		}
		ad.deleteRecords(idx);
	}
	
	
	int count= 0;
	for(int i = 0; multi.getFilesystemName("file_name"+i) != null; i++)
	{
		count++;
	}
	
	AddedFile[] afArr = new AddedFile[count];
	for(int i = 0; i < count; i++)
	{
		af[i] = new AddedFile();
		af[i].setPost_no(idx);
		af[i].setFile_name(multi.getFilesystemName("file_name"+i));
		ad.insertRecord(af[i]);
	}
	ad.close();
	
	response.sendRedirect("main.jsp");
%>
