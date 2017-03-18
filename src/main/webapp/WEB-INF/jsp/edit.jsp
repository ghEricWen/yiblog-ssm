<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>修改文章-WJY的笔记本</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/ico.jpg">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link href="http://libs.baidu.com/fontawesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/blog-post.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/passage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/wangEditor.min.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath }/index">WJY的笔记本</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath }/about" class="active">关于</a></li>
					<li><a href="${pageContext.request.contextPath }/feedback/save">反馈</a></li>
					<li><a href="${pageContext.request.contextPath }/link/save">申请友链</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<form:form action="${pageContext.request.contextPath }/passage/submitEdit" method="POST" modelAttribute="passage">
				   <input type="hidden" name="before" value="${beforeModify }">
				   <form:hidden path="id"/>
                   <div class="form-group">
                      <h4>修改文章</h4>
                      <form:select class="combobox" path="subCategory.id" items="${listSubCategory }" itemLabel="name" itemValue="id"/><h4></h4>
                      <form:input path="title" class="form-control" placeholder="标题"/>
                      <h4></h4>
                      <form:input class="form-control" placeholder="梗概" path="outline"/>
                      <h4></h4>
                      <form:textarea name="content" path="content" rows="15"></form:textarea>
                      <input type="submit" >
                   </div>
                 </form:form>
			</div>
			<div class="col-md-4">
			    <div class="well">
				<div class="well">
					<h4>搜索</h4>
					<form id="search_form" action="${pageContext.request.contextPath }/passage/search" method="get">
					<div class="input-group">
						<input name="content" type="text" class="form-control" >
						<span class="input-group-btn">
						<button id="btn_submit" class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						</span>
					</div>
					</form>
				</div>
				<div class="well">
					<h4>文章分类</h4>
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<c:forEach items="${requestScope.listSubCategory }"
									var="subCategory" begin="0" end="${requestScope.halfOfCates}">
									<li><a href="${pageContext.request.contextPath }/passage/page/${subCategory.id}/1">${subCategory.name }</a>&nbsp;(${subCategory.passageCount })</li>
								</c:forEach>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<c:forEach items="${requestScope.listSubCategory }"
									var="subCategory" begin="${requestScope.halfOfCates + 1}">
									<li><a href="${pageContext.request.contextPath }/passage/page/${subCategory.id}/1">${subCategory.name }</a>&nbsp;(${subCategory.passageCount })</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				</div>
				
				<!-- Link Well -->
				<div class="well">
				  <h4>推荐网站</h4>
				  <h4></h4>
				  <c:forEach items="${listLink}" var="link">
				    <h4><a target="_blank" href="${link.url }"><c:out value="${link.name }"/></a></h4>
				  </c:forEach>
				</div>
				
				<div class="well">
					<h4>${build.content } : <fmt:formatDate value="${build.time }" pattern="yyyy年MM月dd日"/></h4>
					<h4>${lastUpdate.content } : <fmt:formatDate value="${lastUpdate.time }" pattern="yyyy年MM月dd日"/></h4>
				</div>
			</div>
		</div>
		<hr>
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; WJY的笔记本</p>
				</div>
			</div>
		</footer>

	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/wangEditor.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/passage.js"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
		  $("#btn_submit").click(function(){
			  $("#search_form").submit();
		  });
	  });
	</script>
	<script type="text/javascript"></script>
	
</body>

</html>
