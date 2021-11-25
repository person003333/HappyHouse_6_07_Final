<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#loginBtn").click(function() {
					if (!$("#id").val()) {
						alert("아이디 입력!!!");
						return;
					} else if (!$("#pw").val()) {
						alert("비밀번호 입력!!!");
						return;
					} else {
						$.ajax({
							url : "/api/user/login",
							type : "POST",
							data : {
								id : $("#id").val(),
								pw : $("#pw").val(),
							},
							dataType : "text",
							success : function(response) {
								console.log(response);

								if (response == "success") {
									alert("반갑습니다");
									location.href = "/";
								} else
									alert("일치하는 회원 정보가 없습니다.");

							},
						});
					}
				});

				$("#searchloginBtn").click(function() {
					$.ajax({
						url : "/api/user/login",
						type : "POST",
						data : {
							id : $("#searchName").val(),
							pw : $("#searchEmail").val(),
						},
						dataType : "text",
						success : function(response) {
							alert("반갑습니다");
							location.href = "/";
						},
					});

				});

				$("#logout").click(function() {
					alert("로그아웃");
					$.ajax({
						url : "/api/user/logout",
						type : "get",

						success : function(response) {
							console.log(response);
							location.href = "/";
						},
					});
				});

				var idValid = false;

				$("#joinID").keyup(
						function() {
							var ckid = $("#joinID").val();
							console.log(ckid);

							$.ajax({
								url : "/api/user/idCheck",
								data : {
									'ckid' : ckid
								},
								type : 'GET',
								dataType : 'text',
								success : function(response) {
									var cnt = parseInt(response);

									if (cnt == 0) {
										console.log("사용가능")
										idValid = true;
										$("#idresult").text(
												ckid + "는 사용가능한 아이디입니다.")
												.removeClass('text-dark')
												.removeClass('text-danger')
												.addClass('text-primary');
									} else {
										console.log("사용불가");
										idValid = false;
										$("#idresult").text(
												ckid + "는 이미 사용중인 아이디입니다.")
												.removeClass('text-dark')
												.removeClass('text-primary')
												.addClass('text-danger');
									}
								}
							});

						});

				$("#joinBtn").click(function() {
					if (!idValid) {
						alert("아이디를 확인하세요!");
						return;
					}

					if (!$("#joinName").val() || !$("#joinEmail").val()) {
						alert("이름, 이메일, 휴대폰 번호를 입력해주세요!");
						return;

					}

					$.ajax({
						url : "/api/user",
						type : "POST",
						data : {
							id : $("#joinID").val(),
							pw : $("#joinPW").val(),
							name : $("#joinName").val(),
							email : $("#joinEmail").val(),
						},
						dataType : "text",
						success : function(response) {
							console.log(response);

							if (response == "success") {
								alert("가입 성공");
								location.href = "/";
							} else
								alert("가입 실패");

							location.href = "/";
						},
					});

				});

				$("#userSearchBtn").click(function() {
					if (!$("#searchName").val() || !$("#searchEmail").val()) {
						alert("정보를 입력하세요!");
						return;
					}

					$.ajax({
						url : "/api/user/searchInfo",
						type : "GET",
						data : {
							name : $("#searchName").val(),
							email : $("#searchEmail").val(),
						},
						dataType : "json",
						success : function(response) {
							$("#usersearchTitle").text("회원 정보");
							$("#userSearchBtn").css("display", "none");
							$("#searchloginBtn").css("display", "block");
							$("#searchNameLabel").text("아이디");
							$("#searchPWLabel").text("비밀번호");
							$("#searchName").val(response.id);
							$("#searchEmail").val(response.pw);
							$("#searchName").attr("readonly", true);
							$("#searchEmail").attr("readonly", true);

							console.log(response.id);
							console.log($("#searchName"));
						},
						error : function(response) {
							alert("일치하는 회원정보가 없습니다.");
						},
					});

				});

			});
</script>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg" id="mainNav">
	<div class="container px-4 px-lg-5">
		<!-- <a class="navbar-brand" href="index.jsp">Start Bootstrap</a> -->
		<a class="navbar-brand" href="/"> <img id="main-logo"
			src="/img/happyhouse_white.png" width="100px" />
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto py-4 py-lg-0" id="navbarNotLogon">
				<c:if test="${empty userInfo }">
					<li class="nav-item"><a href=""
						class="nav-link px-lg-3 py-3 py-lg-4 fs-6" data-bs-toggle="modal"
						data-bs-target="#myFadeModal">로그인</a></li>
				</c:if>
				<c:if test="${not empty userInfo }">


					<li class="nav-item"><a
						class="nav-link px-lg-3 py-3 py-lg-4 fs-6" href="userlike.html">공지사항</a></li>
					<li class="nav-item"><a
						class="nav-link px-lg-3 py-3 py-lg-4 fs-6"
						href="userlikelist.html">관심지역 둘러보기</a></li>

					<li class="nav-item"><a
						class="nav-link px-lg-3 py-3 py-lg-4 fs-6" href="/api/user/myPage">마이페이지</a></li>

					<li class="nav-item"><a
						class="nav-link px-lg-3 py-3 py-lg-4 fs-6" href="" id="logout">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<!-- 로그인 모달 -->
<div class="modal fade" id="myFadeModal">
	<!--  modal-dialog에  modal-sm붙임, 기본값 md -->
	<div class="modal-dialog modal-dialog-centered modal-size" id="mm">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">로그인</h4>
				<button class="btn-close" type="button" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form id="loginform">
					<!-- form-group : 아래 마진 부여됨 -->
					<div class="form-group d-flex flex-column align-items-center">
						<div class="mb-3">ㅤ</div>
						<input type="text"
							class="form-control form-control-lg mb-1 col-lg-6" id="id"
							placeholder="아이디" name="id" value="1111" /> <input
							type="password"
							class="form-control form-control-lg mb-4 col-lg-6" id="pw"
							placeholder="비밀번호" name="pw" value="1111" />
						<div class="btn btn-success btn-lg" id="loginBtn">SIGN IN</div>
					</div>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer d-flex justify-content-center">
				<div class="btn btn-outline-light text-dark" data-bs-toggle="modal"
					data-bs-target="#serach_user_Modal">회원정보 찾기</div>
				<div class="btn btn-outline-light text-dark" data-bs-toggle="modal"
					data-bs-target="#sign_up_Modal">회원가입</div>
				<!--onclick="location.href ='/user/register'"  -->
			</div>
		</div>
	</div>
</div>

<!--회원 가입 페이지-->
<div class="modal fade" id="sign_up_Modal" tabindex="-1"
	aria-labelledby="sign_up_Modal" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content" style="border-radius: 10px;">
			<div class="modal-header border-0">
				<button class="btn-close" type="button" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body text-center pb-5">
				<!--<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">회원 가입</h2>-->
				<article class="container">
					<div class="page-header">
						<div class="col-md-12 col-md-offset-3">
							<h3>회원가입</h3>
						</div>
					</div>
					<div class="col-md-12 col-md-offset-3">
						<form role="form">
							<div class="form-group" style="text-align: left;">
								<label for="joinID">아이디</label> <span class="text-danger small">*</span>
								<input type="text" class="form-control" id="joinID" name="id"
									placeholder="아이디를 입력해 주세요">
								<div id="idresult" class="mt-1"></div>
							</div>
							<div class="form-group" style="text-align: left;">
								<label for="joinPW">비밀번호</label> <span class="text-danger small">*</span>
								<input type="password" class="form-control" id="joinPW"
									name="pw" placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="form-group" style="text-align: left;">
								<label for="joinName">이름</label> <span class="text-danger small">*</span>
								<input type="text" class="form-control" id="joinName"
									name="name" placeholder="이름을 입력해 주세요">
							</div>

							<div class="form-group" style="text-align: left;">
								<label for="joinEmail">이메일</label> <span
									class="text-danger small">*</span> <input type="email"
									class="form-control" id="joinEmail" name="email"
									placeholder="이메일을 입력해 주세요">
							</div>

							<div class="form-group text-center">
								<button type="button" id="joinBtn" class="btn btn-primary">
									회원가입<i class="fa fa-check spaceLeft"></i>
								</button>
								<button type="reset" class="btn btn-warning">
									가입취소<i class="fa fa-times spaceLeft"></i>
								</button>
							</div>
						</form>
					</div>

				</article>

			</div>
		</div>
	</div>
</div>


<!--회원 정보 찾기 페이지-->

<div class="modal fade" id="serach_user_Modal" tabindex="-1"
	aria-labelledby="serach_password_Modal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-size">
		<div class="modal-content" style="border-radius: 10px;">
			<div class="modal-header border-0">
				<button class="btn-close" type="button" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body text-center pb-5">
				<!--<h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">회원 가입</h2>-->
				<article class="container">
					<div class="page-header">
						<div class="col-md-12 col-md-offset-3">
							<h3 id="usersearchTitle">회원정보 찾기</h3>
						</div>
					</div>
					<div class="col-md-12 col-md-offset-3">
						<form role="form">
							<div class="form-group" style="text-align: left;">
								<label for="searchName" id="searchNameLabel">이름</label> <span
									class="text-danger small">*</span> <input type="text"
									class="form-control" id="searchName" name="name"
									placeholder="이름을 입력해 주세요">
							</div>

							<div class="form-group" style="text-align: left;">
								<label for="searchEmail" id="searchPWLabel">이메일</label> <span
									class="text-danger small">*</span> <input type="email"
									class="form-control" id="searchEmail" name="email"
									placeholder="이메일을 입력해 주세요">
							</div>

							<div class="form-group text-center">
								<button type="button" id="userSearchBtn" class="btn btn-primary">
									회원정보 찾기<i class="fa fa-check spaceLeft"></i>
								</button>
								<div class="btn btn-success btn-lg" id="searchloginBtn"
									style="display: none">바로 로그인</div>
							</div>
						</form>
					</div>

				</article>

			</div>
		</div>
	</div>
</div>