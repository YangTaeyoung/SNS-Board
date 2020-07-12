<%@page import="beans.Comment_DB"%>
<%@page import="java.io.File"%>
<%@page import="beans.AddedFile_DB"%>
<%@page import="beans.AddedFile"%>
<%@page import="beans.Board_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	int idx = Integer.parseInt(request.getParameter("idx"));
	Comment_DB cd = new Comment_DB();
	Board_DB bd = new Board_DB();
	AddedFile_DB ad = new AddedFile_DB();
	
	AddedFile[] af = ad.getRecords(idx);
	cd.deleteRecords(idx);
	
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
	
	bd.deleteRecord(idx);
	ad.close();
	bd.close();
	cd.close();
	response.sendRedirect("main.jsp");
%>