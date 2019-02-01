/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import BEANS.signBean;
import DBMS.Connections;
import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.Enumeration;
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
public class image extends HttpServlet {

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
            out.println("<title>Servlet image</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet image at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
           // processRequest(request, response);
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("DDDDDDDDDDD");
         String p = null ;
        try{
       
        
         String root = getServletContext().getRealPath("images");
         MultipartRequest m = new MultipartRequest(request, root);  
         String fname=null;
    
   
         Enumeration files = m.getFileNames();
         String name = (String)files.nextElement();
    
         fname = m.getFilesystemName(name);
         
         out.print(fname);
         
         
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Insert into images values(?,?) ");
           PreparedStatement stm = c.con.prepareStatement("Delete from images where id = ? ");
          
          HttpSession s= request.getSession();
          signBean o = (signBean)s.getAttribute("user");
          
          p = o.getProf();
          
          stmt.setString(1, o.getId());
          stmt.setString(2,fname);
          
          stm.setString(1,o.getId());
          
          stm.executeUpdate();
          stmt.executeUpdate();
          
          out.println(p);
          if(o.getProf().equals("1"))
          {
             response.sendRedirect("teacher_profile.jsp");
           }
          else
          {
              response.sendRedirect("student_profile.jsp");

          }
          
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
