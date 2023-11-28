package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DbConnection;
import com.dao.userDao;
import com.entity.User;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("name");
			String qual=req.getParameter("qual");
			String email=req.getParameter("email");
			String pwd=req.getParameter("pwd");
			
			userDao dao=new userDao(DbConnection.getcon());
			
			User u=new User(name,email,pwd,qual,"User");
			boolean f=dao.add_user(u);
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("succMsg", "registration successfully");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("succMsg", "registration unsuccessfully");
				resp.sendRedirect("signup.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	
}
