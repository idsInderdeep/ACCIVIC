package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class about_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.html", out, false);
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title></title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("       \n");
      out.write("    </head>\n");
      out.write("    <body >\n");
      out.write("    \n");
      out.write("       <div class=\"container-fluid\">\n");
      out.write("           \n");
      out.write("           <center>\n");
      out.write("           <h1>About <strong>AcciVic</strong></h1>\n");
      out.write("           \n");
      out.write("           <h3 >The Accident Victim Information System </h3>\n");
      out.write("           \n");
      out.write("           <p style=\"padding-top: 5%\">In this site you can follow your teacher to get their </p>\n");
      out.write("           <p>notes and assignments on time and can be able to share</p>\n");
      out.write("           <p>your thoughts about the material provide by mentor on their board</p>\n");
      out.write("         \n");
      out.write("           <img style=\"padding-top: 5%\" src=\"images/myimage.jpg\" class=\"img-circle \" width=150 height=200>\n");
      out.write("           \n");
      out.write("           <h3 ><strong>THIS SITE IS CREATED BY INDERDEEP SINGH</strong></h3>\n");
      out.write("           <h5>B.Tech(CSE) student at Delhi Technical Campus</h5>\n");
      out.write("         \n");
      out.write("           <h6>Contact links</h6>\n");
      out.write("           \n");
      out.write("           <p><a>FACEBOOK</a></p>\n");
      out.write("           <p><a>GITHUB</a></p>\n");
      out.write("           <p><a>TWITTER</a></p>\n");
      out.write("          \n");
      out.write("  \n");
      out.write("           </center>\n");
      out.write("           \n");
      out.write("       </div>    \n");
      out.write("  \n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
