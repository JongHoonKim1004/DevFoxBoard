<%@ include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<div class="row justify-content-md-center">
			<div class="col-md-6 col-md-offset-6">
				<form action="/users/register" method="post" name="frm" id="registerForm">
					<sec:csrfInput/>
					<h3>新規登録ページ</h3>
					<div class="form-group mb-3 mt-5">
						<label for="username">ID</label>
						<input type="text" name="username" id="username" class='form-control'>
						<input type="hidden" name="rename" id="rename">
					</div>
					<div class="form-group mb-3">
						<button　type="button" class="btn btn-sm btn-primary" onclick="openIdCheck()">IDチェック</button>
					</div>
					<div class="form-group mb-3 pt-3">
						<label for="nickname">ニックネーム</label>
						<input type="text" name="nickname" id="nickname" class="form-control">
					</div>
					<div class="form-group mb-3">
						<label for="password">パスワード</label>
						<input type="password" name="password" id="password" class="form-control">
					</div>
					<div class="form-group mb-3">
						<label for="passwordCheck">パスワードチェック</label>
						<input type="password" name="passwordCheck" id="passwordCheck" class="form-control">
					</div>
					<div class="form-group mb-3">
						<label for="email">メールアドレス</label>
						<input type="email" name="email" id="email" class="form-control">
					</div>
					<div class="form-group pt-3 row">
						<div class="col-md-6 px-1">
							<button type="reset" class="btn btn-warning" style="float: right; ">書き直す</button>
						</div>
						<div class="col-md-6 px-1">
							<button type="submit" class="btn btn-primary" style="float: list;" onclick="return registerCheck()">登録する</button>
						</div>
					</div>
				</form>
			</div>	
		</div>
		
	</div>
	<script>
		//　‘IDチェック’ボタンを押したら新しいページを見せます。
		function openIdCheck(){
			if(document.frm.username.value.trim() == ""){
				alert("IDを入力してください。");
				frm.username.focus();
				return false;
			}
				
			var id = document.getElementById("username").value;
			window.open('/users/idCheck?username=' + id,'_blank','width=600, height=400, resize=no')
		}
	
		//　新規登録する前に情報を確認します。
		function registerCheck(){
			if(document.frm.username.value.trim() == ""){
				alert("IDを入力してください。");
				frm.username.focus();
				return false;
			}
			if(document.frm.nickname.value.trim() == ""){
				alert("ニックネームを書いてください。");
				frm.nickname.focus();
				return false;
			}
			if(document.frm.password.value.trim() == ""){
				alert("パスワードを書いてください。");
				frm.password.focus();
				return false;
			}
			if(document.frm.passwordCheck.value.trim() == ""){
				alert("パスワードチェックを書いてください。");
				frm.passwordCheck.focus();
				return false;
			}
			if(document.frm.password.value.length <= 4){
				alert("パスワードは5文字以上書いてください。");
				frm.password.focus();
				return false;
			}
			if(document.frm.password.value != document.frm.passwordCheck.value){
				alert("パスワードが違います。");
				frm.password.focus();
				return false;
			}
			if(document.frm.email.value.trim() == ""){
				alert("メールアドレスを書いてください。");
				frm.email.focus();
				return false;
			}
			
			
			
			
			return true;
		}
	</script>
</body>
</html>