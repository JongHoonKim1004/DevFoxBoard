<%@ include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
		<div class="row justify-content-md-center">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">ログイン</h3>
					</div>
					<div class="panel-body">
						<form action="/login" method="post" name="frm">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="ID" name="username"
										type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="パスワード" name="password"
										type="password" value="">
								</div>

								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" value="ログイン"
									class="btn btn-lg btn-success btn-block"
									onclick="return loginCheck()"> <input type="hidden"
									name="${_csrf.parameterName }" value="${_csrf.token }">
								
							</fieldset>
						</form>
						<div class="row" style="text-align: center; margin-top:30px;">
							<div class="col-md-6">
								<a href="/users/idFind">IDを探す</a>
							</div>
							<div class="col-md-6">
								<a href="/users/passwordFind">パスワードを探す</a>
							</div>
						</div>
						<div class="login-message">${error } ${logout }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <script>
    	// IDとパスワードの入力を確認します。
   		function loginCheck(){
   			if(document.frm.username.value.trim() == ""){
   				alert("IDを入力してください。");
   				return false;
   			}
   			if(document.frm.password.value.trim() == ""){
   				alert("パスワードを入力してください。");
   				return false;
   			}
   			
   			return true;
   		}
   		
    	//　新規登録の後メッセージを見せます。
   		const message = `${message}`;
   		if(message != ``){
   			alert(message);
   		}
    </script>
</body>
</html>