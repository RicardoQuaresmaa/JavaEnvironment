
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
         urlPatterns="/ProblemUpdate",
        name = "MyOwnSerfdfsdgdf5f45435t",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class ProblemUpdate extends HttpServlet 

{
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
        
 
        
         
        
         String problemadi=request.getParameter("problemadi_name");
       //  String problemadi="bnybny";
       
        
        String problemaciklama=request.getParameter("problemaciklama_name");
      // String problemaciklama="bnybny";
        
 
        
        
   int UrunKisimProblem_ID=Integer.parseInt(request.getParameter("UrunKisimProblem_ID_name"));  
  
 // int UrunKisimProblem_ID=102;
         
         
        

         
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
                            
         //   String sql99 = "UPDATE Urun SET Sirket_ID = ?,Ad = ?,Aktif_Pasif = ? WHERE ID="+Urun_ID;
               String sql = "UPDATE UrunKisimProblem SET ProblemAdi = ?,Aciklama=?,Resim=? WHERE ID="+UrunKisimProblem_ID;
               // String sql = "INSERT INTO UrunKisim (Urun_ID,Ad,Resim) values (?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
          
           
            
            statement.setString(1,problemadi);                        
               
                statement.setString(2,problemaciklama);
                    
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
           
           response.sendRedirect("Problem.jsp");
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
                                     
                                             
                                          String sql = "UPDATE UrunKisimProblem SET ProblemAdi = ?,Aciklama=? WHERE ID="+UrunKisimProblem_ID;
               // String sql = "INSERT INTO UrunKisim (Urun_ID,Ad,Resim) values (?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
          
            
            
            statement.setString(1,problemadi);                        
               
                statement.setString(2,problemaciklama);
                    
           
                                                             
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
           
           response.sendRedirect("Problem.jsp");
        }
            
            
            
            
            
        }
        
        
        
        
     
    
    }
    
    
}
