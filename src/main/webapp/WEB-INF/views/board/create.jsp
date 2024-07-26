<%@ include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="row">
            <div class="col-md-12" style="display: none;">
                <button class="btn btn-primary" style="float: right"
			onclick="location.href='/board/create'">新しい書き込みを作成する</button>
            </div>
        </div>
        <div class="blank"></div>
        <div class="row">
            <div class="col-md-12">
                <form action="/board/create" name="frm" method="post" accept-charset="UTF-8">
                	<sec:csrfInput/>
                    <div class="form-group">
                        <label for="title">タイトル</label>
                        <input type="text" name="title" id="title" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="writer">作成者</label>
                        <input type="text" name="writer" id="writer" class="form-control" value="${users.nickname }" readonly="readonly">
                        <input type="hidden" name="writerId" id="writerId" value="${users.username }">
                    </div>
                    <div class="form-group">
                        <label for="">本文</label>
                        <textarea cols="10" rows="3" name="content" class="form-control"></textarea>
                    </div>
                    <div class="blank"></div>
                    <div class="form-group">
                        <input type="submit" id="submit" class="btn btn-primary" value="登録" style="float: right;" onclick="return formCheck()">
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
    function formCheck(){
    	//　書き込みを登録する前に情報の確認をします。
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
<%@ include file="../includes/footer.jsp" %>