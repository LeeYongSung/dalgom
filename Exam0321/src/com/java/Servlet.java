package com.java;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class Servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionDo(request, response);
	}
	
	private void ActionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MybatisDAO mdao = new MybatisDAO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("No", request.getParameter("No"));
		map.put("Name", request.getParameter("Name"));
		map.put("Desc", request.getParameter("Desc"));
		map.put("DelYn", request.getParameter("DelYn"));
		
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String connPath = request.getContextPath();
		String com = uri.substring(connPath.length());
		
		if("/insertTemp.do".equals(com)){
			mdao.insertTemp(map);
		}else if("/deleteTemp.do".equals(com)){
			mdao.deleteTemp(map);
		}else if("/updateTemp.do".equals(com)){
			mdao.updateTemp(map);
		}
		
		response.sendRedirect("index.jsp");
	}

}
