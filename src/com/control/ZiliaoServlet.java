package com.control;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




public class ZiliaoServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		//进行登录页验证，防止没有登录直接进入此页面
		String username=(String)session.getAttribute("username");
		if(username!=null && !username.equals("")){
		request.setCharacterEncoding("utf-8");
		try {
			//创建一个文件上传“工厂”
			FileItemFactory factory = new DiskFileItemFactory();
			//通过“工厂”来获得一个文件上传处理器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解析浏览器中的所有文件列表
			List items = upload.parseRequest(request);

			String message="";
			//将文件列表转为迭代器
			Iterator iter = items.iterator();
			while (iter.hasNext()) { //循环处理所有上传的文件
			    FileItem item = (FileItem) iter.next();

			    if (item.isFormField()) {
			    } else { //
			         //获得字段的名字
			    	 //String fieldName = item.getFieldName();
			    	 //获得文件的名字
			    	 String fileName = item.getName();
			    	 fileName=fileName.toString().replace("-","");
			    	 //获得文件类型
			    	 String contentType = item.getContentType();
			    	 //System.out.print("上传文件的类型为："+contentType);
			    	 //boolean isInMemory = item.isInMemory();
			    	 //获得文件的大小 
			    	 long sizeInBytes = item.getSize();
			    	 //获得网站根目录
			    	 String webroot=request.getSession().getServletContext().getRealPath("/");   	 
			    	 //获取当前时间
			    	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			    	 //文件的上传目录
			    	 String filedir=webroot+"uploadziliao"+"/"+now;
			    	 
			    	 //如果上传文件的目录不存在，则创建
			    	 File imgdir=new File(filedir);
			    	 if(!imgdir.exists()){
			    		 imgdir.mkdirs();
			    	 }
			    	 
			    	 //获取上传文件的后缀
			    	 String suffix=fileName.substring(fileName.lastIndexOf("."));	
			    	 //System.out.println("文件名的后缀为："+suffix);
			    	 
			    	 //对上传文件的类型进行判断，只允许指定格式的文件上传
			    	 if(!suffix.equalsIgnoreCase(".mp3") &&! suffix.equalsIgnoreCase(".avi") &&! suffix.equalsIgnoreCase(".mp4") &&!suffix.equalsIgnoreCase(".mkv") && !suffix.equalsIgnoreCase(".mov")){
			    		 //用当前时间来命名上传文件的名字
				    	 String lasttime=new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());;
				    	 
				    	 //文件在数据库中保存路径
				    	 String filepath="uploadziliao"+"/"+now+"/"+lasttime+suffix;
				    	 
				    	 request.setAttribute("filepath", filepath);
				    	 request.setAttribute("fileName", fileName);
							request.setAttribute("contentType",contentType);
							request.setAttribute("sizeInBytes", sizeInBytes);
				    	 
				    	 //进行文件的上传
				    	 File uploadedFile = new File(filedir+"/"+lasttime+suffix);
				    	 item.write(uploadedFile); 
				    	 
				    	 message="<div style='color:red'>上传成功</div>";
				    	 
			    	 }else{
			    		 message="<div style='color:red'>资料类型非法</div>";
			    	 }	  	
			    	
			    }
			}
			response.setContentType("text/html;charset=utf-8");
			request.setAttribute("message", message);
			request.getRequestDispatcher("upziliao.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}
		
	}
	
	
	
}

