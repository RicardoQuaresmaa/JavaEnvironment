package Kayit;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
 @WebServlet(
         urlPatterns="/OleyArizaSebebbb",
        name = "MyOesgdf565ggdfytrr3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class OleyArizaSebebbb extends HttpServlet 

{
    
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        
  Boolean kaynakk=true;
  
        if ("ic".equals(request.getParameter("kaynak"))) {
            kaynakk=true;
        }
        
        else if ("dis".equals(request.getParameter("kaynak"))) {
           kaynakk=false;
        }
        
        
        
        
        
          Boolean aktiflik=true;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            aktiflik=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           aktiflik=false;
        }
        
        
        
        
        
        
        
        
        
        
              String sebeppadi = request.getParameter("sebebbadii_name");
        
   String islem = request.getParameter("islem_name");
                                                
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        
        if ("insert".equals(islem)) 
        
        {
            
          
            
             try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
           
                                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql = "INSERT INTO OleyArizaSebep (Ad,ic_dis_kaynak,Aktif_Pasif) values (?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
                      statement.setString(1,sebeppadi);
                      statement.setBoolean(2,kaynakk);                                                                                                                  
                      statement.setBoolean(3,aktiflik);     
                   
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/Sirket.jsp").forward(request, response);
           
           response.sendRedirect("Kayit/OleyArizaSebep.jsp");
        }
            
            
            
        }
        
        
        
        else if ("update".equals(islem))
        
        {
            
                 int id =Integer.parseInt(request.getParameter("sebebbbiddd_name"));
            
            
             try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
                                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql = "UPDATE OleyArizaSebep   SET Ad = ?,ic_dis_kaynak = ? ,Aktif_Pasif = ? WHERE ID="+id;
            PreparedStatement statement = conn.prepareStatement(sql);
                      statement.setString(1,sebeppadi);
                      statement.setBoolean(2,kaynakk);                                                                                                                  
                      statement.setBoolean(3,aktiflik);     
                   
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
        
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
        
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/Sirket.jsp").forward(request, response);
           
           response.sendRedirect("Kayit/OleyArizaSebep.jsp");
        }
            
            
            
            
            
        }
                                                          
           
            
     
                                                            
    
    }
    
 }