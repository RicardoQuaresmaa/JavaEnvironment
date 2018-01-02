
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
         urlPatterns="/ProblemGorev",
        name = "MyOwnS876jghjfdtfvfvfxdvtre5y3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class ProblemGorev extends HttpServlet 

{
    
    
  
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
             Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        
        
   
        String islem=request.getParameter("islem_name");
  
        
        
        if ("insert".equals(islem)) 
        
        {                                 
         int gorevid=Integer.parseInt(request.getParameter("gorevid_kamyon_name"));
           
        int problemid=Integer.parseInt(request.getParameter("problemid_kamyon_name"));
        
        String ProblemGorevAciklama=request.getParameter("problemgorevaciklama_kamyon_name");
               
        try {
        
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
       
                                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
               String sql = "INSERT INTO ProblemGorev(UrunKisimProblem_ID,Gorev_ID,SorumlulukAciklama) values (?,?,?)";
               
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1,problemid);
            statement.setInt(2,gorevid);
            statement.setString(3,ProblemGorevAciklama);
                      
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
           
           response.sendRedirect("ProblemeGorevAta.jsp");
        }
            
        }
        
        

        
        
        else if ("delete".equals(islem)) 
        
        {
            
        int gorevid_sil=Integer.parseInt(request.getParameter("gorevid_tir_name"));
        int problemid_sil=Integer.parseInt(request.getParameter("problemid_tir_name"));   
        
  

        try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
         
                                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
               String sql = "delete from ProblemGorev  WHERE UrunKisimProblem_ID="+problemid_sil+"and Gorev_ID="+gorevid_sil;
               
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
           
           response.sendRedirect("ProblemeGorevAta.jsp");
        }
                                                
        }
        
        else
            
        {
        response.sendRedirect("ProblemeGorevAta.jsp");
        }
                                                                                                                                                                                                                                                   
    }
    
 }