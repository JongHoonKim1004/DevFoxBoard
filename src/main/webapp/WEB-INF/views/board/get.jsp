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
					<td style="width: 40%;">${board.readCount }</td>
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
		<c:if test="${users.username == board.writerId }">
			<button class="btn btn-danger" style="float: right; margin: 0 10px;"
				onclick="submitForm('delete')">削除</button>
			<button class="btn btn-warning" style="float: right; margin: 0 10px;"
				onclick="submitForm('update')">修正</button>
		</c:if>
	</div>
</div>
<div class="blank"></div>
<div class="row">
	<div class="col-md-12">
		<h3>リプライ</h3>
		<div class="blank"></div>
		<div class="row">
			<div class="col-md-12 bg-light p-2">
				<h5>リプライ作成</h5>
				<form method="post" action="#" id="replyForm">
					<input type="hidden" name="bno" value="${board.bno }" id="replyBno">
					<input type="hidden" id="replyWriter" value="KJH">
					<div class="row">
						<div class="col-md-12">
							<textarea rows="3" name="reply" class="form-control" id="replyTextarea"></textarea>	
						</div>
						<div class="pt-2"></div>
						<div class="col-md-12">
							<button type="button" class="btn btn-primary" onclick="return replyCheck()">登録</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 p-2">
				<ul id="replyDiv" class="list-group">
				
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">リプライを修正します</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<input type="hidden" name="rno" id="modalRno">
        <label for="reply">変える内容を入力してください。</label>
        <textarea class="form-control" name="reply" rows="3" id="replyModifyTextarea"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-warning" id="postModifyReply" onclick="return postModifyReply()">修正</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">閉じる</button>
      </div>

    </div>
  </div>
</div>

</div>

<script>
	const username = `${users.username}`;

	// 書き込みの下にあるボタン3つに関する機能です。
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
			
			var bnoInput = document.createElement("input");
			bnoInput.type = "hidden";
			bnoInput.name = "bno";
			bnoInput.value = `${board.bno}`;
			
			frm.appendChild(bnoInput);
			
			frm.submit();
		} else {
			console.log("유효하지 않은 조작입니다.");
			return false;
		}
	}

	//　書き込みの内容を入れます。
	const content = `${board.content}`;
	document.getElementById("boardContent").innerHTML = content

	//　修正した後、メッセージを見せます。
	const message = `${message}`;
	if (message != ``) {
		alert(message);
	}
	
	//　表示される時間を指定した形式に変換します。
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
  	
	//　リプライを要請します。
	function showReply(bno){
		var div = $("#replyDiv");
		
		$.ajax({
			url : "/reply/bno/" + bno,
			type : "GET",
			success : function(result, status, xhr){
				console.log(result);
				
				var str = "";
				
				if(result == null || result.length == 0){
					div.html("");
					return;
				}
				
				for(var i = 0 ; i < result.length ; i++){
					str += "<li class='list-group-item mb-2'>";
					str += "<div class='row'>";
					str += "<div class='col-md-1'>" + result[i].rno + "</div>";
					str += "<div class='col-md-11 replyReply'>" + result[i].reply + "</div>";
					str += "</div><hr/><div class='row'>";
					str += "<div class='col-md-1'></div>";
					str += "<div class='col-md-5'>" + result[i].writer + "</div>";
					str += "<div class='col-md-1'>" + displayTime(result[i].updateDate) + "</div>";
					str += "<div class='col-md-5'><button class='btn btn-danger' onclick='deleteReply(" + result[i].rno + ")' style='float: right;'>削除</button>";
					str += "<button class='btn btn-warning modBtn' id='modifyBtn" + result[i].rno + "' data-rno='" + result[i].rno + "' style='float : right; margin-right: 10px;'>修正</button>";
					str += "</div></div></div></li>";
				}
				
				div.html(str);
			}
		})	
	}
	
	showReply(${board.bno});
	
	//　新しいリプライを登録する際に、内容があるか確認します。
	function replyCheck(){
		if($("#replyTextarea").val().trim() == ""){
			alert("内容を書いて下さい。");
			return false;
		}
		
		
		$.ajax({
            url: "/reply/register",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                bno: $("#replyBno").val(),
                writer: $("#replyWriter").val(),
                reply: $("#replyTextarea").val()
            }),
            success: function(result, status, xhr){
            	alert("リプライ登録が完了しました。");
                showReply($("#replyBno").val());
            },
            error: function(xhr, status, error){
                console.error("Error:", error);
                console.error("Status:", status);
                console.error("Response:", xhr.responseText);
            }
        });
	}
	
	//　指定したリプライを削除します。
	function deleteReply(rno){
		
		var writer = "";
		
		$.ajax({
			url : "/reply/rno/" + rno,
			type : "GET",
			success : function(result, status, xhr){
				console.log(result.writer);
				
				writer = result.writer;
				
				if(username == writer){
					if(confirm("本当に削除しますか。")){
						$.ajax({
							url : "/reply/delete?rno=" + rno,
							type : "POST",						
							success : function(result, status, xhr){
								console.log(result);
								alert("削除が完了しました。");
								showReply(${board.bno});
							}
						});
					} else {
						return false;
					}
				} else {
					alert("本人以外の削除は出来ません。");
					return false;
				}
			}
		});
	}
	
	
	//　リプライにある‘修正’ボタンをクリックすると、本人確認後リプライを修正するModalを見せます。
	$(document).on('click', '.modBtn', function() {
            var rno = $(this).data('rno');
            modifyReply(rno);
        });
	
	function modifyReply(rno) {
        var writer = "";

        $.ajax({
            url: "/reply/rno/" + rno,
            type: "GET",
            success: function(result, status, xhr) {
                writer = result.writer;

                if (username == writer) {
                    $("#myModal").modal("show");
                    $("#replyModifyTextarea").val(result.reply);
                    $("#modalRno").val(result.rno);
                } else {
                    alert("本人以外の修正は出来ません。");
                    return false;
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                console.error("Status:", status);
                console.error("Response:", xhr.responseText);
            }
        });
    }
	
	// Modalにある‘修正’ボタンをクリックしてリプライを修正します。
	function postModifyReply(){
		if($("#replyModifyTextarea").val().trim() == ""){
			alert("修正する内容を入力してください。");
			return false;
		}
		
		var modifiedReply = {
				rno : $("#modalRno").val(),
				reply: $("#replyModifyTextarea").val()
		};
		
		$.ajax({
			url : "/reply/modify",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(modifiedReply),
			success : function(result, status, xhr){
				console.log(result);
				alert("リプライの修正が完了しました。");
				$("#myModal").modal("hide");
				showReply(${board.bno});
			}
		});
		
	}
</script>
<%@ include file="../includes/footer.jsp" %>
