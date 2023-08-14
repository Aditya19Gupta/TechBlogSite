/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.techBlog.sevlets;

import com.techBlog.dao.UserDao;
import com.techBlog.entities.Message;
import com.techBlog.entities.User;
import com.techBlog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(name = "signup", urlPatterns = {"/signup"})
@MultipartConfig
public class signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Random random = new Random();
            String term=request.getParameter("term");
            if(term==null){
                out.println("check the term..");
            }
            
            else{
                String name1=request.getParameter("name");
                String email1=request.getParameter("email");
                String pass=request.getParameter("password");
                String gender1=request.getParameter("gender");
                
                String userid=name1.substring(0, 2)+random.nextInt(6, 99)+email1.substring(4,7)+pass.substring(2, 4);
                //out.println(name1+"hhh");
                
                User user = new User(name1,email1,pass,gender1,userid);
               
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                try{
                    Thread.sleep(3000);
                }catch(Exception e){
                    
                }
               
                if(dao.saveUser(user)){
                    out.println("done");
                }
                else{
                    out.println("error");
                }
            }
           
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
