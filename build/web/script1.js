/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function validateForm() {
    var x = document.forms["studentForm"]["pwd"].value;
    var y = document.forms["studentForm"]["cpwd"].value;
    var z = document.forms["studentForm"]["access"].value;
    
    if (x.length!=8) {
        alert("Length of password must be of 8 charecters");
        return false;
    }
    else if(z!="007")
    {
        alert("!!! Access denied !!! Contact AcciVic Team");
        return(false);
    }
    else
    {
        if(x!=y)
        {
               alert("Password confirmation is wrong");
               document.forms["studentForm"]["cpwd"].style.color="red";
               return false;
        }
    }
}
 function b()
            {
                alert("Check Email Inbox OTP has been Send");
                document.getElementById("signout").style.display="inline";
                document.getElementById("signin").style.display="none";
                document.getElementById("logout").style.display="inline";
                document.getElementById("login").style.display="none";
            }
