/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROL;

import BEANS.signBean;
import DBMS.Connections;
import DBMS.student;
import MAIL.OTP;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class StudSignIn extends HttpServlet {

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
            out.println("<title>Servlet StudSignIn</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StudSignIn at " + request.getContextPath() + "</h1>");
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
        
        String otp=request.getParameter("pass");
        HttpSession h = request.getSession();
        String cotp=(String)h.getAttribute("otp");
        
        RequestDispatcher r = request.getRequestDispatcher("header.html");
       PrintWriter out = response.getWriter();
        
       if(otp.equals(cotp))
        {
            
            //response.getWriter().println("HAHAHa");
          // r.include(request, response);
           
           
           //inserting into database
           signBean sign = (signBean)h.getAttribute("user");
          student s = new student();
           
           s.insert(sign);
           
           
           //response.getWriter().println(h.getAttribute("prof"));
           
          String prof = (String)h.getAttribute("prof");
           
           if(prof.equals("1"))
           {
             // out.print("TEACHER");
              response.sendRedirect("teacher_profile.jsp");
           }
           else
           {
                 response.sendRedirect("student_profile.jsp");
            }
            
        }
        else
        {
           //show not create
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
        //processRequest(request, response);
         String n=null,e=null;
         HttpSession s = request.getSession();
       
          PrintWriter out = response.getWriter();
          
            try {
            
            int flag=-1;
            
            String email = request.getParameter("email");
            
            response.setContentType("text/html");
            
             Connections connect = new Connections();

            Statement stmt = connect.con.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from user");
           
            
          while(rs.next())
            {
                String temp=rs.getString("semail");
                  
                
                if(email.equals(temp))
                {
                    flag=0;
                }
                
            }
            
           
            if(flag==0)
            {

        
                //if email exist
                
                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.include(request, response);
                
    
                RequestDispatcher r = request.getRequestDispatcher("exist.html");
                r.include(request, response);
           
                 
            }
            else
            {
                
                  //setting in object 
          
                 Random ran = new Random();
                 int nm = ran.nextInt(10000);
                  signBean u = new signBean();
                  u.setName(request.getParameter("uname"));
                  u.setEmail(request.getParameter("email"));
                  u.setPassword(request.getParameter("pwd"));
                  u.setId(u.getName()+nm);
                  u.setProf(request.getParameter("prof"));
   
                  /*String c = s.insert(u);
             
                  out.println(c);*/
                  
                  //setting user info
            
                  s.setAttribute("user", u);
                  s.setAttribute("prof", request.getParameter("prof"));
                  
                  //sending OTP
                  
                  OTP m = new OTP();
          
        
        try {

          Random r = new Random();
          int num = r.nextInt(10000);
          
           String otp="Welcome "+request.getParameter("uname")+" to AcciVic pls confirm your OTP :"+num;
           m.sendPlainTextEmail(request.getParameter("email"),"ACCIVICS",otp);
          
          
           s.setAttribute("otp",""+ num);
           out.println(num);
              //going to welcome page to verirfy otp
           response.sendRedirect("welcome.jsp");
        
        } catch (Exception ex) {
            response.getWriter().println(ex.toString());
            Logger.getLogger(StudSignIn.class.getName()).log(Level.SEVERE, null, ex);
        }
                  
               
        
                
            }
            
        
          } catch (Exception ex){
                   out.print(ex.toString());
            Logger.getLogger(StudSignIn.class.getName()).log(Level.SEVERE, null, ex);
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
