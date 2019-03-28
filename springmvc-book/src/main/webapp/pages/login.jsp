<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Index</title>

</head>
<body>
<form action="${pageContext.request.contextPath}/login" 
	  method="POST"
      class="form-horizontal" role="form">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-3">
      <input type="text" 
      		 class="form-control" 
      		 name="name" 
      		 id="name" placeholder="用户名">
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-3">
      <input type="password" 
             class="form-control"
             name="password" 
             id="password" placeholder="密码">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">登录</button>
    </div>
  </div>
</form>
	<script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	    if(top != window) {
			alert(top);
			top.location.href = window.location.href;
		}
    </script>
    
    
    
    
    
    
    
</body>
</html>