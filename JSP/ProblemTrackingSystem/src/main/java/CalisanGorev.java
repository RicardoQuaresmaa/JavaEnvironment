
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
         urlPatterns="/CalisanGorev",
        name = "MyOwnSgfds45fdsfsfdssau653",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class CalisanGorev extends HttpServlet 

{
    
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
             Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        
        
   
        String islem=request.getParameter("islem_name");
        
        
        if ("insert".equals(islem)) 
        
        {                                 
        int gorevid=Integer.parseInt(request.getParameter("gorevid_kamyon_name"));
        int calisanid=Integer.parseInt(request.getParameter("calisanid_kamyon_name"));
        
        try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
                                 String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
               String sql = "INSERT INTO CalisanGorev(Calisan_ID,Gorev_ID) values (?,?)";
               
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1,calisanid);
            statement.setInt(2,gorevid);
                      
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
           
           response.sendRedirect("CalisanaGorevAta.jsp");
        }
            
        }
        
        
        
        
        
        
        else if ("delete".equals(islem)) 
        
        {
            
        int gorevid_sil=Integer.parseInt(request.getParameter("gorevid_tir_name"));
        int calisanid_sil=Integer.parseInt(request.getParameter("calisanid_tir_name"));   
        
  

        try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
           
                                 String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
               String sql = "delete from CalisanGorev  WHERE Calisan_ID="+calisanid_sil+"and Gorev_ID="+gorevid_sil;
               
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
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/Sirket.jsp").forward(request, response);
           
           response.sendRedirect("CalisanaGorevAta.jsp");
        }
                                                
        }
        
        else
            
        {
        response.sendRedirect("CalisanaGorevAta.jsp");
        }
                                                                                                                                                                                                                                                   
    }
    
 }