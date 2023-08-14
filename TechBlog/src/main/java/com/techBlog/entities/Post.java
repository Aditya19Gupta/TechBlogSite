package com.techBlog.entities;

import java.sql.*;

public class Post {
	private int pid;
	private String title;
	private String code;
	private String content;
	private String pic;
	private Timestamp pdate;
	private int cid;
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Post(int pid, String title, String code,String content, String pic, Timestamp pdate, int cid,int id) {
		this.id=id;
		this.pid = pid;
		this.title = title;
		this.code = code;
		this.pic = pic;
		this.pdate = pdate;
		this.cid = cid;
		this.content=content;
	}
	public Post(String title, String code,String content, String pic, Timestamp pdate, int cid,int id) {
		this.id=id;
		this.title = title;
		this.code = code;
		this.pic = pic;
		this.pdate = pdate;
		this.cid = cid;
		this.content=content;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Post() {
		
	}
	
	//getters and setters
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
}
