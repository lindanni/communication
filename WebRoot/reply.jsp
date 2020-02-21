<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<% 
BaseDAO dao=new BaseDAO();
String msgid=request.getParameter("msgid");
Map<String,String> data=dao.getOneByWhere("a.*,b.studentname,c.majorname","msg a,student b,majorname c","a.studentid=b.studentid and a.majorid=c.majorid and a.msgid="+msgid);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'reply.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style>
		#main{
		width:100%;
		background:#444;
		height:400px;
		margin:10px auto;
		background-size:100% 100%;
		border:1px solid #fff;
		border-radius:10px;
		}
		form{
			width:80%;
			height:250px;
			margin-top:80px;
			margin-left:100px;
			color:#fff;
			border-radius:10px;
			font-family:"楷体";
			text-align:center;
	}
	td,th{
		width:280px;
		height:30px;
		font-size:13px;
		border:0.5px dashed #fff;
		
	}
	th{
		font-weight:blod;
	}
		input{
		width:300px;
		height:30px;
		margin-left:20px;
		border:1px solid #fff;
		border-radius:5px;
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
   		font-weight:bold;
   		margin-left:500px;
   		margin-top:25px;
   		font-family:"楷体";
   		}
	</style>
  </head>
  
  <body>
  <div id="main">
    <form id="form1">
		<table cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th width="100" height="40">标题</th>
				<td width="400" height="40"><%=data.get("title") %></td>
			</tr>
			<tr>
				<th width="100" height="40">学生</th>
				<td width="400" height="40"><%=data.get("studentname") %>(<%=data.get("major") %>)</td>
			</tr>
			<tr>
				<th width="100" height="40">留言时间</th>
				<td width="400" height="40"><%=data.get("addtime") %></td>
			</tr>
			<tr>
				<th width="100" height="40">留言内容</th>
				<td width="400" height="40"><%=data.get("content") %></td>
			</tr>
			<tr>
				<th width="100" height="40">回复内容</th>
				<td width="400" height="40">
					<textarea id="replycontent" name="replycontent" rows="3" cols="60">
					<%if(data.get("replycontent")!=null&&!data.get("replycontent").equals("")){
						out.println(data.get("replycontent"));
					}
					 %>
					</textarea>
				</td>
			</tr>
			<tr>
				<th width="100" height="50">回复时间</th>
				<td width="400" height="50">
				<%
					if(data.get("replytime")!=null&& !data.get("replytime").equals("")){
						out.println(data.get("replytime"));
					}
				 %>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<input type="hidden" id="msgid" name="msgid" value="<%=data.get("msgid") %>"/>
				<a id="reply" name="reply" href="javascript:void(0)" >回复</a>
				</td>
			</tr>
		</table>
	</form>
	<div id="tipinfo"></div>
	</div>
		<script src="jquery-1.11.3.min.js"></script>
	    <script type="text/javascript">
			   $(function(){
			   $("#reply").bind("click",function(){ 
			   //回复内容
			   var replycontent=$("#replycontent");
			   if($.trim(replycontent.val()).length==0){
					$("#tipinfo").html("回复内容不能为空！");
					replycontent.focus();
					return;
			   }else{
					$("#tipinfo").html("");
			   } 
		       $.ajax({
				     type: 'GET',
				     url: 'replyServlet' ,
				     data:{
				     	replycontent:$.trim(replycontent.val()),
				     	msgid:$("#msgid").val(),
				     },
				      success: function(data) {
					  //data代表服务端返回的数据
					  if($.trim(data)=="1"){//添加成功
							//设置提示信息为绿色
							$("#tipinfo").css("color","#fff");
							$("#tipinfo").html("回复信息成功");
							//等待3秒后，重新用AJAX加载“添加新闻”页面
							setTimeout('shuaxin()',1500);
					  }else{//添加失败
						   $("#tipinfo").html("回复信息失败");	
					  }   
				 }
				});
	 	  });
	});
	function shuaxin(){
		window.location='teacher.jsp';
	}
	</script>
  </body>
</html>
