package com.java;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.Perf.GetPerfAction;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String check = request.getParameter("check");
		String title;
		String no;
		DAO dao = new DAO();
		System.out.println("--------");
		if("D".equals(check)){
			no = request.getParameter("no");
			dao.delBoard(no);
			System.out.println("--------");
		}else if("I".equals(check)){
			title = request.getParameter("title");
			dao.InsertBoard(title);
		}else if("U".equals(check)){
			title = request.getParameter("title");
			no = request.getParameter("no");
			dao.UpdateBoard(title, no);
		}
		
		response.sendRedirect("index2.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
