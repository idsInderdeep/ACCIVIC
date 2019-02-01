<%-- 
    Document   : s_following
    Created on : 27 Jul, 2018, 6:49:56 PM
    Author     : Inderdeep
--%>

<%@page import="java.sql.Connection"%>
<%@page import="database.db_Connection"%>
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
        String str = "Select * from follow where sid = ?" ;
            
        Connections c = new Connections();
        PreparedStatement stmt = c.con.prepareStatement(str);
  
        stmt.setString(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next())
        {
          
            list.add(rs.getString("tid"));
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

   
   <hr>
 <div class="row content">
   
   <div class="col-sm-2 sidenav " style="">

    <div class="list-group">
          <a href="s_following.jsp" class="list-group-item">Following</a>
        <a href="s_find.jsp" class="list-group-item">Find</a>
        <a href="s_latest.jsp" class="list-group-item">Latest</a>
    </div>
       
   </div>
  
     
  
  
  
   <div class="col-sm-8 text-left"> 
     
       
  <div class="row" style="padding:2%">
 
    <div class="col-sm-12">
        
     <h3>Following</h3>
 
    </div>    
</div>   
    
       
     <!-- EDIT HERE --> 
 

       
       
       
       <!-- SHOWING TO FIND-->

     
<center>
    
    <%     
        
      for(int i=0;i<list.size();i++)
      {
        db_Connection dbconn=new db_Connection();

                    Connection myconnection= dbconn.Connection();


                    String sqlString = "SELECT * FROM pdf , user where tid = ? and sid=?";
       
                    
                    PreparedStatement myStatement = myconnection.prepareStatement(sqlString);
 
                    myStatement.setString(1, list.get(i));
                     myStatement.setString(2, list.get(i));
                    
                    ResultSet rs=myStatement.executeQuery();
 
                    if(!rs.isBeforeFirst())
{

                     %>

                   <% }
               
        
       while(rs.next())
       {
           
     %>    
     
                    <div class="alert alert-success">
                         <strong>Assignment! By: <%=rs.getString("sname")%> </strong>  NAME: <%=rs.getString("name")%><a href="view_file.jsp?id=<%out.print(rs.getString("id"));%>" class="alert-link" style="padding-left:50%">VIEW</a>.
                          
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
            
            
            
            
            
            
            
            
            