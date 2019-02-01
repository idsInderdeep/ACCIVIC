<%-- 
    Document   : followers.jsp
    Created on : 27 Jul, 2018, 11:15:15 PM
    Author     : Inderdeep
--%>

<%-- 
    Document   : s_following
    Created on : 27 Jul, 2018, 6:49:56 PM
    Author     : Inderdeep
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBMS.Connections"%>

<jsp:include page="header2.html" />

<%
    HttpSession s = request.getSession();
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
    
   try{ 
   
     
       
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
          <a href="t_assignments.jsp" class="list-group-item">Assignments</a>
        <a href="t_notes.jsp" class="list-group-item">Notes</a>
        <a href="t_blog.jsp" class="list-group-item">Blog</a>
        <a href="follower.jsp" class="list-group-item">Followers</a>
         <a href="#" class="list-group-item">Following</a>
         <a href="#" class="list-group-item">Find</a>
    </div>
       
   </div>
  
     
  
  
  
   <div class="col-sm-8 text-left"> 
       <h3>Followers</h3>
       <hr> 
       
  <div class="row" style="padding:2%">
 
    <div class="col-sm-12">
        
 
    </div>    
</div>   
    
       
     <!-- EDIT HERE --> 
 

       
       
       
       <!-- SHOWING TO FIND-->

     
<center>
    
    <%
          for(int i=0;i<list.size();i++)
        {
       String str = "Select sname, path ,about,sid from user , images,sprofile  where user.sid = ? and images.id= ? and sprofile.id = ?" ;
    
        
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
  
        stmt.setString(1, list.get(i));
         stmt.setString(2, list.get(i));

           stmt.setString(3, list.get(i));
        ResultSet rs = stmt.executeQuery();
        
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
         <p>   <%out.print(rs.getString("about"));%></p>
           
       <form method="GET" action="follow">
           <input style="display: none" value="<%= rs.getString("sid")  %>" name="id_t"> 
           
       </form> 
  
       
      
    </div>
  
 <!-- END --> 
  
  </div>  
        
 </div>
        
  
      
   <%       
     }
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
           {out.println(e.toString());}
            
%>   
            
            
            
            
            
            
            
            
            