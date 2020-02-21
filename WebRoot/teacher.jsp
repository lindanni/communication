<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta charset="utf-8">
	<style>
	body{
		position:relative;
		z-index:0;
	}
		body,div,nav,ul,li{
		margin:0;
		padding:0;
		list-style:none;
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
		background-color: #ff0;
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
		height:400px;
		margin:10px auto;
	}
	#myCanvas{
			position:absolute;
			margin-left:460px;
			margin-top:250px;
			display:none;
			z-index:1;
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
	<canvas id="myCanvas" width="150px" height="150px"></canvas>
	<div id="top">
		<div id="admin">
			<ul id="yh">
				<li>个人信息</li>
				<li>角色： ${role}</li>
				<li>用户名：${username}</li>
				<li>姓名： ${teachername}</li>
			</ul>
		</div>
		<div id="nav">
			<ul>
				<li id="scwj">上传文件</li>
				<li id="cksc">查看上传</li>
				<li id="myreceivemsg">回复消息</li>
				<li id="updatepwd">修改密码</li>
			</ul>
		</div>
	</div>
	<div id="buttom"></div>
	    <script src="jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			   $(function(){
			   $("#scwj").bind("click",function(){  
			   			$("#myCanvas").css("display","block");
						setTimeout( function(){$("#myCanvas").css("display","none");},1300);
             
				       $.ajax({
						     type: 'GET',
						     url: 'scwj.jsp' ,
						     success: function(data){
						     setTimeout(function(){$("#buttom").html(data);},800);
						     }
						});
			 	  });
			 	   $("#cksc").bind("click",function(){  
			   			$("#myCanvas").css("display","block");
						setTimeout( function(){$("#myCanvas").css("display","none");},1000);
				       $.ajax({
						     type: 'GET',
						     url: 'ckscServlet' ,
						     success: function(data){
						     setTimeout(function(){$("#buttom").html(data);},1000);
						     }
						});
			 	  });
			 	  	$("#myreceivemsg").bind("click",function(){  
			   			$("#myCanvas").css("display","block");
						setTimeout( function(){$("#myCanvas").css("display","none");},1000);
       
				       $.ajax({
						     type: 'GET',
						     url: 'myreceivemsgServlet' ,
						     success: function(data){
						     setTimeout(function(){$("#buttom").html(data);},1000);
						     }
						});
			 	  });
			 	    $("#updatepwd").bind("click",function(){  
			   			$("#myCanvas").css("display","block");
						setTimeout( function(){$("#myCanvas").css("display","none");},1000);
       
				       $.ajax({
						     type: 'GET',
						     url: 'updateTeacherPwd.jsp' ,
						     success: function(data){
						     setTimeout(function(){$("#buttom").html(data);},1000);
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
        <script>
			var canvas=document.getElementById("myCanvas");
			var context=canvas.getContext("2d");
			var image=new Image();
			image.onload=function(){
				context.drawImage(image,0,0);
			}
			image.src='images/zhuan.png';
			function rotate(){
				var x=canvas.width/2;
				var y=canvas.height/2;
				context.clearRect(0,0,canvas.width,canvas.height);
				context.translate(x,y);
				context.rotate((Math.PI/180)*5);
				context.translate(-x,-y);
				context.drawImage(image,0,0);
			}
			self.setInterval(rotate,10);
	</script>
</body>
</html>
