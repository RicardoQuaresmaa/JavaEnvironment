
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
         urlPatterns="/OleyServisInsert",
        name = "MyOwnSegdfg43gf5gfsdgfdsfsfr3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class OleyServisInsert extends HttpServlet 

{
    
    
 
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        
  Boolean kritiklik=true;
  
        if ("ktirik".equals(request.getParameter("kritiklikdurumu"))) {
            kritiklik=true;
        }
        
        else if ("cokkritik".equals(request.getParameter("kritiklikdurumu"))) {
           kritiklik=false;
        }
        
        
        // gets values of text fields
                       
        String servisadi = request.getParameter("servisadii_name");
        
        String servisgorevi=request.getParameter("servisgorevi_name");
                                                
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        

                                                          
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
        
                                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql = "INSERT INTO OleyServis (Adi,Gorevi,KritkCokKritik) values (?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,servisadi);
                statement.setString(2,servisgorevi);                              
                      statement.setBoolean(3,kritiklik);     
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
           
           response.sendRedirect("Oleyservis.jsp");
        }
            
     
                                                            
    
    }
    
 }