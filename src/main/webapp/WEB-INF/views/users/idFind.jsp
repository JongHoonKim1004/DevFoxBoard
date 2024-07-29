<%@ include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<div class="row justify-content-md-center">
		<div class="col-md-6　mt-3 mb-3 bg-light p-5">
			<h3>IDを探します。</h3>	
			<div style="margin: 30px 0;"></div>		
			<p>新規登録の際に入力したメールアドレスを入力してください。</p>
			<form action="/users/idFind" method="post" name="frm">
				<sec:csrfInput/>
				<input type="email" name="email" id="email" class="form-control"/>
				<button class="btn btn-primary" type="button" style="float: right; margin-top: 1rem;" onclick="return formCheck()">IDを探す。</button>
			</form>
		</div>
		
	</div>
	<div class="row justify-content-md-center">
		<div class="col-md-6 pt-3">
			<button class='btn btn-primary' style="float: right;" onclick="location.href='/board/list'">掲示板へ</button>
		</div>
	</div>


	</div>
	<script>
		// メールアドレス欄の入力を確認します。
		function formCheck(){
			if(document.frm.email.value.trim() == ""){
				alert("メールアドレスを入力してください。");
				return false;
			}
			
			document.frm.submit();
		}
		
		// ID検索に失敗したらここでメッセージを見せます。
		const message = `${message}`;
		if(message != ``){
			alert(message);
		}
	</script>
<%@ include file="../includes/footer.jsp" %>