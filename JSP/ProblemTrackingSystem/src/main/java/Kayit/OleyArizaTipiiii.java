package Kayit;



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
         urlPatterns="/OleyArizaTipiiii",
        name = "MyOwnSgfdfsds45fdgd655tdrs53",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class OleyArizaTipiiii extends HttpServlet 

{
    
    
   
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
             Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
                          
        
                              
        int arizaid=Integer.parseInt(request.getParameter("ariza_id_name"));
        
          String islem=request.getParameter("insert_update_name");
          
          
        
        Boolean mutabakatEtkisi=true;
  
        if ("akt".equals(request.getParameter("optradio1"))) {
            mutabakatEtkisi=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio1"))) {
           mutabakatEtkisi=false;
        }
        
        
        
        
        Boolean kuponEtkisi=true;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            kuponEtkisi=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           kuponEtkisi=false;
        }
        
        
        if ("insert".equals(islem)) 
        
        {
            
            ///////////////////////
        try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
           
                                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
               String sql = "insert into OleyArizaTip(ID,MutabakatEtkisi,KuponEtkisi) values(?,?,?)";
               
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1,arizaid);
            statement.setBoolean(2,mutabakatEtkisi);
            statement.setBoolean(3,kuponEtkisi);
                      
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
           
           response.sendRedirect("Kayit/OleyArizaTipi.jsp");
        }   
        
        
        //////////////////////////////
            
        }
        
        else if ("update".equals(islem)) 
        
        {
            
            
            ///////////////////////
        try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
                                String dbURL_=BaglantiDataa.dbURL();
            String dbUser_=BaglantiDataa.dbUser();
       String dbPass_=BaglantiDataa.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
               String sql = "update OleyArizaTip set MutabakatEtkisi=?,KuponEtkisi=? WHERE ID="+arizaid;
               
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setBoolean(1,mutabakatEtkisi);
            statement.setBoolean(2,kuponEtkisi);
                      
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
           
           response.sendRedirect("Kayit/OleyArizaTipi.jsp");
        }   
        
        
       
            
        }
        
        
        
                                                                                                                                                                                                                                                   
    }
    
 }