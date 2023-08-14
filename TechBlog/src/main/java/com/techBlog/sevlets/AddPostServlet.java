package com.techBlog.sevlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techBlog.dao.PostDao;
import com.techBlog.entities.*;
import com.techBlog.helper.ConnectionProvider;
import com.techBlog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			PrintWriter out=response.getWriter();
			String content = request.getParameter("pcontent");
			String title = request.getParameter("ptitle");
			String code = request.getParameter("pcode");
			Part part=request.getPart("ppic");
			int cid=Integer.parseInt(request.getParameter("pcid"));
			
			HttpSession s=request.getSession();
			User user = (User) s.getAttribute("currentUser");
			
			Post post= new Post(title,code,content, part.getSubmittedFileName(),null,cid,user.getId());
			
			PostDao pd=new PostDao(ConnectionProvider.getConnection());
			if(pd.savePost(post,user)) {
				
				String path=request.getRealPath("/")+"img"+File.separator+part.getSubmittedFileName();
				Helper.saveProfile(part.getInputStream(), path);
				out.println("done");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
