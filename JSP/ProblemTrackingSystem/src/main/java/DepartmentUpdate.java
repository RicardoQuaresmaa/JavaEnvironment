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
         urlPatterns="/DepartmentUpdate",
        name = "MyOwnServlet1r4sfdsfa",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class DepartmentUpdate extends HttpServlet 

{
    
  
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
       

     String Depim_IDr=request.getParameter("Depa_ID_dd");
     
     int Depim_ID=Integer.parseInt(Depim_IDr);
       
         Boolean Akt_Psf=false;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            Akt_Psf=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           Akt_Psf=false;
        }
        
        String Sirket_ID_bahce=request.getParameter("Sirket_ID_dd");
                
         int Sirket_ID_bahce_ID=Integer.parseInt(Sirket_ID_bahce);
        
                String ortadirek=request.getParameter("Departman_adiii_t");
               
          Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        
      
          
            
            try {
            // connects to the database
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
                 String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
                         
            // constructs SQL statement
            String sql65 = "UPDATE Departman SET Ad = ?,Sirket_ID = ?,Aktif_Pasif = ? WHERE ID="+Depim_ID;
          //    String sql65 ="UPDATE Departman SET Ad = 'betulummmmm benimsin',Sirket_ID = 114,Aktif_Pasif = 1 WHERE ID="+Depim_ID;
            PreparedStatement statement = conn.prepareStatement(sql65);
            
            statement.setString(1,ortadirek);
                                                   
           statement.setInt(2,Sirket_ID_bahce_ID);
        
      //  statement.setInt(2, Sirket_ID_bahce_ID);
                        
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
           
           response.sendRedirect("Departman.jsp");
        }
            
        }                                                                                                 
    }
    
    

