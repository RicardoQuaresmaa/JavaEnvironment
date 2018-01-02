
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
         urlPatterns="/GorevUpdate",
        name = "MyOfdsf4wnServlg4eet4f3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class GorevUpdate extends HttpServlet 

{
    
    
   
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
          
        Boolean Akt_Psf=false;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            Akt_Psf=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           Akt_Psf=false;
        }
        
        String Gorev_Adi = request.getParameter("GorevAdi");
        
                String Gorev_IDDDD = request.getParameter("Gorevaydizulfu");

                         
                
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        
      String Departmn__IDD=request.getParameter("depaydizulfu");
                                                          
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
         
                                 String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
             String sql65 = "UPDATE Gorev SET Ad = ?,Departman_ID = ?,Aktif_Pasif = ? WHERE ID="+Gorev_IDDDD;
            PreparedStatement statement = conn.prepareStatement(sql65);
            statement.setString(1,Gorev_Adi);
                      statement.setInt(2,Integer.parseInt(Departmn__IDD));     
                      statement.setBoolean(3,Akt_Psf);
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
           
           response.sendRedirect("Gorev.jsp");
        }
            
     
                                                            
    
    }
    
 }