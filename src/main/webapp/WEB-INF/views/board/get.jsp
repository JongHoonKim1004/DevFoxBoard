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
		<table class="table bg-light">
			<tbody>
				<tr>
					<td style="width: 20%;">書き込み番号</td>
					<td style="width: 80%;" colspan="3">${board.bno }</td>
				</tr>
				<tr>
					<td style="width: 20%;">タイトル</td>
					<td style="width: 80%;" colspan="3">${board.title }</td>
				</tr>
				<tr>
					<td style="width: 10%;">作成者</td>
					<td style="width: 40%;">${board.writer }</td>
					<td style="width: 10%;">クリック数</td>
					<td style="width: 40%;">1</td>
				</tr>
				<tr>
					<td style="width: 10%;">作成時間</td>
					<td style="width: 40%;"><fmt:formatDate
							value="${board.regDate }" pattern="YYYY-MM-dd" /></td>
					<td style="width: 10%;">修正時間</td>
					<td style="width: 40%;"><fmt:formatDate
							value="${board.updateDate }" pattern="YYYY-MM-dd" /></td>
				</tr>
				<tr>
					<td style="width: 20%;">本文</td>
					<td style="width: 80%;" colspan="3">
						<div id="boardContent"></div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="blank">
	<form action="#" id="form" method="post">
		<input type="hidden" name="size" value="${pageMaker.cri.size }">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<c:if test="${pageMaker.cri.type != null }">
			<input type="hidden" name="type" value="${pageMaker.cri.type}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</c:if>
	</form>
</div>
<div class="row">
	<div class="col-md-12">
		<button class="btn btn-primary" style="float: right; margin: 0 10px;"
			onclick="submitForm('list')">リストへ</button>
		<button class="btn btn-danger" style="float: right; margin: 0 10px;"
			onclick="submitForm('delete')">削除</button>
		<button class="btn btn-warning" style="float: right; margin: 0 10px;"
			onclick="submitForm('update')">修正</button>
	</div>
</div>
</div>

<script>
	function submitForm(command) {
		var frm = document.getElementById("form");

		if (command == 'list') {
			frm.method = "get";
			frm.action = "/board/list"
			frm.submit();
		}
		if (command == 'delete') {
			if (confirm("本当に削除しますか。")) {
				frm.action = "/board/delete"
				frm.submit();
			} else {
				return false;
			}

		} else if (command == 'update') {
			frm.method = "get";
			frm.action = "/board/update"
			frm.submit();
		} else {
			console.log("유효하지 않은 조작입니다.");
			return false;
		}
	}

	const content = `${board.content}`;
	document.getElementById("boardContent").innerHTML = content

	const message = `${message}`;
	if (message != ``) {
		alert(message);
	}
</script>
</body>
</html>
