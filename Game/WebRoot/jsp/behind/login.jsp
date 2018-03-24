<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>游戏个人中心登录</title> 
<link href="<%=path%>/jsp/behind/css/login.css" type="text/css" rel="stylesheet"> 
</head> 
<body> 

<div class="login">
    <div class="message">游戏个人中心登录</div>
    <div id="darkbannerwrap"></div>
    
    <form method="post" action="<%=path%>/login.do">
		<input name="action" value="login" type="hidden">
		<input name="name" placeholder="用户名" required="" type="text">
		<hr class="hr15">
		<input name="pass" placeholder="密码" required="" type="password">
		<hr class="hr15">
		<input value="登录" style="width:100%;" type="submit">
		<hr class="hr20">
		<a href="<%=path%>/jsp/behind/regist.jsp">还没注册？</a>
	</form>

	
</div>

<div class="copyright">© 2016品牌名称 </div>
<script type="text/javascript">
	if('${mes}'!=''){
	alert('${mes}');
	}
</script> 
</body>
</html>
