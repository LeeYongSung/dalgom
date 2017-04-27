package com.java;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/FileServlet")
public class FileServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int size = 1024 * 1024 * 10; // 10Mbyte
		String file = "";
		String oriFile = "";
		String path = request.getRealPath("Files");
		String path2 = "E:\\IDE\\workspace\\Exam0320\\WebContent\\Files";
		
		String type = "";
		String file_size = "";
		
		try {
			System.out.println(path + path2);
			MultipartRequest multi = new MultipartRequest(request, path2, size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			String str = files.nextElement().toString();
			
			file = multi.getFilesystemName(str);
			oriFile = multi.getOriginalFileName(str);
			
//			String[] array = file.split(".");
			
			int lastIndex = file.lastIndexOf(".");
			
			type = file.substring(lastIndex + 1, file.length()); // file.substring(시작위치, 끝나는위치)
			System.out.println();
			
//			File f = multi.getFile(str);
//			file_size = f.length() + "";
			file_size = multi.getFile(str).length() + "";
			
			System.out.println("file : " + file );
			System.out.println("oriFile : " + oriFile);
			
			String url = "/Exam0320/Files/" + file;
			HttpSession s = request.getSession();
			s.setAttribute("url", url);
			
			DAO dao = new DAO();
			dao.Insert(url, file, type, file_size);
			response.sendRedirect("index.jsp");
			
			try {
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
