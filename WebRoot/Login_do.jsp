<%@ page language="java" import="java.util.*,com.dao.*" pageEncoding="utf-8"%>
<%
  	request.setCharacterEncoding("utf-8");
//1.接收数据
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String role=request.getParameter("role");
//2.保存到数据库
	BaseDAO dao=new BaseDAO();
	Map<String,String> record=null;
	//主页面
	if(("学生").equals(role)){
		 if(dao.getOneByWhere("*","student"," sno='"+username+"' and studentpwd='"+password+"'")!=null){
			record=dao.getOneByWhere("*","student"," sno='"+username+"' and studentpwd='"+password+"'");
		 	session.setAttribute("studentname",record.get("studentname"));
		 	session.setAttribute("studentpwd",record.get("studentpwd"));
			session.setAttribute("studentid",record.get("studentid"));
			session.setAttribute("majorid",record.get("majorid"));
		 }
	}else if(("教师").equals(role)){
		 if(dao.getOneByWhere("*","teacher"," gno='"+username+"' and teacherpwd='"+password+"'")!=null){
		 	record=dao.getOneByWhere("*","teacher"," gno='"+username+"' and teacherpwd='"+password+"'");
		 	session.setAttribute("teachername",record.get("teachername"));
		 	session.setAttribute("teacherpwd",record.get("teacherpwd"));
			session.setAttribute("teacherid",record.get("teacherid"));
		 }
	}else if(("教务人员").equals(role)){
		if(dao.getOneByWhere("*","admin"," username='"+username+"' and adminpwd='"+password+"'")!=null){
			record=dao.getOneByWhere("*","admin","username='"+username+"' and adminpwd='"+password+"'");
			session.setAttribute("adminname",record.get("adminname"));
			session.setAttribute("adminid",record.get("adminid"));
			session.setAttribute("adminpwd",record.get("adminpwd"));
		}
	}
	if(record!=null)
	{
		session.setAttribute("role",role);
		session.setAttribute("username",username);
		out.println("1");
	}else{
		out.println("0");
	}
 %>