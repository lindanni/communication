<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
BaseDAO dao=new BaseDAO();
String wenjianid=request.getParameter("wenjianid");
Map<String,String> data=dao.getOneByWhere("*","wenjian","wenjianid="+wenjianid);
Map<String,Object> data2=dao.getAll("*", "majorname", "", "majorid desc", 0, 999);
List<Map<String,String>> majornames=(List<Map<String,String>>)data2.get("records");
request.setAttribute("majornames", majornames); 
Map<String,Object> data1=dao.getAll("*", "typename", "", "typeid desc", 0, 999);
List<Map<String,String>> typenames=(List<Map<String,String>>)data1.get("records");
request.setAttribute("typenames", typenames); 
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
		background: url("images/kuang.png")0 0 no-repeat;
		height:400px;
		margin:10px auto;
		background-size:100% 100%;
		border:1px solid black;
		border-radius:10px;
		}
		form{
			width:80%;
			height:250px;
			margin-top:120px;
			margin-left:100px;
			color:#444;
			border-radius:10px;
			border-style:solid;
	}
	td,th{
		width:280px;
		height:30px;
		border:0.5px dashed black;
		
	}
		input{
		width:300px;
		height:30px;
		margin-left:20px;
		border:1px solid #444;
		border-radius:10px;
		}

		 #tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  color:red;
	  margin-left:340px;
   }
	</style>
  </head>
  
  <body>
  <div id="main">
    <form id="form1">
		<table cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th width="100" height="40">标题</th>
				<td width="400" height="40">
					<input type="text" id="title" name="title" value="<%=data.get("title")%>"/>
				</td>
			</tr>
			<tr>
				<th width="100" height="40">专业</th>
				<td width="400" height="40">
					<select id="major" name="major">
						<c:forEach items="${majornames}" var="c">
					         <option value="${c.name}" <c:if test="${c.majorid==r.majorid}">selected='selected'</c:if> >${c.name}</option>
					    </c:forEach>
					</select>
				<%=data.get("major") %></td>
			</tr>
			<tr>
				<th width="100" height="40">文件类型</th>
				<td width="400" height="40">
					<select id="typename" name="typename" >
						<c:forEach items="${typenames}" var="c">
			        		<option value="${c.name}" <c:if test="${c.typeid==r.typeid}">selected='selected'</c:if> >${c.name}</option>
			    		</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<input type="hidden" id="wenjianid" name="wenjianid" value="<%=data.get("wenjianid") %>"/>
				<a id="edit" name="edit" href="javascript:void(0)" >保存</a>
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
				     success: function(data){
				    $("#buttom").html(data);
				     }
				});
	 	  });
	});
	</script>
  </body>
</html>
