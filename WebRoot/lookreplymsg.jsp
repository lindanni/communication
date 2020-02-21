<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="UTF-8"%>
<%
   BaseDAO dao=new BaseDAO();
   String msgid=request.getParameter("msgid");
   String sql="select a.*,b.teachername from msg a,teacher b where a.teacherid=b.teacherid and msgid="+msgid;
   Map<String,String> data=dao.commonlist(sql).get(0);
 %>
<!doctype html>
<html lang="en">
 <head>
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>留言详情</title>
	<style>
		#main{
		width:100%;
		background: #444;
		height:400px;
		margin:10px auto;
		background-size:100% 100%;
		border:1px solid #fff;
		border-radius:10px;
		font-family:"楷体";
		}
		form{
			width:80%;
			height:250px;
			margin-top:80px;
			margin-left:200px;
			color:#fff;
			border-style:none none;
	}
	td,th{
		color:#fff;
		border:0.5px dashed #fff;
		border-style:dashed none;
		text-align:center;
	}
	th{
		width:100px;
		height:30px;
		font-weight:blod;
	}
	#tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  margin-left:340px;
   }
	</style>
 </head>
 <body>
 <div id="main">
	<form action="savemsg.jsp" method="post" id="form1" name="form1">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr>
				<th width="100" height="50">标题</th>
				<td width="300" height="50"><%=data.get("title") %></td>
			</tr>
			<tr>
				<th width="100" height="50">老师</th>
				<td width="300" height="50"><%=data.get("teachername") %></td>
			</tr>
			<tr>
				<th width="100" height="50">留言内容</th>
				<td width="300" height="50"><%=data.get("content") %></td>
			</tr>
			<%
				if(data.get("replytime")!=null&&!data.get("replytime").equals("")){
			 %>
			<tr>
				<th width="100" height="50">回复内容</th>
				<td width="300" height="50"><%=data.get("replycontent") %></td>
			</tr>
			<tr>
				<th width="100" height="50">回复时间</th>
				<td width="300" height="50"><%=data.get("replytime") %></td>
			</tr>
			<%
			}
			 %>
		</table>
	</form>
	</div>
 </body>
</html>
