<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<% 
String studentpwd=(String)session.getAttribute("studentpwd");
%>
<!doctype html>
<html lang="en">
 <head>
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>修改学生密码</title>
  <style>
	body,table,input,form{
		margin:0px;
		padding:0px}
	#main{
		width:100%;
		background:#444;
		height:500px;
		margin:10px auto;
		border:1px solid black;
		border-radius:10px;
		background-size: 100% 100%;
		}
			form{
			width:60%;
			height:250px;
			margin-top:100px;
			margin-left:190px;
			color:#fff;
			text-align:left;
			display:none;
			font-family:"楷体";
	}
		input{
		width:150px;
		height:20px;
		margin-left:20px;
		border-radius:5px;
		text-align:left;
		}
	select{
		margin-left:20px;
		border:1px solid #fff;
		border-radius:5px;
		text-align:left;
	}
	td,th{
		color:#fff;
		border:0.5px dashed #fff;
		border-style:dashed none;
	}
	span{
		font-weight:bold;
		font-size:25px;
		color:block;
		display:block;
		margin-top:20px;
		margin-left:100px;
	}
	#updateStudentPwdBtn{
		margin-left:400px;
	}
	 #tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  color:red;
	  margin-left:340px;
   }
   a{
   		color:#fff;
   }
  </style>
 </head>
 <body>
 <div id="main">
 	<!--<canvas class="bubble"></canvas>-->
	<form id="form1">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<th width="100" height="50">原密码</th>
				<td width="450" height="50"><input type="text" name="oldpwd" 
				id="oldpwd" value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">新密码</th>
				<td width="450" height="50"><input type="text" name="newpwd" id="newpwd"
				value=""/></td>
			</tr>
			<tr>
				<th width="100" height="50">确认新密码</th>
				<td width="450" height="50"><input type="text" name="newpwd1" id="newpwd1"
				value=""/></td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<a id="updateStudentPwdBtn" name="updateStudentPwdBtn" href="javascript:void(0)">保存</a>
				</td>
			</tr>
		</table>
	</form>
	<div id="tipinfo"></div>	
	</div>
		<script src="jquery-1.11.3.min.js"></script>
	  	<script type="text/javascript">
	  	$(function(){ 
		$("#updateStudentPwdBtn").bind("click",function(){  
			   //验证新密码
		   var oldpwd=$("#oldpwd");
		   if($.trim(oldpwd.val()).length==0){
				$("#tipinfo").html("原密码不能为空！");
				oldpwd.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //新密码
		   var newpwd=$("#newpwd");
		   if($.trim(newpwd.val()).length==0){
				$("#tipinfo").html("新密码不能为空！");
				newpwd.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //确认新密码
		   var newpwd1=$("#newpwd1");
		   if($.trim(newpwd1.val()).length==0){
				$("#tipinfo").html("确认新密码不能为空！");
				newpwd1.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   var studentpwd=<%=studentpwd%>;
		   if(oldpwd.val().toString()!=studentpwd){
		   		$("#tipinfo").html("原密码输入错误！");
		   		return;
		   }else{
				$("#tipinfo").html("");
		   }
		   if(newpwd.val()!=newpwd1.val()){
		   		$("#tipinfo").html("两次密码不一样！");
		   		return;
		   }else{
				$("#tipinfo").html("");
		   }
		   //验证通过后，用AJAX提交请求
		   $.ajax({
				 type: 'POST',
				 url:"updateStPwdServlet",
				 data: {
					oldpwd:$.trim(oldpwd.val()),
					newpwd:$.trim(newpwd.val()),
				 },
				 success: function(data) {
					  //data代表服务端返回的数据
					  if($.trim(data)=="1"){//添加成功
							//设置提示信息为绿色
							$("#tipinfo").css("color","#fff");
							$("#tipinfo").html("修改密码成功");    
							setTimeout('shuaxin()',3000);
					  }else{//添加失败	
						   $("#tipinfo").html("修改密码失败"); 
						   setTimeout('shuaxin()',3000);
					  }   
				 }
			});
	});
}); 
	function shuaxin(){
		window.location='login.jsp';
}
			var y=0;
			setInterval(function move(){
			if(y<=500)
			{
				y+=5;
			}else{

			}	
			$("#main").css("height",y);
		},20);
		setTimeout(function(){$("#form1").css("display","block");},2000);
  </script>
 </body>
</html>
