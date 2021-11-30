package DAO;

import java.sql.*;
import java.util.*;

import User.Post;



public class PostDAO {
	private  Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean AddNotes(String ti,String cont,int ui) {
		boolean f=false;
		try {
			String qu="insert into post(title,content,uid) values(?,?,?)";
			
			PreparedStatement ps= conn.prepareStatement(qu);
			ps.setString(1, ti);
			ps.setString(2,cont);
			ps.setInt(3,ui);
			System.out.println(ps+" ps");
			int i=ps.executeUpdate();
			//System.out.println(i+" iihhk");
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<Post> getData(int id){
		//System.out.print(id+" id is this ");
		
	List<Post>list = new ArrayList<>();
	Post po;
	try {
		String qu="select * from post where uid=? order by id DESC ";
		//System.out.println(qu);
		PreparedStatement ps= conn.prepareStatement(qu);
		ps.setInt(1, id);
		//System.out.println(ps);
		ResultSet rs= ps.executeQuery();
		System.out.println("result statement");
		System.out.println(rs);
		while(rs.next()) {
			po= new Post();
			po.setId(rs.getInt(1));
			po.setTitle(rs.getString(2));
			po.setContent(rs.getString(3)); 
			System.out.println(rs.getTimestamp(5));
			
			po.setPdate(rs.getTimestamp(5));
			list.add(po);
		
			
		}
	}catch (Exception e) {
		// TODO: handle exception
	}
	
	return list;
		
	}
	public Post getDataById(int id) {
		Post post=null;
		try {
			String qu= "select * from post where id =?";
			PreparedStatement ps= conn.prepareStatement(qu);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				post = new Post();
				post.setId(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setContent(rs.getString(3));
				 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
		
		
	}
	public  boolean PostUpdate(int Notesid,String title ,String content) {
		boolean f=false;
		try {
			String qu="update post set title=?,content=? where id=?";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, Notesid);
			int i=ps.executeUpdate();
			if(i==1)f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	public boolean deleteData (int notesId)	{
		boolean f=false;
		try {
			String qu="delete from post where id=?";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, notesId);
			int i=ps.executeUpdate();
			if(i==1)f=true;
			
		}
		catch (Exception e) {
		e.printStackTrace();
		}
		return f;
		
	}

}
