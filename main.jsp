<%@page import="beans.AddedFile_DB"%>
<%@page import="beans.AddedFile"%>
<%@page import="beans.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.User_DB"%>
<%@page import="beans.Board"%>
<%@page import="beans.Board_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Board_DB bd = new Board_DB();
	Board[] boardList = bd.getAllRecords();
	User_DB ud = new User_DB();
	User user = ud.getRecord(session.getAttribute("ID")+"");
	AddedFile_DB ad = new AddedFile_DB();

%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>모두가 함께하는 공간, 말랑말랑북</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<style>
		*{
			padding: 0;
			margin: 0;
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
		.list-group-item 
		{
		    position: relative;
		    display: block;
		    padding: 0.00rem 0.50rem;
	    }
		.list-group-item a
		{
		    color: black;
  		 	font-size: 16px;

		}
		.list-group-item a:hover
		{
			color: red;
			text-decoration: none;
		}
		.searchForm
		{
			padding: 10px;
			display: flex;
		}
		/* 게시판 관련 */
		.board 
		{
   			margin: 10px;
    		width: 76%;
    		min-width: 1028px;
		}
		.card-title
		{
			font-weight: bold;
			font-size: 24px;
			text-align: center;
			margin-bottom: -0.00rem;
		}
		.card-title a
		{
			color: black;
		}
		.card-title a:hover
		{
			color: red;
			text-decoration: none;
		}
		
		#joinText
		{
			color: white
		}
		
		th
		{
			text-align: center;
		}
		td
		{
		 	text-align: center;
		}
	</style>
	<script>
		function deleteRecord(idx)
		{
			if(confirm("정말 삭제하시겠습니까?"))
			{
				location.href="deleteRecord.jsp?idx="+idx;	
			}
		}
		function popUpImage(fileName,idx)
		{
			imgObj = document.getElementById("picture"+idx);
			window.open("popUpImage.jsp?fileName="+fileName, "address", "toolbar=no");
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
					<li class="list-group-item"><a href="writeBoard.jsp">게시글 등록</a></li>
					<li class="list-group-item"><a href="myInfo.jsp">내 정보 확인</a></li>
					<li class="list-group-item"><a href="searchPost.jsp?key=<%=session.getAttribute("ID")%>">내가 쓴 게시글</a></li>
				</ul>
			</div>
		</div>
<!-- 네비게이션 영역 종료 -->

<!-- 내 정보 영역 -->		
		<div class="card menuBar myInfo">
			<div class="card-header">
				<h5 class="card-title"><a href="myInfo.jsp">내 정보</a></h5>
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
<!-- 내 정보 영역 종료 -->


<!-- 게시판 영역 -->
			<div class="board card">
				<div class="card-header">
					<h5 class="card-title">타임라인</h5>
				</div>
				<table class="table">
 					<thead class="thead-dark">
						<tr>
							<th scope="col">게시글 번호</th>
							<th scope="col">썸네일</th>
							<th scope="col">게시글 제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일시</th>
							<th scope="col">조회 수</th>
							<th scope="col">추천 수</th>
							<th scope="col" colspan="2" style="text-align:center;">비고</th>
						</tr>
					</thead>
<%
	for(int i = 0; i < boardList.length; i++)
	{
	
%>
					<tbody>
					<tr>
						<th scope="row"><%= boardList[i].getPost_no()%></th>
						<td style="text-align: center;">
							<div style="display: flex">
<%
		for(int j = 0; j < ad.isExistFile(boardList[i].getPost_no()); j++)
		{
%>
							
								<img id="picture<%= ad.getRecords(boardList[i].getPost_no())[j].getFile_no()%>" src="./upload/<%=ad.getRecords(boardList[i].getPost_no())[j].getFile_name()%>" 
								onclick="popUpImage('<%=ad.getRecords(boardList[i].getPost_no())[j].getFile_name()%>', <%= ad.getRecords(boardList[i].getPost_no())[j].getFile_no()%>)" 
								width="100" width="100" alt="사용자의 브라우저는 본 형식의 파일을 지원하지 않습니다.">
<%
		}
%>
							</div>
						</td>
						<td><a href="boardView.jsp?idx=<%=boardList[i].getPost_no()%>"><%=boardList[i].getTitle()%></a></td>
						<td><%= boardList[i].getId()%></td>
						<td><%= boardList[i].getPost_time()%></td>
						<td><%= boardList[i].getView_no()%></td>
						<td><%= boardList[i].getLike_no()%></td>
						<td>
<%
		if(session.getAttribute("ID") != null && session.getAttribute("ID").equals(boardList[i].getId())) // 자기글이 아니면 수정이 되지 않음.
		{
%>
						<button class="btn btn-secondary" onclick="location.href='updateRecord.jsp?idx=<%=boardList[i].getPost_no()%>'" style="text-align:center;">
							수정
						</button>
<%
		}
%>
						</td>
						<td>
<%
		if(session.getAttribute("ID") != null && session.getAttribute("ID").equals(boardList[i].getId())) // 자기글이 아니면 삭제가 되지 않음
		{
%>
						<button class="btn btn-secondary" onclick="deleteRecord(<%=boardList[i].getPost_no()%>)" style="text-align:center;">
							삭제
						</button>
<%
		}
%>
						</td>
					</tr>
<%
	}
	bd.close();
	ud.close();
	ad.close();
%>
					</tbody>
				</table>
			</div>
<!-- 게시판 영역 종료 -->
	</body>
</html>