package com.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;

import sun.misc.BASE64Encoder;

public class Download {
	public static void download(HttpServletRequest request,
			HttpServletResponse response, String filename) throws IOException,
			FileNotFoundException {
		//获取要下载的文件的物理路径
		request.setCharacterEncoding("utf-8");
		String filepath = request.getSession().getServletContext().getRealPath("/")+filename;
		//    /vedio/1.mp3
		int index = filename.lastIndexOf("/");
		if(index!=-1)
			filename = filename.substring(index+1);//获取文件名
		System.out.println(filename);
		
		// 为了使下载框中显示中文文件名称不出乱码！
		String framename = filenameEncoding(filename, request);
		
		
		String contentType = request.getSession().getServletContext()
				.getMimeType(filename);//通过文件名称获取MIME类型
		String contentDisposition = "attachment;filename=" + framename;//为了显示下载框
		// 输入流
		FileInputStream input = new FileInputStream(filepath);
		
		//设置头
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Disposition", contentDisposition);
		
		// 获取绑定了响应端的流（输出流）
		ServletOutputStream output = response.getOutputStream();
		
		IOUtils.copy(input, output);//把输入流中的数据写入到输出流中。
		
		input.close();
	}

	

	// 用来对下载的文件名称进行编码的！
		public static String filenameEncoding(String filename, HttpServletRequest request) throws IOException {
			String agent = request.getHeader("User-Agent"); //获取浏览器
			if (agent.contains("Firefox")) {
				//如果是火狐浏览器，则对文件名进行base64编码
				BASE64Encoder base64Encoder = new BASE64Encoder();
				filename = "=?utf-8?B?"
						+ base64Encoder.encode(filename.getBytes("utf-8"))
						+ "?=";
			}  else {
				//其它都使用URLEncoder进行编码
				filename = URLEncoder.encode(filename, "utf-8");
			}
			filename = filename.replace("+", "%20");  //以上编码会将空格转为+，这里再转回来
			return filename;
		}
}
