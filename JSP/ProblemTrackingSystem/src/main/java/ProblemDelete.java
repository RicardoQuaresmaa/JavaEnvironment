
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
         urlPatterns="/ProblemDelete",
        name = "MyOwhhtyh64sdfsdf545435t",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class ProblemDelete extends HttpServlet 

{
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
   
        
        
   int UrunKisimProblem_ID=Integer.parseInt(request.getParameter("UrunKisimProblem_ID_name"));  
  

         
         
        

         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        
       
                                        
            try {
            // connects to the database
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
       
                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
                                     
                                             
            String sql = "delete from UrunKisimProblem WHERE ID="+UrunKisimProblem_ID;
      
            PreparedStatement statement = conn.prepareStatement(sql);
                                           
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
         
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/Sirket.jsp").forward(request, response);
           
           response.sendRedirect("Problem.jsp");
        }
            
            
            
            
            
        
        
        
        
        
     
    
    }
    
    
}
