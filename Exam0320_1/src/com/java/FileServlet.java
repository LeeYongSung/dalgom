package com.java;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FileServlet")
public class FileServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int size = 1024 * 1024 * 10; // 10M
		String file = "";
		String oriFile = "";
		String path = request.getRealPath("Files");
		String path2 = "E:\\IDE\\workspace\\Exam0320\\WebContent\\Files";
		
		String type = "";
		String file_size = "";
		
		try {
			System.out.println("path : " + path + ", path2 : " + path2);
			MultipartRequest multi 
			= new MultipartRequest(request, path2, size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			String str = files.nextElement().toString();
			
			file = multi.getFilesystemName(str);
			oriFile = multi.getOriginalFileName(str);
			
			int lastIndex = file.lastIndexOf(".");
			type = file.substring(lastIndex + 1, file.length());
			
//			File f = multi.getFile(str);
//			file_size = f.length() + "";
			file_size = multi.getFile(str).length() + "";
			
			String url = "/Exam0320/Files/" + file;
			
			DAO dao = new DAO();
			dao.Insert(url, file, type, file_size);
			
			try{
				Thread.sleep(3000);
			}catch (Exception e2){
				e2.printStackTrace();
			}
			
			response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
