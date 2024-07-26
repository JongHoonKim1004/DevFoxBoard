<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>DEVFOX BOARD</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
ul, ol, li {
	list-style: none;
}

.blank {
	margin-bottom: 20px;
}
</style>
</head>

<body>
	<div class="container">

		<div class="row jusitify-content-sm-center">
			
			<div class="col-sm-12">
				<h3 style="text-align: center;">ID チェック結果</h3>
				<p style="text-align: center;" class="mt-3">
					<c:choose>
						<c:when test="${result == 0}">
							このIDは使用可能です。
						</c:when>
						<c:otherwise>
							このIDは使用できません。
						</c:otherwise>
					</c:choose>
				</p>
				<form method="get" action="idCheck" name="frm">
					<div class="input-group p-5">
						<input type="text" name="username" id="username" class="form-control" value="${username }">
						<div class="input-group-append">
							<button type="submit" onclick="usernameCheck()" class="btn btn-sm btn-primary">確認</button>
						</div>
					</div>
				</form>
				<div style="margin: 0 auto;">
					<c:if test="${result == 0}">
						<button type="button" onclick="idok()" class="btn btn-primary">このIDを使用する。</button>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<script>
		//　‘このIDを使用する。’　ボタンを押したらID使用の確認をした後、元のページの情報をセッティングします。
		const checkedId = `${username}`;
		function idok(){
			$("#username").val(checkedId);
			
			if(confirm("本当にこのIDにしますか。")){
				window.opener.document.getElementById("username").value = checkedId;
				window.opener.document.getElementById("rename").value = checkedId;
				window.opener.document.getElementById("username").readOnly= true;
				
				window.close();
			} else {
				return false;
			}
		}
	</script>
</body>
</html>