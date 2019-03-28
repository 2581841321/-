<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加书籍</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  
   <!-- 添加书籍 -->
   <form action="${pageContext.request.contextPath}/book" 
         enctype="multipart/form-data" 
         method="POST" class="form-horizontal" role="form">
	  <!-- 书名 -->
	  <div class="form-group">
	    <label for="bookName" class="col-sm-2 control-label">书名</label>
	    <div class="col-sm-3">
	      <input id="bookName" name="bookName" type="text" class="form-control" 
	             placeholder="书名">
	    </div>
	  </div>
	  <!-- 作者 -->
	  <div class="form-group">
	    <label for="author" class="col-sm-2 control-label">作者</label>
	    <div class="col-sm-3">
	      <input type="text" name="author" class="form-control" id="author" 
	             placeholder="作者">
	    </div>
	  </div>
	  <!-- 价格 -->
	  <div class="form-group">
	    <label for="price" class="col-sm-2 control-label">价格</label>
	    <div class="col-sm-3">
	      <input type="text" name="price" class="form-control" id="price" 
	             placeholder="价格">
	    </div>
	  </div>
	  <!-- 类别 -->
	  <div class="form-group">
	    <label for="category" class="col-sm-2 control-label">类别</label>
	    <div class="col-sm-3">
	    	<select id="category" name="category" class="form-control">
	    		<option value="0">--请选择--</option>
	    	</select>
	    </div>
	  </div>
	  <!-- 出版时间 -->
	  <div class="form-group">
	    <label for="publishDate" class="col-sm-2 control-label">出版时间</label>
	    <div class="col-sm-3">
	      <input type="date" name="publishDate" class="form-control" id="publishDate" 
	             placeholder="出版时间">
	    </div>
	  </div>
	  <!-- 封面 -->
	  <div class="form-group">
	    <label class="col-sm-2 control-label">封面</label>
	    <div class="col-sm-3">
	      <input type="file" name="pic" class="form-control" id="coverPath">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary">添加</button>
	    </div>
	  </div>
	</form>

	<script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$.ajax({
    			url: '${pageContext.request.contextPath}/dict/category',
    			type: 'GET',
    			dataType:'json',
    			success: function(data){
    				data = eval(data);
    				var options;
    				for(var index in data) {
    					var dictId = data[index].id;
    					console.log('id:' + dictId)
    					var dictName = data[index].dictName;
    					options += "<option value='" + dictId + "'>" 
    					            + dictName + "</option>";
    				}
    				$('#category').append(options);
    			}
    		});
    	});
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  </body>
</html>