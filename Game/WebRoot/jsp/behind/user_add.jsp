<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="<%=path%>/jsp/behind/css/bootstrap1.css" rel="stylesheet" />
    <link href="<%=path%>/jsp/behind/css/base.css" rel="stylesheet" />
</head>
<body style="min-height:800px; height: auto">
    <div class="container-fluid">

        <nav class="navbar navbar-default row no-yj  navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-list-left" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
                    <a class="navbar-brand" href="#">游戏个人中心</a>
                </div>

                <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="height: 50px">
                            <img class="img-circle pull-left img-responsive nav-user-img" src="<%=path%>/jsp/behind/img/user.jpg" /><span class="pull-left nav-username">${sessionScope.user.name }</span></a>
                        </li>
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="<%=path%>/jsp/behind/login.jsp" style="height: 50px">
                            <span class="pull-left">退出</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
    
        <div class="row" style="margin-top:70px">
            <div class="  nav-left col-md-2 no-padding" id="nav-list-left">
                <div class="user-panel">
                    <img src="<%=path%>/jsp/behind/img/user.jpg" class="img-circle center-block" />
                </div>

                <div class="nav-list" >
                    <ul>
                        <li>
                            <a href="<%=path%>/jsp/behind/index.jsp">首页</a>
                        </li>
                        <c:if test="${sessionScope.user.status == 3 }">
							<li class="nav-left-dropdown">
								<a href="<%=path %>/queryUserBypage.do">用户管理</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.user.status == 1 }">
							<li class="nav-left-dropdown">
								<a href="<%=path %>/jsp/behind/registlist.jsp">用户管理</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.user.status == 3 }">
							<li class="nav-left-dropdown">
								<a href="<%=path %>/queryNoteBypage.do">公告管理</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.user.status == 1 }">
							<li class="nav-left-dropdown">
								<a href="<%=path %>/queryNoteBypage.do">公告查看</a>
							</li>
						</c:if>
						<li>
                            <a href="<%=path%>/jsp/behind/total.jsp">充值界面</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="main-right  col-md-10 col-md-offset-2">
                <div class="panel-body">
                    <ol class="breadcrumb">
                        <li><a href="<%=path%>/jsp/behind/index.jsp">首页</a></li>
                        <li>新增user</li>
                    </ol>
                </div>
                
                <div class="col-md-12">
                	
                    <div class="panel panel-default ">
                        <div class="panel-heading">新增user</div>
                        
                        <div class="panel-body">
                        	<div class="main  col-xs-12">
                        	<form action="<%=path %>/addUser.do" method="post">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">用户名</label>
                                    <input type="text" name="name" class="form-control" placeholder="用户名" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">密码</label>
                                    <input type="text" name="pass" class="form-control" placeholder="密码" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">角色</label>
                                    <input type="text" name="status" class="form-control" placeholder="角色" />
                                </div>
                                <input type="submit" class="btn btn-default" value="提交" />
                            </form>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=path%>/jsp/behind/js/jquery.min.js"></script>
    <script src="<%=path%>/jsp/behind/js/bootstrap.min1.js"></script>
</body>
</html>