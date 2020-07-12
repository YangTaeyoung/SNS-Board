<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	</head>
	
		<style>
			*{
				padding: 0;
				margin: 0;
			}
			/* 상단바 메뉴 스타일 */
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
			
			#joinText
			{
				color: white
			}
			/*상단바 메뉴 스타일 끝 */
			
			/* 회원가입 폼 스타일*/
			.join
			{
				min-width: 800px;
			}
			.form-group
			{
				margin-bottom: 20px;
			}
			.form
			{
				margin-top: 40px;
				padding-left:300px;
				padding-right:300px;
			}
			.form-title
			{
				font-weight: bold;
			}
			.star
			{
				color:red;
			}
			
			.card-title
			{
				text-align: center;
				font-weight: bold;
			}
			.card-body
			{
				padding-left:100px;
				padding-right:100px;
			}
		</style>
		<script>
			function idChk()
			{
				window.open("idChk.jsp", "address", "width=300, height=200, toolbar=no");
			}
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

		<form class="form" action="joinChk.jsp" method="post" enctype="multipart/form-data">
			<div class="card mx-auto join">
				<div class="card-header">
					<h5 class="card-title">회원가입</h5>
				</div>
				<div class="card-body">
					<div class="form-group">
			    		<label class="form-title">아이디<span class="star">*</span></label>
			   			<input type="text" name="id" class="form-control" >
			  		</div>
			  		<div class="form-group">
						<label class="form-title">비밀번호<span class="star">*</span> </label>
						<input type="password" name="pw" class="form-control">
					</div>
					<div class="form-group">
						<label class="form-title">비밀번호 확인<span class="star">*</span></label>
						<input type="password" name="pwChk" class="form-control">
					</div>
					 <div class="form-group">
			    		<label class="form-title">이름<span class="star">*</span></label>
			   			<input type="text" name="name" class="form-control">		
			   		</div>
			   		<div class="form-group">
			    		<label class="form-title">프로필 사진</label>
			   			<input type="file" name="pic_name" class="form-control">
			   			<small class="form-text text-muted"> 최대 5MB까지 업로드할 수 있습니다.</small>
			  		</div>
			  		<div class="form-group">
			    		<label class="form-title">전화번호<span class="star">*</span></label>
			   			<input type="tel" name="phone" class="form-control" placeholder="-을 빼고 입력해주세요 예) 010-1234-5678 → 01012345678" >
			  		</div>
			  		<div class="form-group">
			    		<label class="form-title">생년월일<span class="star">*</span></label>
			   			<input type="date" name="birth" class="form-control">
			  		</div>
			  		
			  		<div class="form-group">
			    		<label class="form-title">주소</label>
			   			<input type="text" name="addr" class="form-control">
			  		</div>
			  		<div style="text-align: center">
						<input type="submit" class="btn btn-primary" value ="회원가입">
					</div>
				</div>
			</div>
		</form>
	</body>
</html>