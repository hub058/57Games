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
<title>后台登录</title> 
<link href="<%=path%>/jsp/behind/css/login.css" type="text/css" rel="stylesheet"> 
</head> 
<body> 

<div class="login"> 
    <div class="message">游戏个人中心注册</div>
    <div id="darkbannerwrap"></div>
    
    <form method="post" action="<%=path%>/regist.do">
		<input name="action" value="login" type="hidden">
		<input name="name" placeholder="用户名" type="text">
		<hr class="hr15">
		<input name="pass" placeholder="密码"  type="password" required>
		<hr class="hr15">
	    <input name="phone" placeholder="手机号"  type="text" required>
		<hr class="hr15">
		<input name="mail" placeholder="E-mail"  type="email" required>
		<hr class="hr15">
		<input name="realname" placeholder="真是姓名"  type="text" required>
		<hr class="hr15">
		<input name="idnumber" placeholder="身份证号"  type="text" required>
		<hr class="hr15"> 
		
		<input value="注册" style="width:100%;" type="submit">
		<hr class="hr20">
		<a href="<%=path%>/jsp/behind/login.jsp">已经注册？</a>
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
