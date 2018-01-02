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
         urlPatterns="/OleyArizaEtkiUpdateee",
        name = "Msgbgfysfd4erDFhgfhr5etgfr3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class OleyArizaEtkiUpdateee extends HttpServlet 

{
    
    
 
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        
  Boolean kritiklik=false;
  
        if ("kritik".equals(request.getParameter("kritiklik"))) {
            kritiklik=true;
        }
        
        else if ("cokkritik".equals(request.getParameter("kritiklik"))) {
           kritiklik=false;
        }
        
        
        
            Boolean gorsellik=true;
  
        if ("gorsel".equals(request.getParameter("gorsellik"))) {
            gorsellik=true;
        }
        
        else if ("islevsel".equals(request.getParameter("gorsellik"))) {
           gorsellik=false;
        }
        
        
        
        Boolean Akt_Psf=false;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            Akt_Psf=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           Akt_Psf=false;
        }
        
        
        String etki_ID = request.getParameter("etki_ID_name"); 
        // gets values of text fields
                       
        String etkiadi = request.getParameter("arizaetki_name");
        
     
                                                
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        

                                                          
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
           
                                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
             String sql = "UPDATE Etki SET Adi = ?,GorselIslevsel= ?,Kritik_CokKritik = ?,Aktif_Pasif=? WHERE ID="+etki_ID;
              
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,etkiadi);
                  statement.setBoolean(2,gorsellik);                               
                      statement.setBoolean(3,kritiklik);     
                          statement.setBoolean(4,Akt_Psf); 
                          
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
           
           response.sendRedirect("Kayit/OleyArizaEtki.jsp");
        }
            
     
                                                            
    
    }
    
 }