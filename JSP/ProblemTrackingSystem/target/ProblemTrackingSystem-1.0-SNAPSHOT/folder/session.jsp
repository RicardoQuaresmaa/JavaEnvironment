  <!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="Connection.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        
    </head>
    <body>
        
        <%
String bny;
bny=request.getSession().getAttribute("ID").toString();
String bytee="";
String AdSoyad="";

      ResultSet rs = null;    
           
            Statement stmt = null;         
        Connection conn = null; // connection to the database
        
         

      
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
            
            String dbURL_=ConnectionDB.dbbb();
          
       
        conn = DriverManager.getConnection(dbURL_);  
           
              String sql = "select Resim,(Ad+' '+Soyad) as 'adsoyad' from Calisan c where c.Aktif_Pasif=1 and ID="+bny;
              
              
         
                  stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);    
         
             while(rs.next())
             {
             bytee=javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("Resim"));
             AdSoyad=rs.getString("adsoyad");
             }
     
        } catch (SQLException ex) {

        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
            // sets the message in request scope
        
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/SirketKayit.jsp").forward(request, response);
           
  
        }


    request.getSession().setAttribute("bytee",bytee);
request.getSession().setAttribute("adsoyad",AdSoyad);


// out.print(bny);

session.setAttribute("ID_",bny);

session.setAttribute("AdminMi",false);

response.sendRedirect("../Bulten.jsp");
%>
        
        
    </body>
</html>


  



              


