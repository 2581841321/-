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

${error }



<form action="${pageContext.request.contextPath}/testVlidator" 
	  method="POST"
      class="form-horizontal" role="form">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">姓名</label>
    <div class="col-sm-3">
      <input type="text" 
      		 class="form-control" 
      		 name="name" 
      		 id="name" placeholder="姓名">
    </div>
  </div>
  <div class="form-group">
    <label for="age" class="col-sm-2 control-label">年龄</label>
    <div class="col-sm-3">
      <input type="text" 
             class="form-control"
             name="age" 
             id="age" placeholder="年龄">
    </div>
    
     <div class="form-group">
    <label for="birthday" class="col-sm-2 control-label">出生日期</label>
    <div class="col-sm-3">
      <input type="date" 
             class="form-control"
             name="birthday" 
             id="birthday" placeholder="出生日期">
    </div>
    
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">提交</button>
    </div>
  </div>
</form>
	<script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>