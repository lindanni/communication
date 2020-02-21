package com.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.BaseDAO;

public class UpZlServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request, response);
}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		request.setCharacterEncoding("utf-8");
		String teacherid=(String)session.getAttribute("teacherid");
		 BaseDAO dao=new BaseDAO();
		 String title=null;
		 String majorid=null;
		 String url=null;
		 String typeid=null;
		 boolean status=false;
		 String wenjianid=null;
		 String uptime=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss").format(new Date());
		//创建工厂对象
		DiskFileItemFactory factory=new DiskFileItemFactory();
		//通过工厂对象创建解析器
		ServletFileUpload sfu=new ServletFileUpload(factory);
		//解析request，获取FileItem的列表
		try {
			List<FileItem> items=sfu.parseRequest(request);
			//通过循环获取表单项
			for(FileItem item:items){
				//判断是否是普通表单项
				if(item.isFormField()){
					String name=item.getFieldName();//获取表单项的name
					String value=item.getString("utf-8");//获取表单项的值，utf-8防止中文乱码
					//System.out.println(name+":"+value);
					if(value==null||value.equals("")){
						
					}else{
					if(name.equals("title")){
						title=value;
					}else if(name.equals("majorid")){
						majorid=value;
					}else if(name.equals("typeid")){
						typeid=value;
					}else if(name.equals("wenjianid")){
						wenjianid=value;
					}}
				}else{
					String filename=item.getName();//获取文件名
					filename=filename.toString().replace("-","");
					int index=filename.indexOf("\\");
					if(index!=-1){
						filename=filename.substring(index+1);
					}
					//防止上传重名
					//上传路径
					String time=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
					String nowtime=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss").format(new Date());
					filename=nowtime+filename;
					String path="/wenjian/"+time+"/";
					url=path+filename;
					File file=new File(this.getServletContext().getRealPath(path+filename));
					if(!file.exists()){
						file.getParentFile().mkdirs();//创建上层目录
					}
					//保存
					item.write(file);
				}
			}
		} catch (FileUploadException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(wenjianid==null||wenjianid.equals("")){
			  status=dao.addOne("wenjian","title='"+title+"',majorid='"+majorid+"',url='"+url+"',typeid='"+typeid+"',teacherid='"+teacherid+"',uptime='"+uptime+"'");
			  if(status=true){
				  out.println("<script>alert('上传成功');window.location.href='teacher.jsp'</script>");
			  }else{
				  out.println("<script>alert('上传失败');window.location.href='scwj.jsp'</script>");
			  }
			  status=dao.updateOne("wenjian","title='"+title+"',majorid='"+majorid+"',typeid='"+typeid+"',url='"+url+"' where wenjianid="+wenjianid);
			  if(status=true){
				  out.println("<script>alert('编辑成功');window.location.href='teacher.jsp'</script>");
			  }else{
				  out.println("<script>alert('编辑失败');window.location.href='scwj.jsp'</script>");
			  }
		 }else{
			  status=dao.updateOne("wenjian","title='"+title+"',majorid='"+majorid+"',typeid='"+typeid+"',url='"+url+"' where wenjianid="+wenjianid);
			  if(status=true){
				  out.println("<script>alert('编辑成功');window.location.href='teacher.jsp'</script>");
			  }else{
				  out.println("<script>alert('编辑失败');window.location.href='scwj.jsp'</script>");
			  }
		 }
	   out.flush();
	   out.close();
}
}
