<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
 <head>
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <meat charset="utf-8">
  <title>添加教师信息</title>
  <style>
	body,table,input,form{
		margin:0px;
		padding:0px}
	#main{
		background-color:#444;
		width:100%;
		height:400px;
		margin:10px auto;
		border:1px solid black;
		border-radius:10px;
	}
	form{
		width:60%;
		height:200px;
		margin-top:50px;
		margin-left:200px;
		color:#fff;		
	}
	input{
		width:150px;
		height:20px;
		margin-left:20px;
		border:1px solid white;
		border-radius:5px;
		text-align:left;
		font-family:"楷体";
		border-style:none none;
		}
	select{
		margin-left:20px;
		border:1px solid white;
		border-radius:5px;
	}
	td,th{
		color:#fff;
		border:0.5px dashed #fff;
		border-style:dashed none;
	}
	a{
		width:80px;
		height:20px;
		display:block;
		background:#fff;
		margin-left:310px;
		border:1px solid white;
		text-decoration:none;
		text-align:center;
		line-height:20px;
		color:#444;
	}
	 #tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  margin-left:300px;
	  margin-top:30px;
   }
  </style>
 </head>
 <body>
 <div id="main">
 	<!--<canvas class="bubble"></canvas>-->
	<form id="from1">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<th width="100" height="50">教师工号</th>
				<td width="350" height="50"><input type="text" name="gno" 
				id="gno" value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">教师名字</th>
				<td width="350" height="50"><input type="text" name="teachername" id="teachername"
				value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">教师密码</th>
				<td width="350" height="50"><input type="text" name="teacherpwd" id="teacherpwd"
				value=""/></td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<a id="addTeacherBtn" name="addTeacherBtn" href="javascript:void(0)">保存</a>
				</td>
			</tr>
		</table>
	</form>
	<div id="tipinfo"></div>	
	</div>
		<script src="jquery-1.11.3.min.js"></script>
	  	<script type="text/javascript">
	  	$(function(){ 
		$("#addTeacherBtn").bind("click",function(){  
			   //验证教师工号
		   var gno=$("#gno");
		   if($.trim(gno.val()).length==0){
				$("#tipinfo").html("教师工号不能为空！");
				gno.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //教师名字
		   var teachername=$("#teachername");
		   if($.trim(teachername.val()).length==0){
				$("#tipinfo").html("教师名字不能为空！");
				teachername.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //教师密码
		   var teacherpwd=$("#teacherpwd");
		   if($.trim(teacherpwd.val()).length==0){
				$("#tipinfo").html("教师密码不能为空！");
				teacherpwd.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   var teacherid=$("#teacherid").val();
		   
		   var url="addTeacherServlet";
		   if(teacherid!=null && teacherid!=""){
				url="updateTeacherServlet";			
		   }
		   //验证通过后，用AJAX提交请求
		   $.ajax({
				 type: 'POST',
				 url: url,
				 data: {
					gno:$.trim(gno.val()),
					teachername:$.trim(teachername.val()),
					teacherpwd:$.trim(teacherpwd.val()),
				 },
				 success: function(data) {
					  //data代表服务端返回的数据
					  if($.trim(data)=="1"){//添加成功
							//设置提示信息为绿色
							$("#tipinfo").css("color","#fff");
							if(teacherid==null || teacherid==""){
								$("#tipinfo").html("添加教师信息成功");
							}else{
								$("#tipinfo").html("修改教师信息成功");
							}
							      
							//等待3秒后，重新用AJAX加载“添加新闻”页面
							setTimeout('ajaxLoadAddTeacherPage()',1500);

					  }else{//添加失败
					     if(teacherid==null || teacherid==""){
						   $("#tipinfo").html("添加教师信息失败");
						 }else{
						   $("#tipinfo").html("修改教师信息失败"); 
						 }
					  }   
				 }
			});
	});
}); 
	function ajaxLoadAddTeacherPage(){
		$.ajax({
			 type: 'post',
			 url: 'addteacher.jsp' ,
			 success: function(data) {
				  $("#buttom").html(data);
			 }
		 });	
}
	
  </script>
 </body>
</html>
