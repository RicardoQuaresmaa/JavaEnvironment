<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="java.sql.*" %>

<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
    </HEAD>
    
        <H1>Fetching Data From a Database</H1>
        <%! byte[] byteCodeString;
        BufferedImage bImageConvert;
        InputStream in;
        
        %>
        <% 
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:9563;databaseName=ProblemTrackingSystem","Broadage","oley");
                
            Statement statement = connection.createStatement();
            String id = request.getParameter("id");  
            ResultSet resultset = 
                statement.executeQuery("select * from contacts where contact_id = '" + id + "'") ; 
            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {
                
 byteCodeString=resultset.getBytes(4);
 
 /*
 in=new ByteArrayInputStream(byteCodeString);
BufferedImage bImageFromConvert=ImageIO.read(in);

ByteArrayOutputStream baos = new ByteArrayOutputStream();
ImageIO.write( bImageFromConvert,"jpg", baos );
baos.flush();
byte[] imageInByteArray = baos.toByteArray();
baos.close();
 */
 
String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(byteCodeString);


//String b64 = javax.xml.bind.DatatypeConverter.printHexBinary(imageInByteArray);

/*

*/

        %>
        <TABLE BORDER="1">
            <TR>
               <TH>ID</TH>
               <TH>Name</TH>
               <TH>LastName </TH>        
               <TH>picture</TH>
           </TR>
           <TR>
               <TD> <%= resultset.getString(1) %> </TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>             
               <TD> <img style="width:100px;height:100px" src="data:image/jpg;base64, <%=b64%>" /> </TD>
           </TR>
       </TABLE>
       <BR>
       <% 
           } 
       %>
    </HTML>


