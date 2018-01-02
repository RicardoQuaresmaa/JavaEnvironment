
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
         urlPatterns="/MailUpdate",
        name = "MyOwnServlg4eedfgds45ft4f3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class MailUpdate extends HttpServlet 

{
    
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
                       
        String MailAdresiii45 = request.getParameter("MailAdresiiii_name");
        String Calisan_IDD=request.getParameter("Calisan_ID_dd");
        String Mail_IDD=request.getParameter("Mail_ID_dd");
                   
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
         Boolean Akt_Psf=false;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            Akt_Psf=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           Akt_Psf=false;
        }
      
                                                          
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
          
                                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql = "UPDATE MailAdresi SET MailAdresi = ?,Calisan_ID = ?,Aktif_Pasif = ? WHERE ID="+Mail_IDD;
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,MailAdresiii45);
            statement.setInt(2,Integer.parseInt(Calisan_IDD)); 
            statement.setBoolean(3,Akt_Psf);
            
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
           
           response.sendRedirect("Mail.jsp");
        }
            
     
                                                            
    
    }
    
 }