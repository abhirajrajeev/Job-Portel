package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import com.DB.DbConnection;
import com.dao.userDao;
import com.entity.User;



@WebServlet("/login")
public class loginServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em=req.getParameter("email");
			String ps=req.getParameter("pwd");
			
			User u=new User();
			HttpSession session=req.getSession();
			
			if("admin@gmail.com".equals(em)&&"admin".equals(ps))
			{
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}
			else {
				userDao dao=new userDao(DbConnection.getcon());
				User user=dao.login(em, ps);
				
				if(user!=null)
				{
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				}
				else {
					session.setAttribute("succMsg", "Invalid email&password");
					resp.sendRedirect("login.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
