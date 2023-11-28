package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DbConnection;
import com.dao.jobdao;

@WebServlet("/delete")
public class deleteJob extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));

			jobdao dao = new jobdao(DbConnection.getcon());
			boolean f = dao.deleteJobs(id);
			HttpSession session = req.getSession();

			if (f = true) {
				session.setAttribute("succMsg", "job delete successfully added");
				resp.sendRedirect("view_job.jsp");
			} else {

				session.setAttribute("succMsg", "something went wrong");
				resp.sendRedirect("view_job.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
