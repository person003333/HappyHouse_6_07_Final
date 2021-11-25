<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/include/header.html"%>

<script>
	$(function() {
		$("#editBtn").click(function() {
			$(".edditable").attr("readonly", false);
			$(".card-title").text("회원 정보 수정");

			$("#editBtn").css("display", "none");
			$("#checkBtn").css("display", "block");
		});

		$("#checkBtn").click(function() {
			$(".edditable").attr("readonly", true);
			$(".card-title").text("회원 정보 확인");
			$("#checkBtn").css("display", "none");
			$("#editBtn").css("display", "block");
			// 정보 수정 완료 후, 데이터를 저장
			alert("수정이 완료되었습니다.");
			console.log($("#updateemail").val());

			$.ajax({
				url : "/api/user/"+$("#updateid").val(),
				data : {
					pw : $("#updatepw").val(),
					name : $("#updatename").val(),
					email : $("#updateemail").val(),
				},
				type : 'put',

				success : function(response) {
					console.log("수정완료");
				}
			});
		});

		$("#deleteBtn").click(function() {
			$.ajax({
				url : "/api/user/"+$("#updateid").val(),
				type : 'delete',

				success : function(response) {
					console.log("삭제완료");
					location.href = "/";
				},
				complete : function(response) {
					console.log(response);
				}
			});
			// 회원탈퇴
		});
	});
</script>

</head>
<body>
	<!-- Navbar -->
	<%@ include file="/include/navbar.jsp"%>

	<!-- Page Header -->
	<header class="masthead"
		style="margin-bottom: 0px; background-image: url('/img/home-bg-ohter.jpg'); height: 0px; padding-top: 80px; padding-bottom: 8px;">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7"></div>
			</div>
		</div>
	</header>

	<!-- Page content-->
	<header class="py-5 bg-light  mb-4">
		<div class="container col-lg-5 col-md-7">
			<div class="card mb-4" style="margin-top: 40px">
				<div class="card-body">
					<h2 class="card-title">회원 정보 확인</h2>
					<!-- <p class="card-text"></p> -->
					<div class="form-block">
						<form class="form-horizontal">
							<div class="form-group mt-3">
								<label for="id">아이디: </label> <input readonly
									class="form-control" id="updateid" placeholder="Enter ID" name="id"
									value="${userInfo.getId() }" />
							</div>
							<div class="form-group mt-2">
								<label for="pw">비밀번호: </label> <input readonly type="text"
									class="form-control edditable" id="updatepw" name="pw"
									value="${userInfo.getPw() }" />
							</div>
							<div class="form-group mt-2">
								<label for="name">이름: </label> <input readonly type="text"
									class="form-control edditable" id="updatename" name="name"
									value="${userInfo.getName() }" />
							</div>
							<div class="form-group mt-2">
								<label for="email">이메일: </label> <input readonly type="text"
									class="form-control edditable" id="updateemail" name="email"
									value="${userInfo.getEmail() }" />
							</div>

							<div
								class="btn btn-group btn-success btn-animated mt-3 float-end"
								id="editBtn">
								<i class="bi-pencil-square"></i>수정
							</div>

							<!-- Button trigger modal -->
							<button type="button"
								class="btn btn-group btn-danger btn-animated mt-3"
								data-bs-toggle="modal" data-bs-target="#deleteCheckModal">
								<i class="bi-trash"></i>회원 탈퇴
							</button>

							<!-- Modal -->
							<div class="modal fade" id="deleteCheckModal" tabindex="-1"
								aria-labelledby="deleteModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">회원 정보 삭제</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">회원님의 모든 정보가 삭제됩니다. 진행하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">아니오.</button>
											<button type="button" class="btn btn-danger" id="deleteBtn"
												data-bs-dismiss="modal">네. 삭제합니다.</button>
										</div>
									</div>
								</div>
							</div>

							<div
								class="btn btn-group btn-success btn-animated mt-3 float-end"
								style="display: none" id="checkBtn">
								확인 <i class="bi-check"></i>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>

	<%@ include file="/include/footer.jsp"%>
</body>
</html>
