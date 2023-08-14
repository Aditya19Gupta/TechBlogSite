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

import com.techBlog.dao.UserDao;
import com.techBlog.entities.Message;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import com.techBlog.helper.Helper;

/**
 * Servlet implementation class EditServlets
 */
@WebServlet("/EditServlets")
@MultipartConfig
public class EditServlets extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //update data
            String useremail=request.getParameter("useremail");
            String username=request.getParameter("username");
            String userpass=request.getParameter("userpass");
            
            Part userprofile=request.getPart("userprofile");
           
            String imagename=userprofile.getSubmittedFileName();
            
            HttpSession s=request.getSession();
            User user= (User)s.getAttribute("currentUser");
            
            String oldprofile= user.getProfile();
            user.setEmail(useremail);
            user.setName(username);
            
            user.setPassword(userpass);
            user.setProfile(imagename);
            
            //update data on database
            UserDao dao= new UserDao(ConnectionProvider.getConnection());
            if(dao.updateUser(user)){
                //delete file
                String oldpath=request.getRealPath("/")+"img"+File.separator+oldprofile;
                out.println("updated");
                //new save file
                String path=request.getRealPath("/")+"img"+File.separator+user.getProfile();
                Helper.deleteProfile(oldpath);
                if(Helper.saveProfile(userprofile.getInputStream(),path)){
                    Message msg=new Message("Profile updated !!","success","alert-success");
                    s.setAttribute("msg",msg);
                    response.sendRedirect("profile.jsp");
                }
            }
            else{
                out.println("error not updated");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }
	
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**

     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
