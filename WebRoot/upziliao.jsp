<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>图片上传页面</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<style type="text/css">
		     body{
			    font-family:'微软雅黑';
			 }
			 td{
			 	border:1px solid #fff;
			 }
		     .biao{
			    font-size:14px;
				text-align:center;
				background-color:#444;
				border-spacing:1px;
				color:#fff;
			 }
		    .biaotou{
			    background-color:#444;
			    height:45px; 
				width:100px;
			 }
			 .neirong{
			    background-color:#ffffff;
				height:45px;
				color:#444;
			 }
			a {text-decoration: none;}
		   .btn-green{
			  display:inline-block;
			  font-size:16px;     
			  color:#FFF;         
			  width:100px;        
			  height:30px;         
			  line-height:30px;   
			  border:1px solid #6CAE0C;
			  text-align:center;
			  font-family:'Microsoft YaHei';
			  background-color: #444; 
			  background-image: -webkit-gradient(linear,0% 0%, 0% 100%, from(#80C51A),to(#66AB00));
		   }  
		   .btn-green:hover{
			   cursor:pointer;
			   background-color: #fff;
			   background-image: -webkit-gradient(linear,0% 0%, 0% 100%, from(#66AB00),to(#80C51A));
		   } 
		   .biaoti{
		       text-align:center;
			   margin:30px auto;
			   font-size:18px;
		   }
		   input{
		      width:90%;
			  height:28px;
		   }
		   #tipinfo{
		      text-align:center;  
			  margin-top:30px;
			  font-size:14px;
			  color:red;
		   }
		   
		   
		   /**下面是文件图片上传按钮的样式*/
		   .file {
			    position: relative;
			    display: inline-block;
			    background: #444;
			    border: 1px solid #99D3F5;
			    border-radius: 4px;
			    padding: 4px 12px;
			    overflow: hidden;
			    color: #1E88C7;
			    text-decoration: none;
			    text-indent: 0;
			    line-height: 25px;
			}
			.file input {
			    position: absolute;
			    font-size: 100px;
			    right: 0;
			    top: 0;
			    opacity: 0;
			}
			.file:hover {
			    background: #fff;
			    border-color: #78C3F3;
			    color: #004974;
			    text-decoration: none;
			}
		   
		</style>
		<script src="jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
	       //将上传后的文件路径从子页面传回到父页面
		   function setUploadFile(){
	            var filepath=document.getElementById("filepath");
	            var wjurl=window.opener.document.getElementById("wjurl");
	            wjurl.value=filepath.value;
	            
	            //在父页面显示图片
	             if(filepath!=""&&filepath!=null){
	            var imgcontainer=window.opener.document.getElementById("imgcontainer");
	            imgcontainer.innerHTML="<table><tr><td width=200>文件名： </td><td width=100>大小：</td><td width=100>格式：</td></tr><tr><td width=200>${fileName}</td><td width=150>${sizeInBytes}</td><td width=150>${contentType}</td></tr></table>";
	            }
	            //关闭窗口
	            window.close();
	       }
      
	       //确认开始上传
	       function upload(){
	         if(document.getElementById("file").value==null || document.getElementById("file").value==""){
	             alert('请选择要上传的资料');
	         }else{
	            //提交表单
	            document.getElementById("form2").submit();
	         }
	       }
	       
	       
	       $(function(){ 
			      $(".file").on("change","input[type='file']",function(){
					   //图片上传
					   upload();
				  });
	       });
	       
		  
	  
	</script>
		
    </head>
    <body>
	   <p class="biaoti">资料上传<p>
	   
	    <form id="form2" name="form2" action="ziliaoServlet" method="post" enctype="multipart/form-data">
	   
	   <table align="center" width="500" border="0" cellpadding="0" cellspacing="0" class="biao">	
	              <tr>
					<td class="biaotou">资料：</td>
					<td class="neirong" colspan="2">
					   
					   
						<a href="javascript:;" class="file">
						    <input type="file" id="file" name="file">点击这里上传资料
						</a>
					   
					    
					    <input type="hidden" id="filepath" name="filepath" value="${filepath}" /> 
					    
					</td>
	              </tr>
				 <tr>
				  <c:if test="${filepath eq null}">
				 </c:if>
					<td>文件名： </td>
					<td>大小：</td>
					<td>格式：</td>
	              </tr>
				 <tr>
				 		 <c:if test="${filepath eq null}">
				 		</c:if>
				 		<td>${fileName}</td>
				 		<td>${sizeInBytes}</td>
				 		<td>${contentType}</td>
				 </tr>
				 
				  <tr>
					<td class="neirong" colspan="3">
					    <a href="javascript:setUploadFile();" class="btn-green">确&nbsp;定</a>
					</td>
	              </tr>	
		</table>
		
		</form>
			
        <!-- 提示信息显示区 -->
        <div id="tipinfo">${message}</div>		
    </body>
</html>