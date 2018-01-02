
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.catalina.Session;
 

 
 
 @WebServlet(
         urlPatterns="/LoginControl",
        name = "MyOfgw54ngfS45egf5rvgflgfet",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class LoginControl extends HttpServlet 

{
    
    
    
     
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
       
        int bny=0;
     int bny1=0;
        
              String KullaniciAdi = (String)request.getParameter("KullaniciAdi_name"); 
              String Parola = (String)request.getParameter("Parola_name"); 
       
        
             ResultSet rs = null;    
             ResultSet rs1 = null;   
            Statement stmt = null;         
        Connection conn = null; // connection to the database
        
         
        
            
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
            
            String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
              String sql = "select ID from Calisan c where c.Aktif_Pasif=1 and c.KullaniciAdi='"+KullaniciAdi+"' and c.Sifre='"+Parola+"'";
              
              
         
                  stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);    
         
             while(rs.next())
             {
             bny=rs.getInt("ID");
             }
              
             String sql1 = "select a.ID from Admin a where a.ID="+bny;
             rs1=stmt.executeQuery(sql1);   
               
                 while(rs1.next())
             {
             bny1=rs1.getInt("ID");
             }
                
                if (bny1==1) {
                    
                       request.getSession().setAttribute("ID",bny);
                     response.sendRedirect("folder/sessionAdmin.jsp");
                     
                }
                
                else if (bny>1) {
                    
                       request.getSession().setAttribute("ID",bny);
                     response.sendRedirect("folder/session.jsp");
                }
                 
                else
                {
                response.sendRedirect("Login.jsp");
                }
                
                
                
                
                
            
          
        } catch (SQLException ex) {

        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
            // sets the message in request scope
        
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/SirketKayit.jsp").forward(request, response);
           
  
        }
            
        
        
        
        
        
        
        
     
    
    }
    
    
}
