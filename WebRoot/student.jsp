<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>studenttop</title>
	<meta charset="utf-8">
	<style type="text/css">
			body,div,nav,ul,li{
		margin:0;
		padding:0;
		list-style: none;
	}
		#top{
			width:75%;
			height:160px;
			margin:5px auto;
			background:url("images/ttop.png") 150px 0 no-repeat;
			background-color:#444;
			background-size:80% 50%;
			border:2px solid rgba(6,31,62,0.7);
			border-radius: 20px;
		}
		#nav{
		position: relative;
		width:550px;
		height:50px;
		margin:20px auto;
		background-color:#fff;
	}
	#nav:before{
		position: absolute;
		display: block;
		left:-17px;
		top:7px;
		content: '';
		width:36px;
		height:36px;
		transform:rotate(45deg);
		background-color:#444;
	}
	#nav:after{
		position: absolute;
		left:532px;
		top:7px;
		display: block;
		content: '';
		width:36px;
		height:36px;
		transform:rotate(45deg);
		background-color:#444;
	}
	#nav ul{
		position: relative;
		top:-10px;
		width:450px;
		height:60px;
		margin:0 auto;
		display: flex;
		overflow: hidden;
	}
	#nav ul li{
		color:#444;
		position:relative;
		top:10px;
		width:100px;
		height:50px;
		text-align:center;
		line-height:50px;
		transition: .4s;
		box-shadow:0px 10px 0px -10px #444;
		cursor:pointer;
		border-radius: 5px;
	}
	#nav ul li:hover{
		top:0px;
		background-color:  #ff0;
	}
	#nav ul li:before{
		position:absolute;
		top:50px;
		display:block;
		content:'';
		width:10px;
		height:10px;
		background:linear-gradient(45deg,#fff 50%,#ccc 50%);
	}
	#nav ul li:after{
		position:absolute;
		right:0;
		top:50px;
		display:block;
		content:'';
		width:10px;
		height:10px;
		background:linear-gradient(-45deg,#fff 50%,#ccc 50%);
	}
	a{
		text-decoration: none;
		color:#444;
	}
		#buttom{
		width:75%;
		height:350px;
		margin:10px auto;
	}
		#admin{
		position:relative;
		left:20px;
		top:20px;
		width:60px;
		height:60px;
		background:url("images/admin.png") 0 0 no-repeat;
	}
	#admin:hover{
		cursor:pointer;
	}
	#yh{
		position:relative;
		top:70px;
		left:-133px;
		width:200px;
		height:140px;
		border:1px solid black;
		border-radius:10px;
		background-color:rgba(120,120,120,0.7);
		display:none;
	}
	#yh li{
		margin-top:10px;
		margin-left:20px;
		color:#fff;
		font-weight:bold;
	}
	</style>
</head>
<body>
	<div id="top">
		<div id="admin">
			<ul id="yh">
				<li>个人信息</li>
				<li>角色： ${role}</li>
				<li>用户名：${username}</li>
				<li>姓名： ${studentname}</li>
				
			</ul>
		</div>
		<div id="nav">
			<ul>
				<li id="downwj">下载文件</li>
				<li id="msg">写下留言</li>
				<li id="lookreply">查看回复</li>
				<li id="updatepwd">修改密码</li>
			</ul>
		</div>
	</div>
	<div id="buttom"></div>
	    <script src="jquery-1.11.3.min.js"></script>
	    <script type="text/javascript">
			   $(function(){
			   $("#downwj").bind("click",function(){  
				       $.ajax({
						     type: 'GET',
						     url: 'downWjServlet' ,
						     success: function(data){
						    $("#buttom").html(data);
						     }
						});
			 	  });
			 	   $("#updatepwd").bind("click",function(){  
				       $.ajax({
						     type: 'GET',
						     url: 'updateStudentPwd.jsp' ,
						     success: function(data){
						    $("#buttom").html(data);
						     }
						});
			 	  });
			 	   $("#msg").bind("click",function(){  
				       $.ajax({
						     type: 'GET',
						     url: 'msg.jsp' ,
						     success: function(data){
						    $("#buttom").html(data);
						     }
						});
			 	  });
			 	    $("#lookreply").bind("click",function(){  
				       $.ajax({
						     type: 'GET',
						     url: 'lookreplyServlet' ,
						     success: function(data){
						    $("#buttom").html(data);
						     }
						});
			 	  });
			 	  	$("#admin").hover(function(){
		 	   		$("#yh").show();
		 	   		$("#yh").animate({top:'60px',left:'-133px'},700);
		 	   		$("#yh").animate({top:'70px',left:'-133px'},700);
		 	   		$("#yh").animate({top:'60px',left:'-133px'},700);
		 	   		$("#yh").animate({top:'70px',left:'-133px'},700);
		 	   },function(){
		 	   		$("#yh").hide();
		 	   });
	});
		</script>
</body>
</html>
