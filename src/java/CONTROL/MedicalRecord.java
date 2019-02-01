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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Inderdeep
 */
public class MedicalRecord extends HttpServlet {

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
            out.println("<title>Servlet MedicalRecord</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MedicalRecord at " + request.getContextPath() + "</h1>");
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
         PrintWriter out = response.getWriter();
         String D = (String)request.getParameter("disabled");
         String BP = (String)request.getParameter("bloodpressure");
         String BG = (String)request.getParameter("bloodgroup");
         String TH = (String)request.getParameter("thyroid");
         String AL = (String)request.getParameter("allergy");
         String TM = (String)request.getParameter("temp");
         String DS = (String)request.getParameter("disease");
         String PR = (String)request.getParameter("Perception");
         String Other = (String)request.getParameter("other");
         String BGL = (String)request.getParameter("bloodglucose");
         String UR = (String)request.getParameter("uricacid");
         String PID = (String)request.getParameter("pin");
          
         HttpSession s = request.getSession();
         String DID = (String)s.getAttribute("tid") ;
         //String PID = (String)s.getAttribute("PID");
         
         
                  
     try
      {
        String str = "Insert into MedicalRecord values(?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
        Date date = new Date();    
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
        stmt.setString(1,PID);
        stmt.setString(2,DID);
        stmt.setString(3,BG);
        stmt.setString(4,BGL);
        stmt.setString(5,TH);
        stmt.setString(6,AL);
        stmt.setString(7,UR);
        stmt.setString(8,TM);
        stmt.setString(9,DS);
        stmt.setString(10,PR);
        stmt.setString(11,D);
        stmt.setString(12,Other);
        stmt.setString(13, date.toString());
        stmt.executeUpdate();
       
        
        out.println(PID);
        response.sendRedirect("CREATE.jsp");
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
        //processRequest(request, response);     response.setContentType("text/html");
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
