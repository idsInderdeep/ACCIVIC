<%-- 
    Document   : student_profile
    Created on : 25 Jul, 2018, 2:40:29 PM
    Author     : Inderdeep
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBMS.Connections"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="BEANS.signBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header2.html" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Didactics</title>
    </head>
    <body>
      
   <div class="container" style="padding-left:20%;padding-right:20%;" id="inder">
   
  <%
         String image="images/";
                
      
        HttpSession s= request.getSession();
        signBean o = (signBean)s.getAttribute("user");

    
      try{
            
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Select PATH from images where id = ? ");
          
          stmt.setString(1,o.getId());// o.getId());
          
          ResultSet rs = stmt.executeQuery();
          
          if(!rs.next())
          {
              image=image+"user.png";
          }
          else
          {
             image=image+rs.getString("path");
          }
 
      }catch(Exception e)
      {
          out.println(e.toString());e.printStackTrace();
      }
      
    
               /*
        out.println(request.getParameter("pic"));
        
       String root = getServletContext().getRealPath("images");
        MultipartRequest m = new MultipartRequest(request, root);  
        String fname=null;
    
   
        Enumeration files = m.getFileNames();
        String name = (String)files.nextElement();

     fname = m.getFilesystemName(name);*/
        
 
        
  %>   


  
  <h2> <%=o.getName() %> Set Your Profile</h2>
  <p>This profile will be displayed to all publicly </p>
  
 <div class="row">   
     
  <div class="col-sm-3">
      <img src="<%out.println(image);%>" class="img-circle" alt="Cinque Terre" width="200" height="200">
    </div>
  </div>
  
 
  <div class="row" style="margin-left:30%;margin-right:30%">
       <div class="col-sm-6">
           <form action="image" enctype="multipart/form-data" method="POST">  
         <input type="file" name="pic"><br>
         <button type="submit" class="btn btn-default" >Upload</button>
         </form>
       </div>
       
  </div>  
 
     
     
  <form class="form-horizontal" action="profile" style="padding-top:2%">
    
   <div class="form-group">
      <label class="control-label col-sm-2" >Student of : </label>
      <div class="col-sm-10">
          <input type="text" class="form-control"  placeholder="course" name="course" required>
      </div>
    </div>   
      
    <div class="form-group">
      <label class="control-label col-sm-2" >Study at : </label>
      <div class="col-sm-10">
          <input type="text" class="form-control"  placeholder="Institute" name="college" required>
      </div>
    </div>     
  
    <div class="form-group">
      <label class="control-label col-sm-2" >About</label>
      <div class="col-sm-10">
          <textarea class="form-control" rows="5" name="about" placeholder="max charecter 100"></textarea>          
      </div>
    </div>  
      
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">\
           <input type="text" style="display:none" value="<%=o.getId()%>" name="Id">
          <button type="submit" class="btn btn-default" onsubmit="return validateStudent()" >Submit</button>
      </div>
    </div>
     
  </form>
</div>
    
  
        
    </body>
</html>