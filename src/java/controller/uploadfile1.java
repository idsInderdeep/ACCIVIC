/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBMS.Connections;
import MAIL.OTP;
import database.db_Connection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Inderdeep
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 1506379 )

public class uploadfile1 extends HttpServlet {

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
            out.println("<title>Servlet uploadfile1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadfile1 at " + request.getContextPath() + "</h1>");
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
      
           
           
         response.setContentType("text/html;charset=UTF-8");
                
         PrintWriter out = response.getWriter();
        
                InputStream inputStream = null;

                     String title=(request.getParameter("title"));
                
                Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));

                
           
                Part filePart = request.getPart("file_uploaded");
                
                String tid=null;

                HttpSession s = request.getSession();
                
                tid=(String)s.getAttribute("tid");
                                
                if (filePart != null) 
                {
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
        
                try 
                {
                    db_Connection dbconn=new db_Connection();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO pdf values (?, ?, ? , ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, idTemp);
                    statement.setString(2, title);
                    statement.setString(4, tid);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(3, inputStream, (int) filePart.getSize());
                    }
                    
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    { 
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("t_assignments.jsp");
                        rs.include(request, response);
                         out.println("File uploaded!!!");
                    }
                    else
                    {
                
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("t_assignments.jsp");
                        rs.include(request, response);
                        out.println("Couldn't upload your file!!!");
                    }    

                }catch(Exception e){e.printStackTrace();}     
        
                 
    String id = (String)s.getAttribute("tid");
    
    String about=null,name=null;
    
    ArrayList<String> list= new ArrayList<String>();
    
    try
    {
        String str = "Select * from follow where tid = ?" ;
    
        
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
  
        stmt.setString(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next())
        {
          
            list.add(rs.getString("sid"));
        }
        
    
    }catch(Exception e)
    {
        out.println(e.toString());
    }

    ArrayList<String> mail = new ArrayList<String>();
    
    
    try
    {
        String str = "Select * from sprofile where id = ?" ;
    
        
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
  
        stmt.setString(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next())
        {
          
            mail.add(rs.getString("email"));
        }
        
    
    }catch(Exception e)
    {
        out.println(e.toString());
    }
    
    
    for(int i=0; i<mail.size();i++)
    {
        OTP o = new OTP();
        
          
             try {
                response.getWriter().println("MAILS :"+ mail.get(i));
                 o.sendPlainTextEmail(mail.get(i),"DIDACTICS",title);
             } catch (MessagingException ex) {
                 Logger.getLogger(uploadfile1.class.getName()).log(Level.SEVERE, null, ex);
             }
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
