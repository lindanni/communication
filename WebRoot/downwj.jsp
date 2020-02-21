<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			font-family:"楷体";
			text-align:center;
			margin-top:20px;
			border-style:none none;
		}
		form th,form td{border-style:none none;}
		input{
		width:150px;
		height:20px;
		margin-left:20px;
		border:1px solid #fff;
		border-radius:10px;
		}
		#table1{
			width:60%;
			margin-top:20px;
			margin-left:100px;
			color:#fff;
			border-radius:10px;
			border-style:solid;
			font-family:"楷体";
			font-size:14px;
			text-align:center;
			position:absolute;
	}
	td,th{
		
		color:#fff;
		border:1px solid #fff;
		border-style:solid none;
	}
	th{
		font-family:bold;
	}
	#wenjian{
		margin-top:100;
		margin-left:100px;
	}
	a{
		color:#fff;
	}
	#but{
		width:500px;
		height:30px;
		position:relative;
		top:300px;
		left:140px;
		color:#fff;
	}
        </style>
        <script src="jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
		$(function(){
		   $("#wenjianSearchBtn").bind("click",function(){  
		   $.ajax({
				 type: 'post',
				 url: 'downWjServlet' ,
				 data: $('#wenjian').serialize(),
				 success: function(data) {
					  //将“添加新闻”页面的内容插入到页面的“主区域”
					  $("#buttom").html(data);
				 }
				});
			});
		});
			function toPage2(page,url){
			$.ajax({
					 type: 'POST',
					 url: url+"?curpage="+page ,
					 data: $('#wenjian').serialize(),
					 success: function(data) {
						  $("#buttom").html(data);
					 }
			});
		
		}
		
		//通用的发起无参数AJAX请求的方法
		function down(url,method){
			$.ajax({
					 type: method,
					 url: url ,
					 success: function(data) {
						  $("#buttom").html(data);
					 }
			});
		}
		function bf(){
			 window.open('video.html','newwindow','height=300px,width=300px,top=100px,left=400px');
		}
		</script>	
    </head>
    <body>
	   <div id="main">
	   <form  id="wenjian" method="post" action="">
	   <table border="0" cellpadding="0"  cellspacing="0">	
           <tr>
			 <td width="100" height="30">标题</td>
			 <td width="100" height="30">
			 	<input type="text" name="title" id="title" value="${title}"></td> 
			 <td width="100" height="30">  
			  	<input type="hidden" name="curpage" value="" />
			   	<a href="javascript:void(0);" id="wenjianSearchBtn">搜&nbsp;索</a>
			 </td>                   
           </tr>                  
	   </table>
	   </form>
       <table id="table1" border="0.5" cellpadding="0" cellspacing="0">	
	              <tr>
					<th width="100" height="40">标题</th>
					<th width="100" height="30">文件类型</th>
					<th width="100" height="30">上传者</th>
					<th width="150" height="30">上传时间</th>
	                <th width="100" height="30">操作</th>
	              </tr>
	              <c:forEach var="r" items= "${records}">
				  <tr>
					<td width="100" height="30">${r.title}</td>
					<td width="100" height="30">${r.typename}</td>
					<td width="100" height="30">${r.teachername}</td>
					<td width="150" height="30">${r.uptime}</td>
    				<td width="100" height="30" style="text-align:left">
    					<c:if test="${r.typeid eq '1'}">
    						<a href='<c:url value="/downWenjianServlet?wjurl=${r.wjurl}"/>'>下载</a>
    						<a href='#' onclick="bf();">播放</a>
    						 <input type="hidden" id="wjurl" name="wjurl" value="${r.wjurl}" />
    					</c:if>		
						<c:if test="${r.typeid eq '2'|| r.typeid eq '3'}">
							<a  href='<c:url value="/downWenjianServlet?wjurl=${r.wjurl}"/>'>下载</a>
						</c:if>
    				</td>
	              </tr>
				 </c:forEach>
		</table>
		
		<div align="center" id="but" style="font-size:14px">
		  
		  
		  共找到${totalCount}条记录，当前第${curpage}页，共有${totalPage}页，每页${pageSize}条记录
		  
		  &nbsp;&nbsp;
		  <c:if test="${curpage=='1'}">
		     首页
		  </c:if>
		  <c:if test="${curpage!='1'}">
		     <a href="javascript:toPage2('1','downWjServlet')">首页</a>
		  </c:if>   
		  <c:if test="${curpage=='1'}">
		     上一页 
		  </c:if>
		  <c:if test="${curpage!='1'}">
		     <a href="javascript:toPage2('${curpage-1}','downWjServlet')">上一页</a> 
		  </c:if> 
		  <c:if test="${curpage==totalPage}">
		     下一页 
		  </c:if>
		  <c:if test="${curpage!=totalPage}">
		     <a href="javascript:toPage2('${curpage+1}','downWjServlet')">下一页</a> 
		  </c:if>
		     
		  <c:if test="${curpage==totalPage}">
		     尾页
		  </c:if>
		  <c:if test="${curpage!=totalPage}">
		     <a href="javascript:toPage2('${totalPage}','downWjServlet')">尾页</a>
		  </c:if>   
		</div>
		</div>			
    </body>
</html>