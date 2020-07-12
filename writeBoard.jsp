<%@page import="beans.Board_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>게시글 등록</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<style>
			.board
			{
				margin-top: 20px;
			}
			label
			{
				font-weight: bold;
			}
		</style>
		<script>
			var count = 1;
			function addInput()
			{
				fileGroup = document.getElementById("file-group");
				divObj = document.createElement("div");
				inputObj = document.createElement("input");
				inputObj.setAttribute("type", "file");
				inputObj.setAttribute("name", "file_name"+count);
				inputObj.setAttribute("class", "form-control");
				divObj.appendChild(inputObj);
				fileGroup.appendChild(divObj);
				
				count++;
			}
		</script>
	</head>
		
	<body>
<!-- 상단바 영역 -->
		<nav class="nav navbar navbar-dark bg-dark ">
			<div class="nav-left-items"><a class="navbar-brand" href="main.jsp" ><b>malangmalangBook</b></a></div>
			<div class="nav-right-items">
<% 	if(session.getAttribute("ID") == null) // 로그인 되어 있지 않은 상태로 메인페이지에 진입할 경우 로그인, 회원가입란이 출력되게 함.
	{
%> 
					<button class="btn btn-secondary" onclick="location.href='login.jsp'" >로그인</button>
					<button class="btn btn-outline-secondary" onclick="location.href='join.jsp'" ><span id="joinText">회원가입</span></button>
<%
	}
	else // 로그인이 되어있을 경우 로그아웃 버튼이 출력되게 한다.
	{
%> 
					<button class="btn btn-secondary" onclick="location.href='logout.jsp'">로그아웃</button>
<%}%>
			</div>
		</nav>
<!-- 상단바 영역 종료 -->

<!-- 게시글 작성 영역 -->
		<div class="card mx-auto board" style="width: 50%;">
			<div class="card-header" style="text-align: center;">
				<h5 class="card-title" style="font-weight: bold">게시글 작성</h5>
			</div>
			<div class="card-body">
				<form action="writeBoardSet.jsp" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" type="text" name="title">
					 </div>
					 <div class="form-group">
						<label>내용</label>
						<textarea class="form-control" name="content" cols="30" rows="20"></textarea>
					 </div>
					 <div id="file-group" class="form-group">
					 	<label>사진 첨부</label>
					 	<div style="display: flex;">
							<input class="form-control" type="file" name="file_name0">
							<button type="button" class="btn btn-secondary" onclick="addInput()" style="height: 38px; width: 175px;">파일 추가 첨부</button>
						</div>
					 </div>
					 <div class="form-group" style="text-align: center">
						<input class="btn btn-secondary" type="submit" value="등록">
					</div>
				</form>
			</div>
		</div>
<!-- 게시글 작성 영역 종료 -->
				
		
	</body>
</html>