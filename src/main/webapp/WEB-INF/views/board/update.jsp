<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-md-12">
		<button class="btn btn-primary" style="float: right"
			onclick="location.href='/board/create'">新しい書き込みを作成する</button>
	</div>
</div>
<div class="blank"></div>
<div class="row">
	<div class="col-md-12">
		<form action="/board/update" name="frm" method="post">
			<div class="form-group">
				<label for="bno">書き込み番号</label> <input type="text" name="bno"
					id="bno" class="form-control" readonly value="${board.bno }">
			</div>
			<div class="form-group">
				<label for="title">タイトル</label> <input type="text" name="title"
					id="title" class="form-control" value="${board.title }">
			</div>
			<div class="form-group">
				<label for="writer">作成者</label> <input type="text" name="writer"
					id="writer" class="form-control" readonly value="${board.writer }">
			</div>
			<div class="form-group">
				<label for="content">本文</label>
				<textarea cols="10" rows="3" name="content" class="form-control">${board.content }</textarea>
			</div>
			<div class="blank"></div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" value="修正"
					style="float: right;" onclick="return formCheck()">
			</div>
		</form>
	</div>
</div>
</div>
<script>
function formCheck(){
	if(document.frm.title.value.trim() == ""){
		alert("タイトルを作成してください。");
		return false;
	}
	if(document.frm.writer.value.trim() == ""){
		alert("作成者を作成してください。");
		return false;
	}
	if(document.frm.content.value.trim() == ""){
		alert("本文を作成してください。");
		return false;
	}
	
	return true;
} 
</script>
</body>
</html>