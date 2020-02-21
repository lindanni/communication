<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
BaseDAO dao=new BaseDAO();
Map<String,Object> data=dao.getAll("*", "majorname", "", "majorid desc", 0, 999);
List<Map<String,String>> majornames=(List<Map<String,String>>)data.get("records");
request.setAttribute("majornames", majornames); 
Map<String,Object> data1=dao.getAll("*", "typename", "", "typeid desc", 0, 999);
List<Map<String,String>> typenames=(List<Map<String,String>>)data1.get("records");
request.setAttribute("typenames", typenames); 
%>

<!DOCTYPE html>
<html>
<head>
	<title>教师页面下面</title>
	<style>
		#main{
		width:100%;
		//background: url("images/xx.png")0 0 no-repeat;
		background-color:#444;
		height:600px;
		margin:10px auto;
		background-size:100% 100%;
		border:1px solid black;
		border-radius:10px;
		}
		#form2{
			width:90%;
			height:400px;
			margin-top:52px;
			margin-left:110px;
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
	#url{
		position:absolute;
		overflow:hidden;
		right:0;
		top:0;
		opacity:0;
	}
   .file {
	    display: inline-block;
	    background: #fff;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #444;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 25px;
	    margin-top:10px;
	    margin-left:20px;
	}
	.file input {
	    display:none;
	}
	.file:hover {
	    background:#444;
	    border-color: #78C3F3;
	    color: #fff;
	    text-decoration: none;
	}
		 #tipinfo{
	  width:200px;
	  height:50px;
      text-align:center;  
	  font-size:14px;
	  color:red;
	  margin-left:350px;
	  margin-top:25px;
   }
   a{
   		color:#fff;
   		font-weight:bold;
   		margin-left:500px}
	</style>
	<script src="jquery-1.11.3.min.js"></script>
</head>
<body>
	<div id="main">
		<span>上传资料</span>
		<form id="form2" name="form2"  action="" method="post">
			<table cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th width="100" height="50">文件标题</th>
				<td width="500" height="50"><input type="text" name="title" 
				id="title" value="${r.title}"/></td>
			</tr>
			<tr>
				<th width="100" height="50">上传类型</th>
				<td width="500" height="50">
					<select id="typeid" name="typeid">
						<c:forEach items="${typenames}" var="c">
			        		<option value="${c.typeid}" <c:if test="${c.typeid==r.typeid}">selected='selected'</c:if> >${c.typename}</option>
			    		</c:forEach>
			</select>
				</td>
			</tr>
			<tr>
				<th width="100" height="50">上传资料</th>
			       <td  width="400">
			       			<a  href="#" class="file" onclick="aa();">选择要上传的文件
			       				<input type="file" id="file" name="file" />
				       		</a><br/>
				        <input type="hidden" id="wjurl" name="wjurl" value="${filepath}" />
				        <input type="hidden" id="editurl" name="editurl" value="${r.wjurl}" />
				        <div style="width:400px;height:150px;margin-top:10px;margin-left:20px" id="imgcontainer">
				        <c:if test="${r.wenjianid!=null}">
				        	${r.wjurl}
				        </c:if>

				        </div>
				  </td>
			</tr>
			<tr>
				<th width="100" height="50">所属专业</th>
				<td width="500" height="50">
					<select id="majorid" name="majorid">
						<c:forEach items="${majornames}" var="c">
					            <option value="${c.majorid}" <c:if test="${c.majorid==r.majorid}">selected='selected'</c:if> >${c.majorname}</option>
					        </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50">
				<input type="hidden" id="wenjianid" name="wenjianid" value="${r.wenjianid}"/>
				<a href="javascript:void(0);" id="upzl" name="upzl">保存</a>
				</td>
			</tr>
		</table>
		</form>
		<div id="tipinfo"></div>
	</div>
	<script src="jquery-1.11.3.min.js"></script>
      <script type="text/javascript">
     	function aa(){
   		var file=document.getElementById("file");
     	var typeid=document.getElementById("typeid").value;
        if(file.value==null ||file.value==""){
        if(typeid==1)
        {
        	 window.open('upvideo.jsp','newwindow','height=400px,width=600px,top=100px,left=400px');
        }else if(typeid==2){
        	 window.open('upziliao.jsp','newwindow','height=400px,width=600px,top=100px,left=400px');
        }else if(typeid==3){
        	 window.open('uptest.jsp','newwindow','height=400px,width=600px,top=100px,left=400px');
        }
      	}
      }	  
	</script>
		<script type="text/javascript">
	  	$(function(){ 
		$("#upzl").bind("click",function(){  
		   //文件标题
		   var title=$("#title");
		   if($.trim(title.val()).length==0){
				$("#tipinfo").html("文件标题不能为空！");
				title.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		   var wjurl=$("#wjurl");
		   if($.trim(wjurl.val()).length==0){
				$("#tipinfo").html("文件路径不能为空！");
				wjurl.focus();
				return;
		   }else{
				$("#tipinfo").html("");
		   }
		    var wenjianid=$("#wenjianid").val();
		   var url="addWenjianServlet";
		   if(wenjianid!=null && wenjianid!=""){
				url="updateZlServlet";			
		  }
		   var wjurl=$("#wjurl");
		   var editurl=$("#editurl");
		 	if(wjurl.val()==null||wjurl.val()==""){
		  		wjurl=editurl;
		  }
		   //验证通过后，用AJAX提交请求
		   $.ajax({
				 type: 'POST',
				 url: url,
				 data: {
					title:$.trim(title.val()),
					wjurl:$("#wjurl").val(),
					typeid:$("#typeid").val(),
					majorid:$("#majorid").val(),
					wenjianid:$("#wenjianid").val(),
				 },
				 success: function(data) {
					  //data代表服务端返回的数据
					  if($.trim(data)=="1"){//添加成功
							//设置提示信息为绿色
							$("#tipinfo").css("color","#fff");
							if(wenjianid==null || wenjianid==""){
								$("#tipinfo").html("添加文件信息成功");
							}else{
								$("#tipinfo").html("修改文件信息成功");
							}
							      
							//等待3秒后，重新用AJAX加载“添加新闻”页面
							setTimeout('shuaxin()',1500);

					  }else{//添加失败
					     if(wenjianid==null || wenjianid==""){
						   $("#tipinfo").html("添加文件信息失败");
						 }else{
						   $("#tipinfo").html("修改文件信息失败"); 
						 } 
						 setTimeout('shuaxin()',1500);
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
