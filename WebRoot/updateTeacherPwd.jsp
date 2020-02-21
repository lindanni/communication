<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<% 
String teacherpwd=(String)session.getAttribute("teacherpwd");
%>
<!DOCTYPE html>
<html>
<head>
	<title>教师页面下面</title>
	<style>
		#main{
		width:100%;
		background:#444;
		height:400px;
		margin:10px auto;
		background-size:100% 100%;
		border:1px solid black;
		border-radius:10px;
		}
		form{
			width:80%;
			height:250px;
			margin-top:65px;
			margin-left:150px;
			color:#fff;
	}
		input{
		width:300px;
		height:30px;
		margin-left:20px;
		border:1px solid #fff;
		border-radius:10px;
		}
	select{
		margin-left:20px;
		border:1px solid #fff;
		border-radius:10px;
	}
	span{
		font-weight:bold;
		font-size:25px;
		color:#fff;
		display:block;
		margin-top:20px;
		margin-left:100px;
	}
		 #tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  margin-left:340px;
	  margin-top:20px;
   }
   a{
   		color:#fff;
   }
	</style>
</head>
<body>
 <div id="main">
 	<span>修改密码</span>
	<form >
		<table cellpadding="0" cellspacing="0" border="1">
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
				<a id="updateTeacherPwdBtn" name="updateTeacherPwdBtn" href="javascript:void(0)">保存</a>
				</td>
			</tr>
		</table>
	</form>
	<div id="tipinfo"></div>	
	</div>
		<script src="jquery-1.11.3.min.js"></script>
	  	<script type="text/javascript">
	  	$(function(){ 
		$("#updateTeacherPwdBtn").bind("click",function(){  
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
		   var teacherpwd=<%=teacherpwd%>;
		   if(oldpwd.val().toString()!=teacherpwd){
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
				 url:"updateTePwdServlet",
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
							setTimeout('updateTeacherPwdPage()',1500);
					  }else{//添加失败	
						   $("#tipinfo").html("修改密码失败"); 
					  }   
				 }
			});
	});
}); 
	function updateTeacherPwdPage(){
		window.location='login.jsp';
}
  </script>
 </body>
</html>
