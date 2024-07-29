<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="row justify-content-md-center">
	<div class="col-md-6 p-5 bg-light">
		<h3>パスワードを再設定します。</h3>
		<div class="m-3"></div>
		<p>新しいパスワードを入力してください。</p>
		<form action="/users/pwChange" method="post" name="frm" onsubmit="return submitCheck()">
			<sec:csrfInput/>
			<div class="form-group">
				<label for="password">パスワード</label>
				<input type="password" name="password" id="password" class="form-control">
			</div>
			<div class="form-group">
				<label for="passwordCheck">パスワードチェック</label>
				<input type="password" name="passwordCheck" id="passwordCheck" class="form-control">
			</div>
			<div class="form-group">
				<input type="hidden" name="uno" value="${user.uno }">
				<input type="submit" class="btn btn-primary" value="パスワードを再設定する" style="float: right;">
			</div>
		</form>	
	</div>
</div>
<script>
	// パスワードを確認します
	function submitCheck(){
		if(document.frm.password.value.trim() == ""){
			alert("パスワードを入力してください。");
			return false;
		}
		if(document.frm.passwordCheck.value.trim() == ""){
			alert("パスワードチェックを入力してください。");
			return false;
		}
		if(document.frm.password.value.length <= 4){
			alert("パスワードは5文字以上入力してください。");
			return false;
		}
		if(document.frm.password.value != document.frm.passwordCheck.value){
			alert("パスワードが一致しません。");
			return false;
		}
		
		return true;
	}
	
</script>
<%@ include file="../includes/footer.jsp" %>