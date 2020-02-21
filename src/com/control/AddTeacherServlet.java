package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BaseDAO;
import com.dao.NewsDAO;

public class AddTeacherServlet extends HttpServlet {
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
	    	
	    	request.setCharacterEncoding("utf-8");
	        String gno=request.getParameter("gno");
	        String teachername=request.getParameter("teachername");
	        String teacherpwd=request.getParameter("teacherpwd");
	        //调用DAO层
	        BaseDAO dao=new BaseDAO();
	        boolean status=dao.addOne("teacher","gno='"+gno+"',teachername='"+teachername+"',teacherpwd='"+teacherpwd+"'");
	   
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
