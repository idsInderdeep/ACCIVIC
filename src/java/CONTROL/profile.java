/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import BEANS.signBean;
import DBMS.Connections;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
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
public class profile extends HttpServlet {

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
            out.println("<title>Servlet profile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profile at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
               response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        //out.print("FFFFFFFFFFFFFFFFFFFFFFFFFFF");
        try{
      
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Insert into sprofile values(?,?,?,?) ");
 
         // HttpSession s= request.getSession();
          //signBean o = (signBean)s.getAttribute("user");
          

          stmt.setString(1,request.getParameter("Id"));
          stmt.setString(2,request.getParameter("course"));
          stmt.setString(3,request.getParameter("college"));
          stmt.setString(4,request.getParameter("about"));
          
          
          stmt.executeUpdate();
          
          stmt.close();
          
            RequestDispatcher r = request.getRequestDispatcher("login.jsp");
            r.include(request, response);
            out.println("<center><h2> LOGIN TO GET STRATED </h2></center>");
            
        }catch(Exception e)
         {
             out.println(e.toString());
         }
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
             
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         
           try{
       
        
  
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Insert into profile values(?,?,?,?) ");
 
          HttpSession s= request.getSession();
          signBean o = (signBean)s.getAttribute("user");
          
          stmt.setString(1, o.getId());
          stmt.setString(2,request.getParameter("eu"));
          stmt.setString(3,request.getParameter("teach"));
          stmt.setString(4,request.getParameter("about"));
          
          
          stmt.executeUpdate();
          
          stmt.close();
          
           RequestDispatcher r = request.getRequestDispatcher("login.jsp");
            r.include(request, response);
            out.println("<center><h2> LOGIN TO GET STARTED </h2></center>");
        }catch(Exception e)
         {
             out.print(e.toString());
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
