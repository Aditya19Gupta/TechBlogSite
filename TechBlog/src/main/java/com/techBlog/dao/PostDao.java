package com.techBlog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.techBlog.entities.Category;
import com.techBlog.entities.Post;
import com.techBlog.entities.User;
public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list=new ArrayList<>();
		
		try {
			String query="select * from category";
			Statement smt=this.con.createStatement();
			ResultSet set = smt.executeQuery(query);
			
			//fetch the content from category database
			while(set.next()) {
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("discription");
				Category cat = new Category(cid,name,description);
				list.add(cat);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//save post
	public boolean savePost(Post p,User user){
		boolean f=false;
		try {
			
			String q= "insert into post(title,code,pic,cid,pcontent,id) values(?,?,?,?,?,?)";
			PreparedStatement pstm=con.prepareStatement(q);
			pstm.setString(1, p.getTitle());
			pstm.setString(2, p.getCode());
			pstm.setString(3, p.getPic());
			pstm.setInt(4, p.getCid());
			pstm.setString(5, p.getContent());
			pstm.setInt(6, user.getId());
			pstm.executeUpdate();
			f=true;	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
		
		
	}

	//get all post
	public List<Post> getAllPost(){
		
		List<Post> list=new ArrayList<>();
		try {
			
			PreparedStatement pst=con.prepareStatement("select* from post");
			ResultSet set=pst.executeQuery();
			while(set.next()) {
				
				int pid=set.getInt("pid");
				String ptitle=set.getString("title");
				String pcode=set.getString("code");
				String pPic=set.getString("pic");
				Timestamp pDate=set.getTimestamp("pdate");
				int cid=set.getInt("cid");
				int id=set.getInt("id");
				String pContent=set.getString("pcontent");
				Post post= new Post(pid,ptitle,pcode,pContent,pPic,pDate,cid,id);
				list.add(post);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	//get id wise category
	public List<Post> getPostByCid(int cid){
		
		List<Post> list=new ArrayList<>();
		try {
			
			try {
				
				PreparedStatement pst=con.prepareStatement("select* from post where cid=?");
				pst.setInt(1, cid);
				ResultSet set=pst.executeQuery();
				while(set.next()) {
					
					int pid=set.getInt("pid");
					String ptitle=set.getString("title");
					String pcode=set.getString("code");
					String pPic=set.getString("pic");
					Timestamp pDate=set.getTimestamp("pdate");
					int id=set.getInt("id");
					String pContent=set.getString("pcontent");
					Post post= new Post(pid,ptitle,pcode,pContent,pPic,pDate,cid,id);
					list.add(post);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}catch(Exception e) {
			
		}
		return list;
	}
	
	//get post by specific user
//	public void getPostByUser(User user) {
//		try {
//			
//			String q="select column pcontent from post where id=?";
//			PreparedStatement pstm=con.prepareStatement(q);
//			pstm.setInt(1, user.getId());
//			ResultSet set=pstm.executeQuery();
//			while(set.next()) {
////				String content=set.getString("pcontent");
//				
//				
//			}
//			
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
}







