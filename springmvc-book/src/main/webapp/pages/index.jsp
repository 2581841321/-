<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Index</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  	  <!-- 导航 -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
	        	<a class="navbar-brand" href="#">导航</a>
			</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
			  <li class="dropdown">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">操作<span class="caret"></span></a>
	            <ul class="dropdown-menu" role="menu">
	              <li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
	            </ul>
	          </li>
	        </ul>
	      </div>
	    </div>
	 </nav>
	 
	 <div class="container-fluid">
 		 <div class="row">
   		 	<div class="col-md-2">
   		 		<a href="#" class="list-group-item active">书籍管理</a>
   		 		<a class="list-group-item" 
   		 		   href="${pageContext.request.contextPath}/gotoAddBook" 
   		 		   target="et1811">添加书籍</a>
   		 		<a class="list-group-item" 
   		 		   href="${pageContext.request.contextPath}/gotoBookList" 
   		 		   target="et1811">书籍列表</a>
   		 	</div>
   		 	<div class="col-md-9">
				<iframe name="et1811" frameborder="0" width="100%"
					height="1000px">
				</iframe>
			</div>
  		</div>
	</div>

	<script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	    if(top != window) {
			alert(top);
			top.location.href=window.location.href;
		}
    </script>
    
    
    
    
    
    
    
  </body>
</html>