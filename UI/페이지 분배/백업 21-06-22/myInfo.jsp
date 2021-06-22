<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="myinfo_top">
				<div class="profile">
					<form id="form" runat="server">
						<img id="image_section" src="./assets/img/profile/default.png"
							alt="your image" />
					</form>
				</div>
				<input type='file' id="imgInput" accept="image/*"
					label="프로필 사진 변경하기" />
			</div>
			<div class="myinfo_bottom">
				<div class="myinfo_left">
					<div class="nickname">
						<h4 class="con_title">닉네임</h4>
						<h4 class="con_nick">insert here</h4>
					</div>
					<div class="trust">
						<h4 class="con_title">신뢰도</h4>
						<div class='RatingStar'>
							<div class='RatingScore'>
								<div class='outer-star'>
									<div class='inner-star' name="RatingScore" value="5"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="email">
						<h4 class="con_title">이메일</h4>
						<h4 class="con_email">insert here</h4>
					</div>
				</div>
				<div class="myinfo_right">
					<div class="pw_con">
						<div class="pw">
							<h4 class="con_title2">현재 비밀번호</h4>
							<input type="password" class="pw_size" />
						</div>
						<div class="pw">
							<h4 class="con_title2">새 비밀번호</h4>
							<input type="password" />
						</div>
						<div class="pw">
							<h4 class="con_title2">비밀번호 확인</h4>
							<input type="password" />
						</div>
						<div class="pwchange_leave">
							<button type="button" class="btn btn-success">비밀번호 변경</button>
							<button type="button" class="btn btn-danger">탈퇴하기</button>
						</div>

					</div>
				</div>
			</div>
</body>
</html>