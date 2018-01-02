
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.catalina.Session;
 

 
 
 @WebServlet(
         urlPatterns="/BultenOlusturInsertt",
        name = "M5e6yOwnS6456ervjgthjg45le546t",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class BultenOlusturInsertt extends HttpServlet 

{
    
    
     // database connection settings
     /*
    private String dbURL = "jdbc:sqlserver://localhost:9563;"
                        + "databaseName=ProblemTrackingSystem";
    private String dbUser = "Broadage";
    private String dbPass = "oley";
     */
     
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
          String CalisanID="";
        
          
          
   

         CalisanID=request.getSession().getAttribute("ID_").toString();

      
         
          int Calisan_ID=Integer.parseInt(CalisanID);
        int ArizaTipi =Integer.parseInt(request.getParameter("ArizaTipi_ID")) ;                
        int ArizaEtki=Integer.parseInt(request.getParameter("ArizaEtki_ID"));
         
                              
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
                                 
             InputStream inputStream = null;
             InputStream inputStream1 = null;
             InputStream inputStream2 = null;
            
             Part filePart = request.getPart("logo");
             Part filePart1 = request.getPart("logo1");
             Part filePart2 = request.getPart("logo2");
             
     
            inputStream = filePart.getInputStream();
            inputStream1 = filePart1.getInputStream();
            inputStream2 = filePart2.getInputStream();
            
       
            
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
            
            String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql ="EXEC BultenInsert @OleyArizaTipi=?,@CaseAcan = ?,@CaseResim=?,@SolarwindsServis =?,@SolarwindsDisk=?,@Etki=?";
               
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, ArizaTipi);
            statement.setInt(2, Calisan_ID);
            
               if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputStream);
            }
               
                  if (inputStream1 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream1);
            }
                  
                  
                     if (inputStream2 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(5, inputStream2);
            }
                     
            
            statement.setInt(6, ArizaEtki);
            
            
         
             
        
           
            
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
         //  getServletContext().getRequestDispatcher("/SirketKayit.jsp").forward(request, response);
               
           
        }
            
        
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            String MailKonu="";
            String MailIcerik="";
            
            String IDDDDD="";
                String Sayfa="";
                String Baslangic="";
                String DefaGoruldu="";
                String ProblemLast="";
                String KuponEtkisi="";
                String MutabakatEtkisi="";                        
                String CaseAcan="";
               
                String ProblemAdi="";
                String ProblemAciklama="";
            
            
            
            
        
         
       
          
            
              Connection conn192=null; // connection to the database
              ResultSet rs93=null;             
            Statement stmt177=null;     
                                                                   
            try {
            // connects to the database
                                       
          DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
          
            
            String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn192 = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
             String SQL00798 = "select  TOP 1 * from AcikCase a order by a.Case_ID desc";
              
              
         
                  stmt177 = conn192.createStatement();
                rs93 = stmt177.executeQuery(SQL00798);   
                
                 
                
         
             while(rs93.next())
             {
                 
                 IDDDDD=rs93.getString("Case_ID");
                 Sayfa=rs93.getString("Sayfa");
                 Baslangic=rs93.getString("CaseBaslangic");
                 DefaGoruldu=rs93.getString("AyniproblemSayi");
                 ProblemLast=rs93.getString("AyniProblemLast");
                 KuponEtkisi=rs93.getString("KuponEtkisi");
                 MutabakatEtkisi=rs93.getString("MutabakatEtkisi");
                 CaseAcan=rs93.getString("CaseAcan");
                 ProblemAdi=rs93.getString("ProblemAdi");
                 ProblemAciklama=rs93.getString("ProblemAciklama");
                 
           
             }
              
           
                                                                                                                 
        } catch (SQLException ex) {

        } finally {
            if (conn192 != null) {
                // closes the database connection
                try {
                    conn192.close();
                } catch (SQLException ex) {
                }
            }
            // sets the message in request scope
        
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/SirketKayit.jsp").forward(request, response);
       //    response.sendRedirect("Bulten.jsp");
  
        }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
          
                              
        Connection conn1=null; // connection to the database
              ResultSet rs9=null;             
            Statement stmt1=null;     
         
            
        
       
          
         

            
            try {
            // connects to the database
             
        
        ArrayList MailAdresleri=new ArrayList();
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
            
            String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn1 = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
              String sql55 = "select MailAdresi from MailAdresi where Aktif_Pasif=1";
              
              
         
                  stmt1 = conn1.createStatement();
                rs9 = stmt1.executeQuery(sql55);    
         
             while(rs9.next())
             {
                 String frr=rs9.getString("MailAdresi");
             MailAdresleri.add(frr);
             }
              
            int len=MailAdresleri.size();
            
            String[] Mailler=new String[len];
            
            
                for (int i = 0; i < len; i++) 
                {                
                    Mailler[i]=MailAdresleri.get(i).toString();                    
                }
                
                  MailKonu="No: "+IDDDDD+" Oley.com - "+Sayfa+" sayfası - "+ProblemAdi;
                
                
                
                MailIcerik="\n Merhaba ;\n\n Az önce oluşan problemin detaylı bilgileri aşağıdadır. \n\n Problem ID  :  "+IDDDDD+"\n Problem Adı  :  "+ProblemAdi+"\n Problem Açıklama  :  "+ProblemAciklama +"\n\n Başlangıç Zamanı  :  "+Baslangic+"\n Son Görülme Zamanı  :  "+ProblemLast+"\n Görülme Sayısı  :  "+DefaGoruldu+"\n\n Kupon Etkisi  :  "+KuponEtkisi+"\n Mutabakat Etkisi  :  "+MutabakatEtkisi+"\n Case Açan  :  "+CaseAcan+"\n\n İyi Çalışmalar";
                        
               
                EPostaYolla.EPostaYolla.MailGonderMotedu(Mailler,MailKonu,MailIcerik);
                                                                                                                 
        } catch (SQLException ex) {

        } finally {
            if (conn1 != null) {
                // closes the database connection
                try {
                    conn1.close();
                } catch (SQLException ex) {
                }
            }
            // sets the message in request scope
        
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/SirketKayit.jsp").forward(request, response);
           response.sendRedirect("Bulten.jsp");
  
        }
        

        
        
        
     
    
    }
    
    
}
