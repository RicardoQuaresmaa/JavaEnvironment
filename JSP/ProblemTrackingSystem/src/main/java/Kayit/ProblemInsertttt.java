package Kayit;



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
         urlPatterns="/ProblemInsertttt",
        name = "MyOwnSeghgfhgf6y65t",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class ProblemInsertttt extends HttpServlet 

{
    
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
       
        
           String urunKisim_ID=request.getParameter("UrunKisim_ID_namename");
         //   String urunKisim_ID="27";
        
         String problemadi=request.getParameter("problemadi_name");
       //  String problemadi="bnybny";
       
        
        String problemaciklama=request.getParameter("problemaciklama_name");
      // String problemaciklama="bnybny";
       
         
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
            
                                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql = "INSERT INTO UrunKisimProblem (UrunKisim_ID,ProblemAdi,Aciklama,Resim) values (?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
          
            statement.setInt(1,Integer.parseInt(urunKisim_ID));
            
            statement.setString(2,problemadi);
         
            statement.setString(3,problemaciklama);
               
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
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
           
           response.sendRedirect("Kayit/Problem.jsp");
        }
            
        }
        
        
        else if (!"marti".equals(gunclogo)) 
            
        {
                                        
            try {
            // connects to the database
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
          
                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
                                             
             String sql = "INSERT INTO UrunKisimProblem (UrunKisim_ID,ProblemAdi,Aciklama) values (?,?,?)";
             
            PreparedStatement statement = conn.prepareStatement(sql);
            
           
              statement.setInt(1,Integer.parseInt(urunKisim_ID));
            
            statement.setString(2,problemadi);
         
            statement.setString(3,problemaciklama);
         
 
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
           
           response.sendRedirect("Kayit/Problem.jsp");
        }
            
            
            
            
            
        }
        
        
        
        
     
    
    }
    
    
}
