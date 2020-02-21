<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>studentbuttom</title>
	<meta charset="utf-8">
	<style>
		#main{
		width:100%;
		background: url("images/studentbuttom2.png") 0 0 no-repeat;
		height:500px;
		margin:10px auto;
		border:1px solid black;
		border-radius:10px;
		background-size: 100% 100%;
		}
	</style>
</head>
<body>
	<div id="main"></div>
	<script src="jquery-1.11.3.min.js"></script>
	<script>
		var y=0;
		setInterval(function move(){
			if(y<=500)
			{
				y+=5;
			}else{

			}	
			$("#main").css("height",y);
		},30);	
	</script>
</body>
</html>
