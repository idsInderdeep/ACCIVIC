/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import DBMS.Connections;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Inderdeep
 */
public class Login extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
      
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
       // processRequest(request, response);
          response.setContentType("text/html");
           String email=request.getParameter("email") , password=request.getParameter("password");
            HttpSession s = request.getSession();
             String prof=null;
        try
        {
            Connections c = new Connections();
            PreparedStatement stmt;
            stmt = c.con.prepareStatement("Select * from user");
            
            ResultSet rs = stmt.executeQuery();
            
            PrintWriter out = response.getWriter();
            
            int flag=-1;
            
            while(rs.next())
            {
                if(rs.getString("semail").equalsIgnoreCase(email)&&rs.getString("spwd").equals(password))
                {
                    flag=0;
                    s.setAttribute("tid", rs.getString("sid"));
                    prof=rs.getString("prof");
                }
            }
            
            if(flag==0)
            {
             
 
                out.println(s.getAttribute("tid"));
                
                if(prof.equals("1"))
                {
                  RequestDispatcher r = request.getRequestDispatcher("t_blog.jsp");
                  r.forward(request, response);
                }
                else
                {
                  RequestDispatcher r = request.getRequestDispatcher("student_acc.jsp");
                  r.forward(request, response);   
                }
                
            }
            else
            {
                RequestDispatcher r = request.getRequestDispatcher("login.jsp");
                 r.include(request, response);
                 out.println("<p class=\"text-warning \" style=\"text-align:center\">!! Sorry Not Found !!</p>");
                
                
            }
            
        }
        catch(Exception e)
        {
           response.getWriter().println(e.toString());
        }
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
