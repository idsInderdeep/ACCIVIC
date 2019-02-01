<%-- 
    Document   : signup
    Created on : 22 Jul, 2018, 3:55:42 PM
    Author     : Inderdeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.html" %>

<!DOCTYPE html>
<html>
 
    <head>
       <script src="script1.js"></script>
    </head>
    
    <body>
       <div class="container" style="padding-left:20%;padding-right:20%;" id="inder">
  <h2>Doctors Sign In</h2>
  <form class="form-horizontal" action="StudSignIn" name="studentForm" onsubmit="return validateForm()" method="POST">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Name:</label>
      <div class="col-sm-10">
          <input type="text" class="form-control" id="uname" placeholder="Enter Name" name="uname" required>
      </div>
    </div>  
      
    <div class="form-group">
  
      <label class="control-label col-sm-2" for="email">Email:</label>
      
      <div class="col-sm-10">   
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email"  required>
      </div>
    </div>
      
    <div class="form-group" style="display:none">
      <label class="control-label col-sm-2" for="pwd">Doctor:</label>
      <div class="col-sm-10">          
          <select name="prof" class="form-control"  >
              <option value="1">Doctor</option>
              <option value="2">Teacher</option>
    </select>
      </div>
    </div> 
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd" >Access ID :</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="access" placeholder="Contact AcciVic Team" name="access"  required>
      </div>
    </div>  
      
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="password must be of 8 charecters" name="pwd"  required>
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Confirm Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="cpwd" placeholder="Confirm password" name="cpwd"  required>
      </div>
    </div>  
      
   
      
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
      
      
      
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
          <center>
          <button type="submit" class="btn btn-default" onsubmit="return validateStudent()" >Submit</button>
          </center>
      </div>
    </div>
  </form>
</div>
    
  
    </body>
</html>
