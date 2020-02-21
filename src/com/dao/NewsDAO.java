package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//新闻DAO
public class NewsDAO {	
	//添加新闻
	 public boolean addNews(String newstitle,String author,String adddate,String classname,String content){
		 //模拟添加新闻的流程，假设：发布人为：朱强，则发布成功，否则就发布失败
		 if(author.equals("朱强")){
			 return true;
		 }else{
			 return false;
		 }
	 }
	 
	 //查询所有新闻
	 public List<Map<String,String>> listNews(){
		 //模拟查询新闻，这里直接构造新闻2条记录数据
		 //List<Map<String,String>>是用来存储新闻列表集合
		 List<Map<String,String>> records=new ArrayList<Map<String,String>>();
		 // Map<String,String>用来存储一条新闻记录
		 Map<String,String> record1=new HashMap<String,String>();
		 record1.put("newstitle", "我校开展新教师工作坊2017年第4期活动");
		 record1.put("author", "教师发展中心");
		 record1.put("adddate", "2017-10-31");
		 record1.put("classname", "信商要闻");
		 records.add(record1);//将记录加入列表集合中
		 
		 Map<String,String> record2=new HashMap<String,String>();
		 record2.put("newstitle", "信息技术系开展“无手机课堂”活动");
		 record2.put("author", "信息技术系");
		 record2.put("adddate", "2017-11-01");
		 record2.put("classname", "校园生活");
		 records.add(record2);//将记录加入列表集合中
		 
		 return records; 
	 }

}
