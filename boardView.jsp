<%@page import="beans.AddedFile_DB"%>
<%@page import="beans.AddedFile"%>
<%@page import="beans.User"%>
<%@page import="beans.User_DB"%>
<%@page import="beans.Comment"%>
<%@page import="beans.Comment_DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.Board"%>
<%@page import="beans.Board_DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	User_DB ud = new User_DB();
	Board_DB bd = new Board_DB();
	Comment_DB cd = new Comment_DB();
	Board record = new Board();
	User user = new User();
	int idx = Integer.parseInt(request.getParameter("idx"));
	AddedFile_DB ad = new AddedFile_DB();
	AddedFile[] afArr = ad.getRecords(idx);
	record = bd.getRecord(idx);
	user = ud.getRecord(record.getId());
	Comment[] commentArr = cd.getRecords(record.getPost_no());
	bd.viewUP(record.getPost_no());
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>게시글 보기</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	
	<style>
		#more
		{
			display: none;
		}
		.board
		{
			width: 50%;
			margin-top: 20px;
			min-width: 691px;
			
		}
		th
		{
			text-align: center;
		}
		.card-title
		{
			text-align: center;
			font-weight: bold;
		}
	</style>
	
	<script>
	// 더 보기 함수
		function likeUp(post_no)
		{
			location.href="likeUp.jsp?idx="+post_no;
		}

		function readMore()
		{
			 var dots = document.getElementById("dots");
			 var moreText = document.getElementById("more");
			 var btnText = document.getElementById("btn");

			  if (dots.style.display === "none") 
			  {
			    dots.style.display = "inline";
			    btnText.innerHTML = "더 보기"; 
			    moreText.style.display = "none";
			  } 
			  else 
			  {
			    dots.style.display = "none";
			    btnText.innerHTML = "줄이기"; 
			    moreText.style.display = "inline";
			  }
		}
	// 덧글 삭제 함수: 삭제하기 전 확인하는 과정을 거침
		function deleteRecord(idx)
		{
			if(confirm("해당 덧글을 삭제하시겠습니까?"))
			{
				location.href="deleteComment.jsp?idx="+idx;	
			}
		}
	// 덧글 수정 함수: 수정 버튼을 누르면 덧글이 입력할 수 있는 창으로 바뀜. 기존에 있던 수정 버튼은 사라지고 덧글 등록 버튼이 새로 생성됨.
		function modifyRecord(idx, content)
		{
			btnObj = document.getElementById("mod"+idx);
			btnObj.style.display = "none";// 수정버튼을 가림 
			tdObj = document.getElementById("content"+idx);
			tdObj.innerHTML = "";
			formObj = document.createElement("form");
			formObj.setAttribute("action", "updateComment.jsp");
			formObj.setAttribute("methid", "post");
			
			hiddenObj = document.createElement("input");
			hiddenObj.setAttribute("type","hidden");
			hiddenObj.setAttribute("name", "comment_no");
			hiddenObj.setAttribute("value", idx);
			
			textObj = document.createElement("input");
			textObj.setAttribute("name", "content");
			textObj.setAttribute("class", "form-control");
			textObj.setAttribute("value", content);
			
			submitObj = document.createElement("input");
			submitObj.setAttribute("type", "submit");
			submitObj.setAttribute("value", "등록");
			submitObj.setAttribute("class", "btn btn-secondary");
			
			formObj.style.display = "flex";
			formObj.appendChild(hiddenObj);
			formObj.appendChild(textObj);
			formObj.appendChild(submitObj);

			tdObj.appendChild(formObj);
		}
		// 이미지를 클릭 했을 때 팝업을 띄우는 함수
		function popUpImage(fileName,idx)
		{
			imgObj = document.getElementById("picture"+idx);
			window.open("popUpImage.jsp?fileName="+fileName, "address", "width=" + imgObj.width+ ", height=" + (imgObj.height+40) + ", toolbar=no");
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

<!-- 게시글 보기 영역 -->
		<div class="card mx-auto board">
<!-- 게시글 영역 -->
			<div class ="card-header">
				<h5 class ="card-title"><b><%=record.getTitle()%></b></h5>	
			</div>
			<div class ="card-body">
				<small class="form-text text-muted">작성자: <%=record.getId()%>  작성 시간: <%=record.getPost_time()%></small>
				<small class="form-text text-muted">조회수: <%=record.getView_no()%>  추천 수: <%=record.getLike_no()%></small>
				<br/>
				<br/>
<%
	if(record.getContent().length() > 100)
	{
%>				<span><%=record.getContent().substring(0, 99)%></span>
				<span id="dots">...</span>
				<span id="more"><%=record.getContent().substring(99)%></span>
				<button id="btn" class="btn btn-outline-secondary" onclick="readMore()">더 보기</button>
<% 
	}
	else
	{
%>
				<span><%=record.getContent()%></span>
<%
	}
%>
				<div id="likeDiv" style="text-align: right">
					<button id="likeUpBtn" class="btn btn-secondary" onclick="likeUp(<%=record.getPost_no()%>)" type="button">추천</button>
				</div>
<%
	if(afArr != null)
	{
%>
				<div class="card" style="width: auto;">
					<div class="card-header">
						<h5 class="card-title">첨부파일</h5>
					</div>
					<div class="card-body">
						<div style="display:flex;">
<%
		for(int i = 0; i < afArr.length;i++)						
		{
%>
							<div class="card imgBox">
								<img id ="picture<%=afArr[i].getFile_no()%>" src="./upload/<%=afArr[i].getFile_name()%>" style="display: none;">
								<img src="./upload/<%=afArr[i].getFile_name()%>" onclick="popUpImage('<%=afArr[i].getFile_name()%>',<%=afArr[i].getFile_no()%>)" width="200" height="200">
							</div>
<%
		}
%>						</div>
					</div>
				</div>
<%
	}
%>
<!-- 게시글 영역 종료 -->

<!-- 덧글 영역 -->
				<table class="table">
  					<thead>
		    			<tr>
						    <th scope="col">작성자</th>
						    <th scope="col">덧글(<%= cd.getCount(record.getPost_no())%>)</th>
					    </tr>
					</thead>
 					<tbody>
<% 
	if(session.getAttribute("USER_NO") != null) // 로그인 한 사람만 덧글을 작성할 수 있음.
	{
%>
<!-- 덧글 작성부 -->
						<tr>
							<th scope="row"><%=session.getAttribute("ID") %></th>
							<td>
								<form action ="insertComment.jsp" method="post" style="display:flex">
									<input class="form-control" type="text" name="content">
									<input type="hidden" name="post_no" value="<%=record.getPost_no()%>">
									<input type="hidden" name="user_id" value="<%=ud.getRecord(Integer.parseInt(session.getAttribute("USER_NO")+"")).getId()%>">						
									<input class="btn btn-secondary" type="submit" value="작성">
								</form>
							</td>
						</tr>
<!-- 덧글 작성부 종료 -->
<%
	}
%>
<!-- 덧글 출력부 -->
<%
	for(int i = 0; i < commentArr.length; i++)
	{
%>

						<tr>
							<th scope="row"><%=commentArr[i].getId()%></th>
							<td id="content<%=commentArr[i].getComment_no()%>"> 
								<%=commentArr[i].getContent()%> <i><%= commentArr[i].getWriteTime()%></i>
<%
		if(commentArr[i].getId().equals(session.getAttribute("ID")))
		{
%>
								<button class="btn btn-secondary" id="mod<%=commentArr[i].getComment_no()%>" onclick="modifyRecord(<%=commentArr[i].getComment_no()%>,'<%=commentArr[i].getContent()%>')">수정</button>
								<button class="btn btn-secondary" onclick="deleteRecord(<%=commentArr[i].getComment_no()%>)">삭제</button>
<%		
		}
%>
							</td>
						</tr>

<%
	}
%>
<!--  덧글 출력부 종료 -->

<% 
	ud.close();
	cd.close();
	bd.close();
	ad.close();
%>
  					</tbody>
				</table>
			</div>
		</div>
<!-- 게시글 보기 영역 종료 -->

	</body>
</html>