<%-- 
    Document   : logout
    Created on : 28 Jul, 2018, 12:41:58 AM
    Author     : Inderdeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header2.html" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
  <body>
   
      <div class="container-fluid ">  
       
      <center>  
   
    <div class="col-sm-12">   
   
        <form action="comment"> 
        <h1>Are you sure , you want to Delete your Account ?</h1>
        
        <br>
        <br>
  
        <button type="submit" class="btn btn-default align-center" onclick="a()">CONFIRM</button>
          
       </form> 
    </div>  
      
          <a href="#">Complaint</a>
   </center>
 
   </div>  
      <script>
          function a()
          {
              alert("Are you sure");
          }
          </script>
         
    </body>

</html>

</html>
