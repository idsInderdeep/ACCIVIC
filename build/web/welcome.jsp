<%-- 
    Document   : welcome
    Created on : 24 Jul, 2018, 1:01:58 AM
    Author     : Inderdeep
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBMS.*"%>
<%@page import="BEANS.signBean"%>
<%@page import="DBMS.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    
    <head>
        <script src="script1.js"></script>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="b()">
      <jsp:include page="header2.html"/>
        
      <%
          HttpSession s= request.getSession();
          signBean o = (signBean)s.getAttribute("user");
          
      %>
      
  

   
   <div class="container-fluid text-center">  
       
   <div class="col-sm-3"></div>
   <form class="form-horizontal" action="StudSignIn" method="GET">
   
    <div class="col-sm-6 centered">   
    <div class="form-group align-center">
      <h1>Hi <%=o.getName()%> please enter OTP to verify Email ID </h1>
          <input type="text" class="form-control" id="otp" placeholder="OTP" name="pass" required>
          
      </div>
            <button type="submit" class="btn btn-default">CONFIRM</button>
    </div>  
      
    <div class="form-group">
      
    </div>
  
   </form>     
   </div>     
         
    </body>
</html>
