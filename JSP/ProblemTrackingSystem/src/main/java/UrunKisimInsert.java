
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
         urlPatterns="/UrunKisimInsert",
        name = "MyOwnServlehgfdfshs546y65t",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class UrunKisimInsert extends HttpServlet 

{
    
    
  
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
       
        
             String urunkisimadi=request.getParameter("urunkisimadi_name");
        
         String Urun_ID=request.getParameter("UrunID_boztas");
       
        
       
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        
        String gunclogo=request.getParameter("gorselvarmi");   
   
        
        
        
        
        
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
           
               String sql = "INSERT INTO UrunKisim (Urun_ID,Ad,Resim) values (?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
          
            statement.setInt(1,Integer.parseInt(Urun_ID));
            
            statement.setString(2,urunkisimadi);
         
               
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputStream);
            }
           
            
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
           
           response.sendRedirect("UrunKisim.jsp");
        }
            
        }
        
        
        else if (!"marti".equals(gunclogo)) 
            
        {
                                        
            try {
            // connects to the database
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
      
                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
                                             
             String sql = "insert into UrunKisim(Ad,Urun_ID) values (?,?)";
             
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1,urunkisimadi);
            statement.setInt(2,Integer.parseInt(Urun_ID));
         
 
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
           
           response.sendRedirect("UrunKisim.jsp");
        }
            
            
            
            
            
        }
        
        
        
        
     
    
    }
    
    
}
