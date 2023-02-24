/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import blog.entities.User;
import blog.dao.Userdao;
import blog.entities.Message;
import blog.helper.ConnectionProvider;
import java.sql.Timestamp;


/**
 *
 * @author smanjuna
 */
public class editServlet extends HttpServlet {

    
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
            
            String Uname=request.getParameter("profile_name");
            String Uemail=request.getParameter("profile_email");
            String Upass=request.getParameter("profile_password");
            String Uabout=request.getParameter("profile_textbox");
            
            
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");
            
            user.setName(Uname);
            user.setEmail(Uemail);
            user.setPassword(Upass);
            user.setAbout(Uabout);
            
            
            Userdao Udao=new Userdao(ConnectionProvider.getConnection());
            
            boolean ans=Udao.updateUser(user);
            Message m;
            if(ans==true){
                m=new Message("Updated Successfully","success","alert-success");
                 
                 s.setAttribute("msg", m);
                 response.sendRedirect("profile.jsp");
            }
            else{
                m=new Message("Sorry, Not Updated","failed","alert-danger");
                 s.setAttribute("msg", m);
                 response.sendRedirect("profile.jsp");
            }
            
           
            out.println("<h1>Servlet editServlet at " + request.getContextPath() + "</h1>");
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
