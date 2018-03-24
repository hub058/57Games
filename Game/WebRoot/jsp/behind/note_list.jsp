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
                        <li>公告管理</li>
                    </ol>
                </div>
                
                <div class="col-md-12">
                	
                    <div class="panel panel-default ">
                        <div class="panel-heading">公告列表</div>
                        
                        <div class="panel-body">
                        	<c:if test="${sessionScope.user.status == 3 }">
                        	<div class="main-right  col-xs-12">
                        		<div class="pull-right" >
                        			<a class="btn btn-success" href="<%=path%>/jsp/behind/note_add.jsp"><font color="#FFFFFF">新增公告</font></a>
                        		</div>
                        	</div>
                        	</c:if>
                            <table class="table table-bordered tb-hover">
                                <thead>
                                    <tr>
										<td>
											标题 
										</td>
										<td>
											内容 
										</td>
										<td>
											发布人 
										</td>
										<td>
											发布时间 
										</td>
                                        <td class="text-center">操作</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${noteList}" var="item">
	                                    <tr>
											<td>
											${item.title}
											</td>
											<td>
											${item.content}
											</td>
											<td>
											${item.user}
											</td>
											<td>
											${item.date}
											</td>
	                                        <td class=" text-center">
	                                        <c:if test="${sessionScope.user.status == 3 }">
											<a href="<%=path %>/editNote.do?id=${item.id}"><i class="glyphicon glyphicon-edit"></i></a>
											<a href="<%=path %>/deleteNoteByid.do?id=${item.id}" onclick="return confirm('确定删除吗?')"><i class="glyphicon glyphicon-remove"></i></a>
											</c:if>
	                                        </td> 
	                                    </tr>
                                   </c:forEach>
                                </tbody>

                            </table>
                           
							<div class="pull-right">
								<nav>
									<ul class="pagination">
										<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
											<li><a>首页</a></li>
											<li><a>上一页 </a></li>
										</c:if>
										<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
											<li><a href="<%=path %>/queryNoteBypage.do?pageNumber=1">首页</a></li>
											<li><a href="<%=path %>/queryNoteBypage.do?pageNumber=${page.pageNumber-1 }">上一页 </a></li>
										</c:if>
										<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
											<li><a>下一页 </a></li>
											<li><a>尾页 </a></li>
										</c:if>
										<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
											<li><a href="<%=path %>/queryNoteBypage.do?pageNumber=${page.pageNumber+1 }">下一页 </a></li>
											<li><a href="<%=path %>/queryNoteBypage.do?pageNumber=${page.totalPage }">尾页</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
	if('${mes}'!=''){
	alert('${mes}');
	}
</script>
</body>
<script src="<%=path%>/jsp/behind/js/jquery.min.js"></script>
</html>