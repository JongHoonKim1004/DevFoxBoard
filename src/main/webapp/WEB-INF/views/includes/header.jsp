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
<script>

</script>
</head>

<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-light">
			<div class="col-md-6">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/board/list">NOTICE</a></li>
					<li class="nav-item"><a class="nav-link">イベント</a></li>
					<li class="nav-item"><a class="nav-link">Q&A</a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<!-- ログインしていないユーザーはこの部分が見えます -->
				<sec:authorize access="isAnonymous()">
					<button class='btn btn-sm btn-warning'
						style="float: right; margin-left: 10px;"
						onclick="location.href='/users/register'">新規登録</button>
					<form method="get" action="/login">
						<button type="submit" class="btn btn-sm btn-primary"
							style="float: right">ログイン</button>
					</form>
				</sec:authorize>
				
				<!-- ログインしたユーザーはこの部分が見えます -->
				<sec:authorize access="isAuthenticated()">
					<form method="post" action="/logout" name="logoutForm"
						id="logoutForm">
						<sec:csrfInput />
						<button class="btn btn-sm btn-danger"
							style="float: right; margin-left: 10px"
							onclick="return logoutCheck()">ログアウト</button>
					</form>
					<span
						style="float: right; margin: 0; height: 31px; line-height: 31px;">${users.nickname }
						様、いらっしゃいませ。</span>
				</sec:authorize>
			</div>
		</nav>
		<div class="blank"></div>