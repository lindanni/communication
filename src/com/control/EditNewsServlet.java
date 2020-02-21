package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BaseDAO;

public class EditNewsServlet extends HttpServlet {

	
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
	         String newsid=request.getParameter("newsid");
	         BaseDAO dao=new BaseDAO();
	         Map<String,String> r=dao.getOneByWhere("a.*,b.name", "news a,classname b", " and a.classnameid=b.classnameid and a.newsid="+newsid);
		     request.setAttribute("r", r);
		     
		    
		     request.getRequestDispatcher("addNews.jsp").forward(request, response); 	
	    }
		
			
	}

}
