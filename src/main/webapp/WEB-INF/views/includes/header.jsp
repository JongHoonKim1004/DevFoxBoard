<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.0.min.js"></script>
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
		<nav class="navbar navbar-expand-sm bg-light">
			<div class="col-md-6">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/board/list">NOTICE</a></li>
					<li class="nav-item"><a class="nav-link">イベント</a></li>
					<li class="nav-item"><a class="nav-link">Q&A</a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<p style="text-align: right; margin: 0;">${user.nickname } 様、いらっしゃいませ。</p>
			</div>
		</nav>
		<div class="blank"></div>