/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package blog.servlets;
import blog.helper.ConnectionProvider;
import blog.entities.User;
import blog.dao.Userdao;
import blog.entities.Message;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author smanjuna
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String check=request.getParameter("agree");
            if(check==null){
                out.println("please check the box");
            }
            else{
                 String name=request.getParameter("username");
                 String pass=request.getParameter("email");
                 String email=request.getParameter("password");
                 String gender=request.getParameter("gender");
                 String about=request.getParameter("textbox");
                 User user=new User(name,pass,email,gender,about);
                 Userdao dao=new Userdao(ConnectionProvider.getConnection());
                                
                 if(dao.SaveUser(user)){
                     HttpSession s=request.getSession();
                     Message m=new Message("Registered Successfully","Success","alert-success");
                     s.setAttribute("msg", m);
                                   
                   response.sendRedirect("login_page.jsp");
                 }
                 else{
                     
                     HttpSession s=request.getSession();
                     Message m=new Message("Not registered","failes","alert-danger");
                     s.setAttribute("msg", m);
                    response.sendRedirect("register.jsp");
                
                 
                 }
            }
            
            out.println("");
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
