<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
//　ログアウトの確認を行います。
function logoutCheck() {
	if (confirm("本当にログアウトしますか。")) {
		return true;
	} else {
		return false;
	}
}
</script>
</body>
</html>