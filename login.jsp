<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Cookie[] cookies = request.getCookies();
	String id = null;
	String pw = null;
	String flag = null;
	for(int i = 0; i < cookies.length;i++)
	{
		if(cookies[i].getName().equals("id"))
		{
			id = cookies[i].getValue();
			break;
		}
	}
	for(int i = 0 ; i < cookies.length; i++)
	{
		if(cookies[i].getName().equals("pw"))
		{
			pw = cookies[i].getValue();
			break;
		}
	}
	for(int i = 0 ; i < cookies.length; i++)
	{
		if(cookies[i].getName().equals("flag"))
		{
			flag = cookies[i].getValue();
			break;
		}
	}
	System.out.println(flag.equals("2")?"checked":"");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
	
			#joinText
			{
				color: white
			}				
			/*상단바 메뉴 스타일 끝 */
			.login
			{
				display: flex;
				padding: 100px;
			}
		
			.card
			{
				margin: 50px;
				width: 100%;
			}
			.check-group
			{
				display:flex;
				border: 1px lightgray solid;
				border-radius: 5px;
				margin-left: 20px;
			}
			.menu-check
			{
				width:20px;
				border-radius: 5px;
				background-color: gray;
				text-align: center;
			}
			.card-body
			{
				padding:30px;
			}
			.menu-text
			{
				
			}
			
		</style>
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
		<div class="login">
			<div class="imgBox">
				<img alt="현재 브라우저에서는 본 이미지 타입을 지원하지 않습니다." src="images/earth.png"/>
			</div>
			<div class="card">
				<div class="card-header" style="text-align: center;">
					<h5 class="card-title" style="font-weight: bold;">로그인</h5>
				</div>
				<div class="card-body">
					<form action="loginChk.jsp" method="post">
						<div class="form-group">
				    		<label class="form-title" style="font-weight: bold;">아이디</label>
				   			<input type="text" name="id" class="form-control" value="<%=(id!=null)?id:""%>" >
				  		</div>
				  		<div class="form-group">
				    		<label class="form-title" style="font-weight: bold;">비밀번호</label>
				   			<input type="password" name="pw" class="form-control" value="<%=(pw!=null)?pw:""%>">
				  		</div>
				  		<div class="menu">
					  		<div class="check-group">
								<div class="menu-check" style="font-weight: bold;"><input type="radio" name="flag" value="1" <%=(flag.equals("1"))?"checked='checked'":""%>></div>
								<div class="menu-text"> 저장 안함 </div>
							</div>
							<div class="check-group">
								<div class="menu-check"><input type="radio" name="flag" value="2" <%=(flag.equals("2"))?"checked='checked'":""%>></div>
								<div class="menu-text"> 아이디 저장 </div>
							</div>
							<div class="check-group">
								<div class="menu-check"><input type="radio" name="flag" value="3" <%=(flag.equals("3"))?"checked='checked'":""%>></div>
								<div class="menu-text"> 아이디 비밀번호 저장 </div>
							</div>
						</div>
						<input type="submit" class="btn btn-primary" value ="로그인">
					</form>
				</div>
			</div>
		</div>
		
	</body>
</html>