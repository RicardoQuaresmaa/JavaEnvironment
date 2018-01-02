
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
         urlPatterns="/UrunInsert",
        name = "MyOwnServletfds345k87tlıgr",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class UrunInsert extends HttpServlet 

{
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
       
        
        String Adiii = request.getParameter("Urunnn_adiii_t");
        
         String Sirket_IDDDy=request.getParameter("Sirket_ID_dd");
       
        
       
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
 
                               
            try {
            // connects to the database
            
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
         
                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql99 = "INSERT INTO Urun (Sirket_ID,Ad) values (?,?)";
            PreparedStatement statement7 = conn.prepareStatement(sql99);
            statement7.setInt(1,Integer.parseInt(Sirket_IDDDy));
       //     statement7.setInt(1,1134);
         statement7.setString(2,Adiii);
         
           
            
            int row = statement7.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) 
        
        {
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
           
           response.sendRedirect("Urun.jsp");
        }
            
        
        
        
      
        
        
        
        
     
    
    }
    
    
}
