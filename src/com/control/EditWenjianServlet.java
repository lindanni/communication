package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BaseDAO;

public class EditWenjianServlet extends HttpServlet {

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
	         String wenjianid=request.getParameter("wenjianid");
	         BaseDAO dao=new BaseDAO();
	         Map<String,String> r=dao.getOneByWhere("a.*,b.typename,c.majorname", "wenjian a,typename b,majorname c", "a.typeid=b.typeid and a.majorid=c.majorid and a.wenjianid="+wenjianid);
		     request.setAttribute("r", r);
		    
		     request.getRequestDispatcher("scwj.jsp").forward(request, response); 	
	    }
		
			
	}
		
	}

