<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"  rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>

<table  class="table table-hover table table-striped">
		<thead>
			    <th>id</th>
				<th>username</th>
				<th>password</th>
		</thead>
		<tbody>
			<c:forEach items="${itemList}" var="item">
				 <tr>
				    <td>${item.id}</td>
				    <td>${item.username}</td>
				    <td>${item.password}</td>
				    <td>
				    	<button class="btn btn-success btn-xs"  data-toggle="modal" data-target="#editLayer" onclick="editItems(${item.id})">修改</button>
				    	<button class="btn btn-danger btn-xs" onclick="deleteItem(${item.id})">删除</button>
				    	
				    </td>

				</tr>
				
			</c:forEach>
			
<!-- 			记录添加弹出层 -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addLayer"> 添加记录 </button>
			<div class="modal fade" id="addLayer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			          
			            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title">添加记录</h4>
			            
			          </div>
			            <div class="modal-body">
				            <form id="add_items_form" class="form-horizontal">
				                <input type="hidden" class="form-control" name="id"> <br>
								<input type="text" class="form-control" placeholder="用户名" name="username"> <br>
	                            <input type="password" class="form-control" placeholder="密码" name="password">
	                        </form>
				        </div>
			          
			          
			          <div class="modal-footer">
			            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
			            <button class="btn btn-primary" type="button" onclick="addItem()">确认添加</button>
			          </div>
			          
			        </div>
			      </div>
			</div>
			 <!-- <div style="height:200px"></div> -->
			 
<!-- 			查询记录  -->
			 <form id="search_form" action="${pageContext.request.contextPath }/admin/items/allList.do" method="post">
	           <div class="row">
	                 <div class="col-md-2">
	                       <input type="text" id="search_item_name" class="form-control input-sm" placeholder="输入用户名" name="username" value="">
	                 </div>                
	                 <div class="col-md-9">
	                    
	                    <button id="search_btn" type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
	                 </div>
	            </div> 
             </form>
             
             
  <!-- 			记录修改弹出层 -->
			<div class="modal fade" id="editLayer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
			        <div class="modal-content">
			          <div class="modal-header">
			          
			            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			            <h4 class="modal-title">修改记录</h4>
			            
			          </div>
			            <div class="modal-body">
				            <form id="edit_items_form" class="form-horizontal">
				                <input type="hidden" id="edit_item_id" class="form-control" name="id"> <br>
								<input type="text" id="edit_item_username" class="form-control" placeholder="用户名" name="username"> <br>
	                            <input type="password" id="edit_item_password" class="form-control" placeholder="密码" name="password">
	                        </form>
				        </div>
			          
			          
			          <div class="modal-footer">
			            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
			            <button class="btn btn-primary" type="button" onclick="updateItem()">确认修改</button>
			          </div>
			          
			        </div>
			      </div>
			</div>
			 <!-- <div style="height:200px"></div> -->           
             
             
		</tbody>
	</table>

</body>
<script type="text/javascript">
  $(function(){
	  init();
  })
  function init(){
// 	  alert("初始化界面...");
  }
  
//   删除
  function deleteItem(id){
	 if(confirm("确定要删除该记录吗？")){
		 $.post(
					"${pageContext.request.contextPath }/admin/items/delete.do",
					{"id":id},
					function(){
						alert("删除成功！");
						window.location.reload();
					}
				);
	 }
  }
  
	//添加记录
	function addItem(){
		$.ajax({
			type:"POST",
			data:new FormData($("#add_items_form")[0]),
			url:"${pageContext.request.contextPath }/admin/items/save.do",
			
			cache:false,
			contentType:false,
			processData:false,
			success:function(){
				alert("记录添加成功!");
				window.location.reload();
			}
		});
	}
	
// 	“确认修改”按钮的点击事件
	function updateItem(){
		$.ajax({
			type:"POST",
			data:new FormData($("#edit_items_form")[0]),
			url:"${pageContext.request.contextPath }/admin/items/update.do",
			
			cache:false,
			contentType:false,
			processData:false,
			success:function(){
				alert("修改成功!");
				window.location.reload();
			}
		});
	}
	
	//点击“修改”按钮，打开编辑窗口，回显数据
	function editItems(id){
		$("#edit_items_form")[0].reset();
		$.ajax({
			type:"POST",
			data:{"id":id},
			url:"${pageContext.request.contextPath }/admin/items/edit.do",
			
			dataType:"json",
			success:function(data){
				$("#edit_item_id").val(data.id);
				$("#edit_item_username").val(data.username);
				$("#edit_item_password").val(data.password);

			}
		});
	}
	

</script>
</html>
