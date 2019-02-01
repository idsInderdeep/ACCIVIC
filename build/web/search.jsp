<%-- 
    Document   : search
    Created on : 29 Jul, 2018, 9:36:56 PM
    Author     : Inderdeep
--%>

<%-- 
    Document   : s_find
    Created on : 27 Jul, 2018, 6:49:17 PM
    Author     : Inderdeep
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBMS.Connections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header2.html" />

<%
    String s_name = request.getParameter("s_name");
    
    HttpSession s = request.getSession();
    String id = (String)s.getAttribute("tid");
    
    String about=null,name=null;
    
    try
    {
        String str = "Select sid ,sname, path ,about from user  , images , profile where user.SID = images.id and user.SID = profile.id and user.sname=?" ;
    
        
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
  
        stmt.setString(1, s_name);
      
        ResultSet rs = stmt.executeQuery();
       

%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>DIDACTICS</title>
  <meta charset="utf-8">
  
  <link rel="stylesheet" href="style.css">
 
  <style>
   
  </style>
</head>

<body>

  
<div class="container-fluid text-center">    

    
    
 <div class="row content">
   
   <div class="col-sm-2 sidenav " style="">

    <div class="list-group">
          <a href="s_following.jsp" class="list-group-item">Following</a>
        <a href="s_find.jsp" class="list-group-item">Find</a>
        <a href="s_latest.jsp" class="list-group-item">Latest</a>
    </div>
       
   </div>
  
     
  
  
  
   <div class="col-sm-8 text-left"> 
     
       <h3>Find</h3>
       <hr> 
       
  <div class="row" style="padding:2%">
 
    <div class="col-sm-12">
        
     <form class="navbar-form " role="search" action="search.jsp" > 
   
      <center>   
        <div class="form-group input-group">
            <input type="text" class="form-control" placeholder=" Search Teachers " name="s_name">
          <span class="input-group-btn">
            <button type="submit" class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      </center>    
      </form>
 
    </div>    
</div>   
    
       
     <!-- EDIT HERE --> 
 

       
       
       
       <!-- SHOWING TO FIND-->

     
<center>
    
    <%
       while(rs.next())
       {
           
     %>    
     
     
      <div class="row">
 
 <div class="col-sm-2"></div>    
 <!-- FOLLOW PAGE TO SHOW-->    
  <div class="col-sm-8">
        
      
      
  <!-- TO SHOW -->    
    <div class="well">
                   
      <img src="images/<%out.print(rs.getString("path"));%>"  class="img-circle" height="55" width="55" alt="Avatar" >
        <p>   <%out.print(rs.getString("sname"));%></p>
           
        <div class="well" style="margin:2%">
            <p>       
          <% out.print(rs.getString("about")); %>
           
           </p>
            
           <form action="blog.jsp">
               <input style="display: none" value="<%= rs.getString("sid")  %>" name="tid"> 
           <button type="submit" class="btn btn-success">BOARD</button>
         </form>
            
         </div>
      
       <form method="post" action="follow">
           <input style="display: none" value="<%= rs.getString("sid")  %>" name="id_t"> 
           <button type="submit" class="btn btn-success">FOLLOW</button>
       </form> 
  
      
    </div>
  
 <!-- END --> 
  
  </div>  
        
 </div>
        
  
      
   <%       
     }
       
      %>     

</center>    
    
</div>
     
     
     
      
    <!-- ADD-->  
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>JOIN ADS</p>
      </div>
      <div class="well">
        <p>JOIN ADS</p>
      </div>
    </div>
  </div>
</div>


</body>
</html>
<%  
    }catch(Exception e)
    {
        out.println(e.toString());
    }
%>




