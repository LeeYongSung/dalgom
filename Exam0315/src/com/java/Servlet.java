package com.java;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = request.getParameter("check");
		DAO dao = new DAO();
		String title;
		if("D".equals(check)){
			String del = request.getParameter("DEL");
			dao.delete(del);
			System.out.println(del);
		} else if("I".equals(check)) {
			title = request.getParameter("title");
			dao.insert(title);
			System.out.println(title);
		} else if("U".equals(check)) {
			title = request.getParameter("title");
		}
//		else if("U".equals(check)) {
//			String upda = request.getParameter("upda");
//			String upda1 = request.getParameter("upda1");
//			dao.update(upda, upda1);
//			System.out.println(upda + " " + upda1);
//		}
		response.sendRedirect("index.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	} 

}
