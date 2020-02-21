package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BaseDAO;

public class UpdateZlServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session=request.getSession();
	    //进行登录页验证，防止没有登录直接进入此页面
	    String username=(String)session.getAttribute("username");
	    if(username!=null && !username.equals("")){
	    	request.setCharacterEncoding("utf-8");
	        String title=request.getParameter("title");
	        String majorid=request.getParameter("majorid");
	        String typeid=request.getParameter("typeid");
	        String wjurl=request.getParameter("wjurl");
	        String wenjianid=request.getParameter("wenjianid");
	        System.out.print(title);
	        System.out.print(majorid);
	        System.out.print(typeid);
	        System.out.print(wjurl);
	        System.out.print(wenjianid);
	        //调用DAO层
	        BaseDAO dao=new BaseDAO();
	        boolean status=dao.updateOne("wenjian","title='"+title+"',majorid='"+majorid+"',typeid='"+typeid+"',wjurl='"+wjurl+"' where wenjianid="+wenjianid);

	        
	        
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
