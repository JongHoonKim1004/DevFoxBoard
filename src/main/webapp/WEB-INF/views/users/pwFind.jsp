<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="row justify-content-md-center">
		<div class="col-md-6　mt-3 bg-light p-5">
			<h3>パスワードを探します。</h3>	
			<div style="margin: 30px 0;"></div>		
			<p>新規登録の際に入力したメールアドレスとIDを入力してください。</p>
			<p>認証コードを送ります。</p>
			<form action="/users/pwFind" method="post" name="frm">
				<sec:csrfInput/>
				<div class="form-group">
					<label for="username">ID</label>
					<input type="text" name="username" id="username" class="form-control">
				</div>
				<div class="form-group">
					<label for="email">メールアドレス</label>
					<input type="email" name="email" id="email" class="form-control"/>
				</div>
				<button class="btn btn-primary" type="button" style="float: right; margin-top: 1rem;" onclick="return sendMail()">認証コードを送る。</button>
			</form>
		</div>
</div>


<div id="codeDiv" class="row justify-content-md-center">
	<div class="col-md-6 p-5 bg-light mb-3">
		<div class="form-group">
			<label for="code">認証コード</label>
			<input type="text" name="code" id="code" class="form-control">
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-primary" id="checkCodeBtn" style="float: right;" onclick="return codeCheck()">認証コードを確認する。</button>
			<form action="/users/pwFind" method="post" name="unofrm">
				<sec:csrfInput/>
				<button type="button" class="btn btn-primary" id="resetPwd" style="float: right;" onclick="return frmCheck()">パスワード再設定</button>
				<input type="hidden" name="uno" id="uno">
			</form>
		</div>
	</div>
</div>

</div>
<script>
	// 初期設定
	$("#codeDiv").hide();	
	$("#resetPwd").hide();
	
	// AJAX　POST要請に使うCSRF TOKENを用意します。
	var csrfToken = $("meta[name='_csrf']").attr("content");
    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });
    
    
	// メールを送る過程
	function sendMail(){
		if(document.frm.username.value.trim() == ""){
			alert("IDを入力してください。");
			return false;
		}
		if(document.frm.email.value.trim() == ""){
			alert("メールアドレスを書いてください。");
			return false;
		}
		
		
		$.ajax({
			url : "/pwFind?username=" + $("#username").val() + "&email=" + $("#email").val(),
			type : "get",
			success : function(result, status, xhr){
				if(xhr.status == 204){
					alert("IDとメールアドレスが一致しません。");
					return false;
				}
				console.log(result);
				
				alert("認証コードを送りました。\n認証コードを入力してください。");
				
				$("#username").attr("readOnly", true);
				$("#email").attr("readOnly", true);
				$("#codeDiv").show();
			},
			error : function(status, xhr, error){
				console.log(error);
			}
		});
	}
	
	// 認証コードを確認する過程
	function codeCheck(){
		
		
		$.ajax({
			url : "/codeCheck?code=" + $("#code").val(),
			type : "POST",
			success : function(result, status, xhr){
				console.log(result);
				
				alert("認証コードを確認しました。\n'パスワード再設定'ボタンを押してください。");
				$("#checkCodeBtn").hide();
				$("#resetPwd").show();
				
				$("#code").attr("readOnly", true);
				
				$("#uno").val(result);
			},
			error : function(status, xhr, error){
				console.log(error);
				alert("認証コードが一致しません。");
				return false;
				
			}
		});
	}
	
	// パスワードを再設定するページへ移動します
	function frmCheck(){
		if(document.unofrm.uno.value == ""){
			alert("異常なアプローチです。");
			return false;
		}
		
		document.frm.submit();
	}
</script>
<%@ include file="../includes/footer.jsp" %>