<%-- 
    Document   : index
    Created on : Jun 22, 2016, 2:35:31 PM
    Author     : MENTE
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
  <head>
	<center><h1>REGISTRATION FORM</h1></center>
  </head>
  <body>
	<form name="f1" method="get" action="index.jsp" id="f1">

  <PRE>             
	      Name:<input type="text" name="nam"/>  Last-Name:<input type="text" name="last"/>

	     <input type="submit" value="SUBMIT" />                           
	</pre>
</form>
 <%
     try
     {
      Connection con = null;
      Statement stmt = null;
      response.setContentType("text/html");
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      String url="jdbc:mysql://localhost:3306/mss?user=root&password=password";
      con=DriverManager.getConnection(url);
      stmt=con.createStatement();
      String name;
      name=request.getParameter("nam");
      if(name!=null)
      {
         if(name!="")
         {
          PreparedStatement pst = null;
          int updateQuery = 0;
          String query ="INSERT INTO reg VALUES(?)";
          pst= con.prepareStatement(query);
             pst.setString(1,name);
         updateQuery = pst.executeUpdate();
         if(updateQuery!=0)
        {
          out.println("INSERTED SUCCESSFULLY");
        } 
      }
       }
    stmt.close();
   con.close();
 }
    catch(SQLException e)
    {
      out.println("Unable to connect database");
    }
 %>
 </body>
</html>