<%@page import="beans.User"%>
<%@page import="beans.User_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	User_DB ud = new User_DB();
	User user = ud.getRecord(session.getAttribute("ID")+"");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>내 정보</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	</head>
		<style>
			*{
				margin: 0;
				padding: 0;
			}
			.pic-box
			{
				margin-left: 5%;
				margin-right: 5%;
				width: 90%;
				padding: 10%;
				
			}
			.info
			{
				width: 50%;
				min-width: 650px;
			}
			.card-title
			{
				font-weight: bold;
			}
		</style>
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

<!-- 내 정보 수정 영역 -->
		<form action="updateInfoSet.jsp" method="post" enctype="multipart/form-data">
			<div class="card mx-auto info">
				<div class="card-header" style="text-align: center">
					<h5 class="card-title">내 정보</h5>
				</div>
				<div class="card-body" style="display:flex;" >
	
					<div class="card">
						<div class="card-header" style="text-align: center">
							<h5 class="card-title">프로필 사진</h5>
						</div>
						<div class="card-body">
<%
	if(user.getPic_name() != null)
	{
%>						
							<div class="pic-box">
								<img src="./upload/<%=user.getPic_name()%>" width="200" height="200" alt="본 브라우저는 본 형식의 사진을 지원하지 않습니다.">
							</div>
<%
	}
%>
						<input type="file" class="form-control" name="pic_name">
						</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><b>아이디</b> <%=user.getId()%></li>
						<li class="list-group-item"><b>이름</b> <%=user.getName()%></li>
						<li class="list-group-item"><b>생일</b> <%=user.getBirth()%></li>
						<li class="list-group-item"><b>전화번호</b> <input class="form-control" type="tel" name="phone" value="<%=user.getPhone()%>"></li>
						<li class="list-group-item"><b>주소</b> <input class="form-control" type="text" name="addr" value="<%=user.getAddr()%>"></li>
						<li class="list-group-item"><input class="btn btn-secondary" type="submit" value="수정된 정보 등록"></li>
					</ul>
				</div>
			</div>
		</form>
<!-- 내 정보 수정 영역 종료 -->
	</body>
</html>