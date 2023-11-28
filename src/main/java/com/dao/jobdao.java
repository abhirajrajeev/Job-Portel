package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.jobs;

public class jobdao {

	private Connection con;

	public jobdao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJobs(jobs j) {
		boolean f = false;
		try {
			String sql = "insert into job(title,description,category,status,location)values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<jobs> getAlljobs() {
		List<jobs> list = new ArrayList<jobs>();
		jobs j = null;

		try {
			String sql = "select * from job order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setPdate(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));

				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<jobs> getAlljobsForUser() {
		List<jobs> list = new ArrayList<jobs>();
		jobs j = null;

		try {
			String sql = "select * from job where status=? order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setPdate(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));

				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public jobs getjobsbyID(int id) {

		jobs j = null;

		try {
			String sql = "select * from job where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setPdate(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return j;

	}

	public boolean updateJob(jobs j) {
		boolean f = false;
		try {
			String sql = "update job set title=?,description=?,category=?,status=?,location=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean deleteJobs(int id) {
		boolean f = false;

		try {
			String sql = "delete from  job where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<jobs> getJobsAndLocationAndCate(String category, String location) {
		List<jobs> list = new ArrayList<jobs>();

		jobs j = null;
		try {
			String sql = "select * from job where category=? and location=? order by id DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, location);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setLocation(rs.getString(7));
				j.setStatus(rs.getString(6));
				j.setPdate(rs.getString(5));
				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<jobs> getJobsORLocationAndCate(String category, String location) {
		List<jobs> list = new ArrayList<jobs>();

		jobs j = null;
		try {
		String sql = "select * from job where category=? or location=? order by id DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, category);
		ps.setString(2, location);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
		j = new jobs();
		j.setId(rs.getInt(1));
		j.setTitle(rs.getString(2));
		j.setDescription(rs.getString(3));
		j.setCategory(rs.getString(4));
		j.setLocation(rs.getString(7));
		j.setStatus(rs.getString(6));
		j.setPdate(rs.getString(5));
		list.add(j);

		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	

}
