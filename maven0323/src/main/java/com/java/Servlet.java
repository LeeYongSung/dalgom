package com.java;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MybatisDAO mdao = new MybatisDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		HttpSession s = request.getSession();
		s.setAttribute("search", search);
		response.sendRedirect("google_search.jsp");
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
