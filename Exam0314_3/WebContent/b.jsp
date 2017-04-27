<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>B</title>
</head>
<body>
	<%!
		String type, id, pw, nm, flag;
		List<HashMap<String, Object>> list;
		HashMap<String, Object> map;
		HttpSession s;
		
		String Url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String User = "java";
		String Password = "java";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query;
		
		public String setList(HttpSession session){
			try{
				boolean check = true;
				if(session.getAttribute("user") != null){
					list = (List<HashMap<String, Object>>) session.getAttribute("user");
					for(int i = 0; i < list.size(); i++){
						if(list.get(i).get("id").equals(id)){
							check = false;
							break;
						}
					}
				}
				if(check){
					map = new HashMap<String, Object>();
					map.put("id", id);
					map.put("pw", pw);
					map.put("nm", nm);
					list.add(map);
					s.setAttribute("user", list);
					flag = "Y";
				}else{
					flag = "N";
				}
			}catch(Exception e){
				e.printStackTrace();
				flag = "N";
			}
			return flag;
		}
	%>
	<%
		type = request.getParameter("type");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		list = new ArrayList<HashMap<String, Object>>();
		s = request.getSession();
		
		response.setContentType("text/html; charset=UTF-8");
		
		if("A".equals(type)){
// 			nm = request.getParameter("nm");
// 			flag = setList(s);
// 			response.sendRedirect("c.jsp?type="+type+"&flag="+flag);

		/* DB 연결  시작*/
		
			nm = request.getParameter("nm");
		
			
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
            } catch (ClassNotFoundException e) {
                    e.printStackTrace();
            }
            
            try{
                conn = DriverManager.getConnection(Url, User, Password);
                stmt = conn.createStatement();
            	
                query = "SELECT COUNT(*) AS CNT FROM J_USER WHERE J_ID = '" + id + "'";
                
                // 중복 확인
                rs = stmt.executeQuery(query);
                while(rs.next()){
                	if(rs.getInt(1) == 0){
                		flag = "Y";
                	}else{
                		flag = "N";
                	}
                }
				
                if("Y".equals(flag)){
                	query = "INSERT INTO J_USER (J_ID, J_PW, J_NM) VALUES";
                    query += "('"+ id + "', '" + pw + "', '" + nm + " ')";
                    // 사용자 등록
                    stmt.executeQuery(query);
                    response.sendRedirect("c.jsp?type="+type+"&flag="+flag);
                }else{
                	response.sendRedirect("a.jsp?key=n");
                }
                
            }catch(Exception e){
                e.printStackTrace();
            }finally{
                try{
                       //rs.close();
                    stmt.close();
                    conn.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
		
            
		/* DB 연결 종료*/

		}else if("B".equals(type)){
			 query = "select J_ID, ";
		     query += "      J_PW, ";
		     query += "      J_NM  ";
		     query += "from  J_USER ";
		     query += "where J_ID = '" + id + "' ";
		     query += "and   J_PW = '" + pw + "' ";
		     
			try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			
			try {
				conn = DriverManager.getConnection(Url, User, Password);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				flag = "";
				while(rs.next()){
 					id = rs.getString(1);
 					pw = rs.getString(2);
					nm = rs.getString(3);
					flag = "Y";
				}

				if("Y".equals(flag)){
					s.setAttribute("nm", nm);
					response.sendRedirect("c.jsp?type="+type+"&id="+id+"&pw="+pw);
				}else{
					response.sendRedirect("a.jsp?key=ip");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
				   
// 			if(s.getAttribute("user") != null){
// 				list = (List<HashMap<String, Object>>) s.getAttribute("user");
// 				String check = "";
// 				for(int i = 0; i < list.size(); i++){
// 					if(list.get(i).get("id").equals(id)){
// 						if(list.get(i).get("pw").equals(pw)){
// 							nm = list.get(i).get("nm").toString();
// 							check = "Y";
// 							break;
// 						}else{
// 							check = "P";
// 							break;
// 						}
// 					}
// 				}
// 				if(check == "Y"){
// 					response.sendRedirect("c.jsp?type="+type+"&id="+id+"&pw="+pw+"&nm="+nm);
// 				}else if(check == "P"){
// 					response.sendRedirect("a.jsp?key=pw");
// 				}else {
// 					response.sendRedirect("a.jsp?key=id");
// 				}
// 			}else{
// 				response.sendRedirect("a.jsp?key=s");
// 			}
		}else{
			response.sendRedirect("a.jsp?key=e");
		}
	%>
</body>
</html>








