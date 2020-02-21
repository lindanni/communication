package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BaseDAO;
import com.dao.NewsDAO;

public class AddWenjianServlet extends HttpServlet {
	//处理GET请求的方法
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //调用doPost方法进行处理
		doPost(request,response);
	}

	//处理POST请求的方法（实现新闻内容的保存）
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session=request.getSession();
	    //进行登录页验证，防止没有登录直接进入此页面
	    String username=(String)session.getAttribute("username");
	    if(username!=null && !username.equals("")){
			HttpSession session1=request.getSession();
	    	request.setCharacterEncoding("utf-8");
	        String title=request.getParameter("title");
	        String wjurl=request.getParameter("wjurl");
	        String typeid=request.getParameter("typeid");
	        String majorid=request.getParameter("majorid");
	        String teacherid=(String)session1.getAttribute("teacherid");
	        String uptime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	        //调用DAO层
	        BaseDAO dao=new BaseDAO();
	        boolean status=dao.addOne("wenjian","title='"+title+"',wjurl='"+wjurl+"',typeid='"+typeid+"',majorid='"+majorid+"',uptime='"+uptime+"',teacherid='"+teacherid+"'");
	   
	        //设置Servlet返回数据的编码为“UTF-8”
	        response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
	        if(status==true){
	        	out.println("1");
	        }else{
	        	out.println("0");
	        }
			out.flush();
			out.close();
	
	    } 	
		
	}

}
