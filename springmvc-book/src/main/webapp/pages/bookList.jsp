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
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<td>id</td>
				<td>书名</td>
				<td>作者</td>
				<td>价格</td>
				<td style="display:none">asd</td>
				<td>类别</td>
				<td>出版时间</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody id="bookData"></tbody>
	</table>
	<button id="first" class="btn btn-primary">首页</button>
	<button id="pre" class="btn btn-success">上一页</button>
	<button id="next" class="btn btn-primary">下一页</button>
	<button id="last" class="btn btn-primary">尾页</button>
	<!--  -->
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">编辑书籍</h4>
	      </div>
	      <div class="modal-body">
	        <form enctype="multipart/form-data" method="POST" id="book-form" class="form-horizontal" role="form">
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
			      <img id="coverImg" width="50px" height="50px" class="img-circle" >
			    </div>
			  </div>
			  
			 
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button onclick="editSubmit()" type="button" class="btn btn-primary">提交</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<form id="deleteBook" method="POST">
		<input type="hidden" name="_method" value="delete" />
	</form>
	
	<script src="${pageContext.request.contextPath}/static/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	
    	// 全局图书id，用于更新书籍时使用
    	var bookId;
    	
    	// 书籍列表分页用到的信息
    	var pageNumber = 1, pageSize = 2; 	
        var pre, next, last;
    	$(function(){
    		
    		// 页面加载完之后加载分类，用于更新书籍时，选中原来的分类
    		loadCategory();
    		
    		// 页面加载完成后查询书籍列表 
    		queryBook(pageNumber, pageSize);
    		$("#first").on("click", function() {
    			queryBook(1, pageSize);
    		});
    		
    		$("#pre").on("click", function() {
    			queryBook(pre, pageSize);
    		});
    		
    		$("#next").on("click", function() {
    			queryBook(next, pageSize);
    		});
    		
    		$("#last").on("click", function() {
    			queryBook(last, pageSize);
    		});
    	});
    
    	function queryBook(pageNumber, pageSize) {
    		$.ajax({
    			url: "${pageContext.request.contextPath}/books",
    			type: "GET",
    			data:"pageNumber=" + pageNumber + "&pageSize=" +pageSize,
    		    dataType: "json",
    		    success: function(data){
    		    	pre = data.pre;
    		    	next = data.next;
    		    	last = data.totalPages;
    		    	
    		    	var trs;
    		    	$.each(data.rows, function(i, book){
        		    	trs += "<tr>"
        		    	    + "<td>" + book.id + "</td>"
        		    	    + "<td>" + book.bookName + "</td>"
        		    	    + "<td>" + book.author + "</td>"
        		    	    + "<td>" + book.price + "</td>"
        		    	    + "<td style='display:none'>" + book.category + "</td>"
        		    	    + "<td>" + book.categoryName + "</td>"
        		    	    + "<td>" + book.publishDate + "</td>"
        		    	    + "<td>"
        		    	    + "<button data-toggle='modal' data-target='#myModal' onclick='editBook(" + JSON.stringify(book) + ")' class='btn btn-primary'>修改</button>&nbsp;&nbsp;"
        		    	    + "<button onclick='deleteBook(" +book.id+ ")' class='btn btn-danger'>删除</button>"
        		    	    + "</td>";
    		    	});
    		    	
    		    	// 如果是第一页, 将"上一页"按钮置为失效
    		    	if(data.pageNumber == 1) {
    		    		$("#pre").attr("disabled", "true");
    		    	} else {
    		    		$("#pre").removeAttr("disabled");
    		    	}
    		    	
    		    	// 如果是最后一页, 将"下一页"按钮置为失效
    		    	if(data.pageNumber == last){
    		    		$("#next").attr("disabled", "true");
    		    	} else {
    		    		$("#next").removeAttr("disabled");
    		    	}
    		        $("#bookData").html(trs);
    		    }
    		});
    	}
    	
    	// 点击编辑按钮时，给模态框赋值
    	function editBook(book){
    		bookId = book.id;
    		$("#bookName").val(book.bookName);
    		$("#author").val(book.author);
    		$("#price").val(book.price);
    		$("#publishDate").val(book.publishDate);
    		$("#coverImg").attr("src", book.coverPath);
    		$("#category").val(book.category);
    	}
    	
    	// 加载类别
    	function loadCategory() {
    		$.ajax({
    			url: '${pageContext.request.contextPath}/dict/category',
    			type: 'GET',
    			dataType:'json',
    			async:false,
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
    	}
    	
    	// 提交更新书籍操作
    	function editSubmit(){
    		$("#book-form").attr("action", "${pageContext.request.contextPath}/book/" + bookId).submit();
    	}
    	
    	// 删除书籍提交：DELETE
    	function deleteBook(id) {
    		$("#deleteBook").attr("action", "${pageContext.request.contextPath}/book/" + id).submit();
    	}
    </script>
  </body>
</html>