<%-- 
    Document   : blog
    Created on : 27 Jul, 2018, 7:11:11 PM
    Author     : Inderdeep
--%>
<%@page import="database.db_Connection"%>
<%@page import="java.sql.*"%>
<%@page import="DBMS.Connections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header2.html"/>

<%
   
    String id = request.getParameter("tid");
    HttpSession s = request.getSession();
    String sid  = (String )s.getAttribute("tid");
   
  
   
    String ID=null , qual=null , teachat=null , about=null,name=null;
    
    try
    {
        String str = "Select * from profile where ID = ?" ;
        String st = "Select * from user where SID = ?" ;
        
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
        PreparedStatement stm = c.con.prepareStatement(st);
        
        stmt.setString(1, id);
        stm.setString(1, id);
        
        ResultSet rs = stmt.executeQuery();
        ResultSet r = stm.executeQuery();
  
       while(rs.next())
       {
         ID = rs.getString("ID");
          qual = rs.getString("qualification");
           teachat = rs.getString("teachat");
            about = rs.getString("about");
       }
       
        while(r.next())
       {
         name = r.getString("sNAme");
        
       }
    }catch(Exception e)
    {
        out.println(e.toString());
    }
%>

<%
      String image="images/";
      
      try{
            
          Connections c = new Connections();
          PreparedStatement stmt = c.con.prepareStatement("Select PATH from images where id = ? ");
          
          stmt.setString(1,id);// o.getId());
          
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
   
  
<div class="container-fluid text-center" style="margin-top: 2%">    
 
 <div class="row content">
   
 <!-- PERMANENT SIDE NAVIGATION -->    
   <div class="col-sm-2 sidenav " style="">

    <div class="list-group">
        <a href="#" class="list-group-item">Following</a>
        <a href="s_find.jsp" class="list-group-item">Find</a>
        <a href="#" class="list-group-item">Latest</a>
    </div>
       
   </div>
  
 
 <!-- CONTENT OF BLOG -->
 
  <div class="col-sm-8 text-left"> 
     
<div class="container-fluid">

 <div class="row content">
    
     
 <!--PHOTO AND SEARCH 
 
  <div class="col-sm-3 sidenav">
     
      <h4>NAME</h4>
      
      <img src="bird.jpg" class="img-circle" height="60" width="60" alt="Avatar">
      
     <div class="input-group" style="padding-top:5%">
        <input type="text" class="form-control" placeholder="Search Blog..">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
   
  </div> -->
 
 
 <!-- PHOTO AND INTRO -->
 
 <div class="col-sm-3">
    
   <center>  
     
       <img src="<%=image%>" class="img-circle" height="200" width="200">
     <br><br>
     <p><strong style="color: red"><%=name%></strong></p>
     <p><strong>QUALIFICATION </strong><br><%=qual%></p>
     <p><strong>WORKS AT </strong><br><%=teachat%></p>
     <p><strong>ABOUT </strong><br><%=about%></p>

   </center> 
     
 </div>    
 
 
<!-- COMPLETE BODY  -->
    <div class="col-sm-9">
    
    <h1>My Blog</h1>
     
 
     <h4>Uploaded Content</h4>
   
    <%

                try
{

                    db_Connection dbconn=new db_Connection();

                    Connection myconnection= dbconn.Connection();


                    String sqlString = "SELECT * FROM pdf where tid = ?";
       
                    
                    PreparedStatement myStatement = myconnection.prepareStatement(sqlString);
 
                    myStatement.setString(1, id);
                    ResultSet rs=myStatement.executeQuery();
 
                    if(!rs.isBeforeFirst())
{

                     %>

                   <% }
                      while(rs.next())
{  
 
                   %>
                    
                     <div class="alert alert-success">
                         <strong>Assignment!  </strong><%=rs.getString("name")%><a href="view_file.jsp?id=<%out.print(rs.getString("id"));%>" class="alert-link" style="padding-left:50%">VIEW</a>.
                     </div>
    

                        <%

                                }

                            %>
  
    
  
                            <%
    
                            rs.close();
  
                              myStatement.close();
 
                               myconnection.close();

                        }catch(Exception e){
                                           e.printStackTrace();
                                           }
             
                    %>
  

    
      <hr>

      
  <h4>Leave a Comment:</h4>
  
  <!-- FORM FOR COMMENT -->
  
  <form role="form"  action="comment" method="post">
        <div class="form-group">
          <textarea class="form-control" rows="3" name="area" required></textarea>
        </div>
      <input value="<%=id%>" style="display:none" name="id">
        <button type="submit" class="btn btn-success">Submit</button>
   </form> 
   
  <br><br>
  
  
  <!-- AREA FOR COMMENTS -->
    
  <p><span class="badge">2</span> Comments:</p><br>
      
      <div class="row">
        <div class="col-sm-2 text-center">
          <img src="images/user.png" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>DIDACTICS BOT <small>Sep 29, 2015, 9:12 PM</small></h4>
          <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
        </div>
          
        <%
            ResultSet rs = null ;
            try
            {
                   db_Connection dbconn=new db_Connection();

                    Connection myconnection= dbconn.Connection();


                    String sqlString = "SELECT * FROM comment where tid = ?";
       
                    
                    PreparedStatement myStatement = myconnection.prepareStatement(sqlString);
 
                    myStatement.setString(1, id);
                    rs = myStatement.executeQuery();
 
                    if(!rs.isBeforeFirst())
{}
                
            }catch(Exception e)
            {
                
            }
        %>  
          
      <% while(rs.next())
      {
          String c = rs.getString("comment");
      %>
      
      <div class="row">
        <div class="col-sm-2 text-center">
          <img src="images/user.png" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <p><%=c%></p>
          <br>
          <br>
        </div>
          
        </div>
  <% }  %> 
          
      </div>
 
    </div>
  
 </div>
</div>

      
    </div>
      
 <!-- ADS FOR DEMO -->     
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>JO ADS</p>
      </div>
      <div class="well">
        <p>JOIN ADS</p>
      </div>
    </div>
  </div>
</div>


</body>
</html>

