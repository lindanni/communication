package com.control;


import java.io.FileNotFoundException;
import java.io.IOException;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.Download;



public class DownWenjianServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
	    //进行登录页验证，防止没有登录直接进入此页面
	    String username=(String)session.getAttribute("username");
	    if(username!=null && !username.equals("")){
		/*
		 * 下载文件
		 */
		//获取文件相对路径
		//处理get请求中的中文乱码问题
		String wjurl = request.getParameter("wjurl");
		wjurl = new String(wjurl.getBytes("iso-8859-1"),"utf-8");
		Download.download(request, response, wjurl);
	    }
		
	}
}


