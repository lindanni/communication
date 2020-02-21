<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
BaseDAO dao=new BaseDAO();
Map<String,Object> data=dao.getAll("*", "teacher", "", "teacherid desc", 0, 999);
List<Map<String,String>> teachernames=(List<Map<String,String>>)data.get("records");
request.setAttribute("teachernames", teachernames); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'msg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="jquery-1.11.3.min.js"></script>
	<style>
	body,table,input,form,select,td,tr{
		margin:0px;
		padding:0px;
	}
	#main{
		width:100%;
		background:#444;
		height:500px;
		margin:10px auto;
		border:1px solid black;
		border-radius:10px;
		background-size: 100% 100%;
		}
	#form1{
		width:80%;
		height:250px;
		margin-top:70px;
		margin-left:150px;
		color:#fff;
		display:none;
		font-family:"楷体";
	}
		input{
		width:200px;
		height:20px;
		border:1px solid #fff;
		border-radius:5px;
		text-align:left;
		}
		td,th{
		color:#fff;
		border:0.5px dashed #fff;
		border-style:dashed none;
	}
	select{
		border:1px solid #fff;
		border-radius:5px;
		width:100px;
		height:20px;
		text-align:left;
	}
	#msgBtn{
		width:30px;
		height:30px;
		margin-left:420px
	}
	textarea{
		width:300px;
		border-radius:5px;
	}
 #tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  color:red;
	  margin-top:20px;
	  margin-left:340px;
   }
   a{
   		color:#fff;
   }
  </style>
  </head>
  
  <body>
  	<div id="main">
    	<form id="form1">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<th width="100" height="50">标题</th>
				<td width="400" height="50"><input type="text" name="title" 
				id="title" /></td>
			</tr>
			<tr>
				<th width="100" height="50">教师</th>
				<td width="400" height="50">
					<select id="teacherid" name="teacherid">
					<c:forEach items="${teachernames}" var="c">
			            <option value="${c.teacherid}" <c:if test="${c.teacherid==r.teacherid}">selected='selected'</c:if> >${c.teachername}</option>
			        </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th width="100" height="50">内容</th>
				<td width="400" height="50">
					<textarea id="content" name="content" rows="6" cols="90"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<a id="msgBtn" name="msgBtn" href="javascript:void(0)">留言</a>
				</td>
			</tr>
		</table>
	</form>
	<div id="tipinfo"></div>
	</div>
	<script src="jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
		$(function(){ 
		    //“登录”的单击动作
			$("#msgBtn").bind("click",function(){  
			       //验证留言标题
			       var title=$("#title");
			       if($.trim(title.val()).length==0){
			            $("#tipinfo").html("留言标题不能为空！");
			            title.focus();
			            return;
			       }else{
			            $("#tipinfo").html("");
			       }
			       //验证内容
			       var content=$("#content");
			       if($.trim(content.val()).length==0){
			            $("#tipinfo").html("留言内容不能为空！");
			            content.focus();
			            return;
			       }else{
			            $("#tipinfo").html("");
			       }
			 $.ajax({
				 type: 'POST',
				 url:"msgServlet",
				 data: {
					title:$.trim(title.val()),
					teacherid:$("#teacherid").val(),
					content:$.trim(content.val()),
				 },
				 success: function(data) {
					  //data代表服务端返回的数据
					  if($.trim(data)=="1"){//添加成功
							//设置提示信息为绿色
							$("#tipinfo").css("color","#fff");
							$("#tipinfo").html("留言成功");    
							setTimeout('shuaxin()',3000);
					  }else{//添加失败	
						   $("#tipinfo").html("留言失败"); 
						   setTimeout('shuaxin()',3000);
					  }   
				 }
			});
		});
});
function shuaxin(){
	window.location.href="student.jsp";
}
		var y=0;
		setInterval(function move(){
			if(y<=500)
			{
				y+=5;
			}else{

			}	
			$("#main").css("height",y);
		},30);
		setTimeout(function(){$("#form1").css("display","block");},2000);
	</script>
  </body>
</html>
