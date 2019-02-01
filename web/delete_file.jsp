<%@page import="java.util.logging.Logger"%>

<%@page import="java.util.logging.Level"%>

<%@page import="database.db_Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html onload="del()">

    <head>
 
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>View File</title>
 
   </head>
  
  <body>
  
      
        <%  
 
           String id=(request.getParameter("id"));
  
          
            Blob file = null;
 
           byte[ ] fileData = null ;

 
           try
            {   
 
                db_Connection dbconn=new db_Connection();
  
              Connection conn= dbconn.Connection();
   
         
       String sqlString = "Delete FROM pdf WHERE ID = '"+id+"'";
 
               Statement myStatement = conn.createStatement();
  
              
     myStatement.executeUpdate(sqlString);
     
     myStatement.close();
     
    
 
      
                  } 
             catch (Exception ex) {
                 
                       out.println(ex.toString());
                           Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);
                                 }
 
             %>
     
   
        <br><br>
    
        <jsp:include page="t_assignments.jsp"/>
    
        
        <script>
            function del()
            {
                alert("File Deleted");
            }
            </script>
    </body>
    

</html>
