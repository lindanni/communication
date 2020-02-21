<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
BaseDAO dao=new BaseDAO();
Map<String,Object> data=dao.getAll("*", "majorname", "", "majorid desc", 0, 999);
List<Map<String,String>> majornames=(List<Map<String,String>>)data.get("records");
request.setAttribute("majornames", majornames); 
%>

<!doctype html>
<html lang="en">
 <head>
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <meat charset="utf-8">
  <title>添加学生信息</title>
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
		height:300px;
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
		margin-left:320px;
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
   }
  </style>
 </head>
 <body>
 <div id="main">
 	<!--<canvas class="bubble"></canvas>-->
	<form id="from1">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<th width="100" height="50">学生学号</th>
				<td width="350" height="50"><input type="text" name="sno" 
				id="sno" value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">学生名字</th>
				<td width="350" height="50"><input type="text" name="studentname" id="studentname"
				value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">学生密码</th>
				<td width="350" height="50"><input type="text" name="studentpwd" id="studentpwd"
				value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">学生专业</th>
				<td width="450" height="50">
					<select id="majorid" name="majorid">
						<c:forEach items="${majornames}" var="c">
					            <option value="${c.majorid}" <c:if test="${c.majorid==r.majorid}">selected='selected'</c:if> >${c.majorname}</option>
					        </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<a id="addStudentBtn" name="addStudentBtn" href="javascript:void(0)">保存</a>
				</td>
			</tr>
		</table>
	</form>
	<div id="tipinfo"></div>	
	</div>
		<script src="jquery-1.11.3.min.js"></script>
	  	<script type="text/javascript">
	  	$(function(){ 
		//添加新闻“保存”的单击动作
		$("#addStudentBtn").bind("click",function(){  
			   //验证学号
		   var sno=$("#sno");
		   if($.trim(sno.val()).length==0){
				$("#tipinfo").html("学号不能为空！");
				sno.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //学生名字
		   var studentname=$("#studentname");
		   if($.trim(studentname.val()).length==0){
				$("#tipinfo").html("学生名字不能为空！");
				studentname.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //学生密码
		   var studentpwd=$("#studentpwd");
		   if($.trim(studentpwd.val()).length==0){
				$("#tipinfo").html("学生密码不能为空！");
				studentpwd.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   var studentid=$("#studentid").val();
		   
		   var url="addStudentServlet";
		   if(studentid!=null && studentid!=""){
				url="updateStudentServlet";			
		   }
		   //验证通过后，用AJAX提交请求
		   $.ajax({
				 type: 'POST',
				 url: url,
				 data: {
					sno:$.trim(sno.val()),
					studentname:$.trim(studentname.val()),
					studentpwd:$.trim(studentpwd.val()),
					majorid:$("#majorid").val(),
				 },
				 success: function(data) {
					  //data代表服务端返回的数据
					  if($.trim(data)=="1"){//添加成功
							//设置提示信息为绿色
							$("#tipinfo").css("color","#fff");
							if(studentid==null || studentid==""){
								$("#tipinfo").html("添加学生信息成功");
							}else{
								$("#tipinfo").html("修改学生信息成功");
							}
							      
							//等待3秒后，重新用AJAX加载“添加新闻”页面
							setTimeout('ajaxLoadAddStudentPage()',1500);

					  }else{//添加失败
					     if(studentid==null || studentid==""){
						   $("#tipinfo").html("添加学生信息失败");
						 }else{
						   $("#tipinfo").html("修改学生信息失败"); 
						 }
					  }   
				 }
			});
	});
}); 
	function ajaxLoadAddStudentPage(){
		$.ajax({
			 type: 'post',
			 url: 'addstudent.jsp' ,
			 success: function(data) {
				  $("#buttom").html(data);
			 }
		 });	
}
	
  </script>
 </body>
</html>
