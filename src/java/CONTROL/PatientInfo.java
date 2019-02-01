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
public class PatientInfo extends HttpServlet {

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
            out.println("<title>Servlet PatientInfo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PatientInfo at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
         response.setContentType("text/html");
         PrintWriter out = response.getWriter();
         out.println("HELLO");
         
         String name = (String)request.getParameter("pname");
         String gender = (String)request.getParameter("pgender");
         String email = (String)request.getParameter("pemail");
         String address = (String)request.getParameter("paddress");
         String pnumber = (String)request.getParameter("pnumber");
         String mname = (String)request.getParameter("pmname");
         String mnumber = (String)request.getParameter("pmnumber");
         String fname = (String)request.getParameter("pfname");
         String fnumber = (String)request.getParameter("pfnumber");
                  
     try
      {
        String str = "Insert into patientinfo(NAME,pgender,pemail,paddress,pnumber,pmname,pmnumber,pfname,pfnumber) values(?,?,?,?,?,?,?,?,?)" ;
            
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
        stmt.setString(1,name);
        stmt.setString(2,gender);
        stmt.setString(3,email);
        stmt.setString(4,address);
        stmt.setString(5,pnumber);
        stmt.setString(6,mname);
        stmt.setString(7,mnumber);
        stmt.setString(8,fname);
        stmt.setString(9,fnumber);
        
        stmt.executeUpdate();
       
        str= "select PID from patientinfo where pemail = ?";
        PreparedStatement stm = c.con.prepareStatement(str);
        stm.setString(1,email);
        ResultSet rs = stm.executeQuery();
        String PID=null ;
        while(rs.next())
        {
            PID = rs.getString(1);
        }
        out.println(PID);
         HttpSession s = request.getSession();
         s.setAttribute("PID", PID);
        response.sendRedirect("patient1.jsp?");
       }catch(Exception e)
         {
             out.println(e.toString());
         }
         /*out.println(name);
         out.println(gender);
         out.println(email);
         out.println(address);
         out.println(pnumber);
         out.println(mname);
         out.println(mnumber);
         out.println(fname);
         out.println(fnumber);*/
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
