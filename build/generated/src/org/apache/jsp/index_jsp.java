package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("           <h1 style=\"padding-top: 3%\">Welcome To <strong>AcciVic</strong></h1>\n");
      out.write("           \n");
      out.write("           <h3 >\"The Accident Victim Information system  \"</h3>\n");
      out.write("           \n");
      out.write("           <p style=\"padding-top: 2%\"> It is designed to help accident victim during emergency .\n");
      out.write("                <br>This will save their lives by the use of technology to provide  timely medical information to the doctor\n");
      out.write("\n");
      out.write(" </p>\n");
      out.write("           <p>   This will work on finger print sensor. </p>\n");
      out.write("           <p>The doctors can consult to the family members of the patient.<br>\n");
      out.write("           Also the patient medical history and information will be centralized and\n");
      out.write("           shared across the country hospitals,<br>\n");
      out.write("           so that immediate medical help can be provided to victim in any part \n");
      out.write("           <br>of country and people will not lose their  lives due to delay in treatment. \n");
      out.write("</p>\n");
      out.write("           <p></p>\n");
      out.write("           <p></p>\n");
      out.write("           <p></p>\n");
      out.write("         \n");
      out.write("           <p style=\"padding-top: 3%\"><strong>TO GET THE ACCESS LOGIN ON OUR SITE</strong></p>\n");
      out.write("           \n");
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
