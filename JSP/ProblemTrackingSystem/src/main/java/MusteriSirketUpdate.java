
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;
 

 
 
 @WebServlet(
         urlPatterns="/MusteriSirketUpdate",
        name = "MyOwnServledfsef4tredfyt1r4",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class MusteriSirketUpdate extends HttpServlet 

{
    
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
        
        String Adi = request.getParameter("sirketadii");
    
String gunclogo=request.getParameter("logoguncvarmi");
        
        String Sirket_IDDtt = request.getParameter("ID_beeem");
        
       int Sirket_ID=Integer.parseInt(Sirket_IDDtt);
       
         Boolean Akt_Psf=false;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            Akt_Psf=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           Akt_Psf=false;
        }
                             
        // input stream of the upload file
         
        // obtains the upload file part in this multipart request
       
        
          Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        
        
        if ("marti".equals(gunclogo)) {
            
             InputStream inputStream = null;
            
             Part filePart = request.getPart("logo");
          // prints out some information for debugging
         //  System.out.println(filePart.getName());
         //  System.out.println(filePart.getSize());
          //  System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            
            try {
            // connects to the database
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
           
                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
                         
            // constructs SQL statement
            String sql = "UPDATE MusteriSirket SET Adi = ?,Logo = ?,Aktif_Pasif = ? WHERE ID="+Sirket_ID;
                           
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1,Adi);
                                    
            statement.setBlob(2, inputStream);
                        
         //   statement.setInt(4,Sirket_ID);
                     
            
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
           
           response.sendRedirect("MusteriSirket.jsp");
        }
            
        }
        
        
        else
            
        {
                                        
            try {
            // connects to the database
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
          
                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
                         
            // constructs SQL statement
            String sql = "UPDATE MusteriSirket SET Adi = ?,Aktif_Pasif = ? WHERE ID="+Sirket_ID;
                           
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1,Adi);
            
            statement.setBoolean(2,Akt_Psf);
            
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
           
           response.sendRedirect("MusteriSirket.jsp");
        }
            
            
            
            
            
        }
         
      
         
        
    }
    
    
}
