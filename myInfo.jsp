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
			.card-title
			{
				text-align: center;
				font-weight: bold;
			}
			.info
			{
				width:50%;
				margin-top: 20px;
			}
			
			/* 메뉴 바 관련 */
			.nav
			{
				display: flex;
			}
			
			.menuBar
			{
				position: fixed;
				right: 30px;
				width: 20%;
			}
			
			.search
			{
				top: 66px;
	   	 		height: 112px;
			}
			
			.navigation
			{
				top: 186px;
				height: 180px;
			}
			
			.myInfo
			{
				top: 374px;
				height: auto;
			}
			.searchForm
			{
				padding: 10px;
				display: flex;
			}
			.infoLink 
			{
			    position: relative;
			    display: block;
			    padding: 0.00rem 0.50rem;
		    }
			.infoLink a
			{
			    color: black;
	  		 	font-size: 16px;
	
			}
			.infoLink a:hover
			{
				color: red;
				text-decoration: none;
			}
		</style>
		<script>
		</script>
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


<!-- 게시글 검색 영역 -->
		<div class="card menuBar search">
			<div class="card-header">
				<h5 class="card-title">게시글 검색</h5>
			</div>
			<form class="searchForm"action="searchPost.jsp">
				<input type="text" class="form-control" placeholder="검색할 단어를 입력하세요" name="key">
				<input type="submit" class="btn btn-outline-secondary" value="검색">
			</form>
		</div>
<!-- 게시글 검색 영역 종료 -->

<!-- 네비게이션 영역 -->
<% 
	if (session.getAttribute("ID") == null){} // 네비게이션과 내 정보는 개인과 관련이 있는 메뉴이므로 로그인 되어 있지 않으면 확인할 수 없다.
	else
	{
%>
		<div class="card menuBar navigation">
			<div class="card-header">
				<h5 class="card-title">네비게이션</h5>
			</div>
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item infoLink"><a href="writeBoard.jsp">게시글 등록</a></li>
					<li class="list-group-item infoLink"><a href="myInfo.jsp">내 정보 확인</a></li>
					<li class="list-group-item infoLink"><a href="searchPost.jsp?key=<%=session.getAttribute("ID")%>">내가 쓴 게시글</a></li>
				</ul>
			</div>
		</div>
<!-- 네비게이션 영역 종료 -->

<!-- 내 정보(네비게이션) 영역 -->		
		<div class="card menuBar myInfo">
			<div class="card-header">
				<h5 class="card-title"><a href="myInfo.jsp" style="color:black">내 정보</a></h5>
			</div>
			<img src="./upload/<%=user.getPic_name()%>" alt="등록된 프로필 사진이 없습니다." width="100" height="100 ">
			<p>이름: <%=user.getName()%></p>
			<p>전화번호: <%=user.getPhone()%></p>
			<p>생년월일: <%=user.getBirth() %></p>
			<button class="btn btn-secondary" onclick="location.href='updateInfo.jsp'">내 정보 수정</button>
		</div>
		
<%
	}
%>
<!-- 내 정보 영역(네비게이션) 종료 -->

<!-- 내 정보 영역 -->
		<div class="card mx-auto info">
			<div class="card-header">
				<h5 class="card-title">내 정보</h5>
			</div>
			<div class="card-body" style="display:flex;" >

				<div class="card">
					<div class="card-header">
						<h5 class="card-title">프로필 사진</h5>
					</div>
					<div class="card-body">
<%
	if(user.getPic_name() != null)
	{
%>
						<img src="./upload/<%=user.getPic_name()%>" alt="본 브라우저는 본 형식의 사진을 지원하지 않습니다." width="200" height="200"><br/>
<%
	}
%>
					</div>
				</div>	

				<ul class="list-group list-group-flush">
					<li class="list-group-item"><b>아이디</b> <%=user.getId()%></li>
					<li class="list-group-item"><b>이름</b> <%=user.getName()%></li>
					<li class="list-group-item"><b>생일</b> <%=user.getBirth()%></li>
					<li class="list-group-item"><b>전화번호</b> <%=user.getPhone() %></li>
					<li class="list-group-item"><b>주소</b> <%=user.getAddr()%></li>
					<li class="list-group-item"><button class="btn btn-secondary" onclick="location.href='updateInfo.jsp'">내 정보 수정</button></li>
					
				</ul>
			</div>
		</div>
<%
	ud.close();
%>
	</body>
</html>