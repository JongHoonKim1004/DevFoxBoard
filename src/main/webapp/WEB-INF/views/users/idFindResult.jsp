<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="row justify-content-md-center">
	<div class="col-md-6">
		<h3>ID探しの結果です。</h3>
		<div style="margin: 30px 0;"></div>
		<input type="text" value="${user.username }" class="form-control"
			readOnly>
	</div>

</div>

<div class="m-3"></div>

<div class="row justify-content-md-center">
	<div class="col-md-4">
		<button class="btn btn-primary" style="float: right;" onclick="location.href='/login'">ログインする。</button>	
	</div>
	<div class="col-md-1">
	</div>
	<div class="col-md-4">
		<button class="btn btn-warning" onclick="location.href='/users/pwFind'">パスワードを探す。</button>
	</div>
</div>

</div>
<%@ include file="../includes/footer.jsp"%>