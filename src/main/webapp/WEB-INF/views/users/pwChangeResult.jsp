<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEVFOX BOARD</title>
</head>
<body>
<script>
	const message = `${result}`;
	alert(message + "番のパスワード再設定が完了しました。\nログインページへ移動します。");
	window.location.replace("/login");
</script>
</body>
</html>