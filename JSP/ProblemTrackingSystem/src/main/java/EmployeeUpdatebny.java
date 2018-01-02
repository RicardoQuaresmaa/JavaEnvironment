
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
         urlPatterns="/EmployeeUpdatebny",
        name = "MyOwnfge5t4etgtusfd66ut",
        description = "This is my first annotated servlet"   
)
   
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class EmployeeUpdatebny extends HttpServlet 

{
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
                 
        String Calisanisim= request.getParameter("Calisanisimttt");        
        String Calisansoyisim= request.getParameter("Calisansoyisimttt");
        String Calisankullaniciadi= request.getParameter("Calisankullaniciadittt");
        String calisanparola= request.getParameter("Calisanparolattt");
        String demirperde= request.getParameter("demirperde");
 
        /////////////////////
        
        
        
        
        
        
        
        
        String Calisan_IDDtt = request.getParameter("ID_bmmmmm");
        
       int Calisan_ID=Integer.parseInt(Calisan_IDDtt);
       
         Boolean Akt_Psf=false;
  
        if ("akt".equals(request.getParameter("optradio"))) {
            Akt_Psf=true;
        }
        
        else if ("psf".equals(request.getParameter("optradio"))) {
           Akt_Psf=false;
        }
                                                                        
        /////////////////////
                    
        Part filePart = request.getPart("logoo");   
      InputStream inputStream =filePart.getInputStream();    
      
      
     //   String gunclogo=request.getParameter("logoguncvarmi");
                                                        
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        if ("marti".equals(request.getParameter("logoguncvarmi"))) 
        
        {
                                                
             try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
          
                                 String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql = "UPDATE Calisan SET Ad = ?,Soyad= ?,KullaniciAdi=?,Sifre=?,DogumTarihi=?,Resim=?,Aktif_Pasif= ? WHERE ID="+Calisan_ID;
            PreparedStatement statement = conn.prepareStatement(sql);
           
            /*
            statement.setString(1,request.getParameter("Calisanisimttt"));
            statement.setString(2,request.getParameter("Calisansoyisimttt"));
            statement.setString(3,request.getParameter("Calisankullaniciadittt"));
            statement.setString(4,request.getParameter("Calisanparolattt"));
            statement.setString(5,request.getParameter("demirperde"));
          */
            
             
            statement.setString(1,Calisanisim);
            statement.setString(2,Calisansoyisim);
            statement.setString(3,Calisankullaniciadi);
            statement.setString(4,calisanparola);
            statement.setString(5,demirperde);
            statement.setBlob(6,inputStream);
            statement.setBoolean(7,Akt_Psf);
            
                                            
            /*
            statement.setString(1,"bny");
            statement.setString(2,"bny");
            statement.setString(3,"bny");
            statement.setString(4,"bny");
            statement.setString(5,"2016/07/07");
            */
            
         

           
            
            int row = statement.executeUpdate();
            
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
            request.setAttribute("Message", message);
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/Sirket.jsp").forward(request, response);
           
           response.sendRedirect("Calisan.jsp");
        }
            
        
            
            
            
        }
        
        
        
        else   
            
        {
            
            
            
            
             try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
        
                                 String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
                 String sql = "UPDATE Calisan SET Ad = ?,Soyad= ?,KullaniciAdi=?,Sifre=?,DogumTarihi=?,Aktif_Pasif= ? WHERE ID="+Calisan_ID;
            PreparedStatement statement = conn.prepareStatement(sql);
           
            /*
            statement.setString(1,request.getParameter("Calisanisimttt"));
            statement.setString(2,request.getParameter("Calisansoyisimttt"));
            statement.setString(3,request.getParameter("Calisankullaniciadittt"));
            statement.setString(4,request.getParameter("Calisanparolattt"));
            statement.setString(5,request.getParameter("demirperde"));
          */
            
             
            statement.setString(1,Calisanisim);
            statement.setString(2,Calisansoyisim);
            statement.setString(3,Calisankullaniciadi);
            statement.setString(4,calisanparola);
            statement.setString(5,demirperde);
             statement.setBoolean(6,Akt_Psf);
                                            
            /*
            statement.setString(1,"bny");
            statement.setString(2,"bny");
            statement.setString(3,"bny");
            statement.setString(4,"bny");
            statement.setString(5,"2016/07/07");
            */
            
        //    statement.setBlob(6,inputStream);

           
            
            int roww = statement.executeUpdate();
            
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
            request.setAttribute("Messagee", message);
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/Sirket.jsp").forward(request, response);
           
           response.sendRedirect("Calisan.jsp");
        }
            
        
        
        
        }
                                                                                                                                         
           
        
        
        
        
        
        
        
     
    
    }

    
    
}
