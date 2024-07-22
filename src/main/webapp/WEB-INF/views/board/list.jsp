<%@include file="../includes/header.jsp"%>
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
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="width: 5%; text-align: center;">#</th>
					<th style="width: 50%; text-align: center;">タイトル</th>
					<th style="width: 20%; text-align: center;">作成者</th>
					<th style="width: 15%; text-align: center;">作成時間</th>
					<th style="width: 10%; text-align: center;">クリック数</th>
				</tr>
			</thead>
			<tbody style="text-align: center;">
				<c:forEach items="${list }" var="board">
					<tr>
						<td>${board.bno }</td>
						<td><a class="move" href="/board/${board.bno }">${board.title }</a></td>
						<td>${board.writer }</td>
						<td><fmt:formatDate value="${board.regDate }"
								pattern="YYYY-MM-dd" /></td>
						<td>${board.readCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="blank"></div>
<div class="searchDiv">
	<form method="get" action="/board/list" id="searchForm">
		<div class="row">
			<div class="col-md-2">
				<select name="type" class="custom-select" id="typeSelect">
					<option id="nullSelect" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>タイプ</option>
					<option <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : '' }"/> value="T">タイトル</option>
					<option <c:out value="${pageMaker.cri.type == 'W' ? 'selected' : '' }"/> value="W">作成者</option>
					<option <c:out value="${pageMaker.cri.type == 'TW' ? 'selected' : '' }"/> value="TW">タイトル ＋ 作成者</option>
				</select>
			</div>
			<div class="col-md-4">
				<div class="input-group mb-3">

					<input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword }">
					<div class="input-group-append">
						<button class="btn btn-success" type="submit" onclick="return searchFormCheck()">検索</button>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="size" value="${pageMaker.cri.size }">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	</form>
</div>
<div class="blank"></div>
<div class="pagDiv">
	<ul class="pagination justify-content-md-end">
		<c:if test="${pageMaker.prev }">
			<li class="page-item"><a class="page-link"
				href="${pageMaker.startPage - 1}">Previous</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li
				class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a
				class="page-link" href="${num}">${num}</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<li class="page-item"><a class="page-link"
				href="${pageMaker.endPage + 1}">Next</a></li>
		</c:if>
	</ul>
</div>
<form action="/board/list" method="get" name="pageForm" id="actionForm">
	<input type="hidden" name="size" value="${pageMaker.cri.size }">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<c:if test="${pageMaker.cri.type != null }">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</c:if>
	
</form>
</div>

<script>
	const message = `${message}`;
	if (message != ``) {
		alert(message);
	}

	function searchFormCheck(){
		if($("#nullSelect").has("selected")){
			alert("検索するタイプを選んでください。");
			return false;
		}
		if($("input[name='keyword']").val() == ""){
			alert("キーワードを入力してください。");
			return false;
		}
		
		return true;
	}
	
	$(document).ready(function() {
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log("click");
			console.log($(this).attr("href"));

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.attr("action", "/board/list");
			actionForm.submit();
		});

		$(".move").on("click", function(e) {
			e.preventDefault();

			actionForm.attr("action", $(this).attr("href"));
			actionForm.submit();
		});
		
		
	});
</script>
</body>
</html>