
import java.io.IOException;

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

 

 
 
 @WebServlet(
         urlPatterns="/OperasyonAdmin",
        name = "Msdffgfdgdfghdejys675yfr3",
        description = "This is my first annotated servlet"   
)
 
 
 
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class OperasyonAdmin extends HttpServlet 

{
    

     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        

            

          String CalisanID;
          CalisanID=request.getSession().getAttribute("ID_").toString();
          int Calisan_ID=Integer.parseInt(CalisanID);
  


           
          int Problem_ID=Integer.parseInt(request.getParameter("ProblemID"));
          
          
          int Sebep_ID=Integer.parseInt(request.getParameter("sebebidd"));
          
           int Servis_ID=Integer.parseInt(request.getParameter("servisidd"));
        
          String Aciklama = request.getParameter("Aciklama");
          
         String ServisAciklama = request.getParameter("ServisAciklama");
        
        
        
       /*

     int Calisan_ID=1;
           
          int Problem_ID=Integer.parseInt(request.getParameter("ProblemID"));
          
          
          int Sebep_ID=1;
          
           int Servis_ID=1;
        
          String Aciklama = "bny";
          
         String ServisAciklama = "bny";
    */
                                                
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        

        
        
            
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
            
            String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
               String sql ="EXEC OperasyonInsert @ArizaBulteniOley_ID=?,@Calisan_ID=?,@OleyServis_ID=?,@Sebep_ID=?,@Aciklama=?,@ServisAciklama=?";
               
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, Problem_ID);
            statement.setInt(2, Calisan_ID);
            statement.setInt(3, Servis_ID);
            statement.setInt(4, Sebep_ID);
            statement.setString(5, Aciklama);
            statement.setString(6,ServisAciklama);
            
              
                     
            
            
            
            
         
             
        
           
            
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
            
        
            
            
            
            
            
            
            
            
            
            
            
            
            
        
        
        
                                                          
            try {
            // connects to the database
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
          
                                String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
            
             String sql = "EXEC CaseSonlandir @CaseID="+Problem_ID;
              
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
           
          // response.sendRedirect("Bulten.jsp");
        }
            
     
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            String MailKonu="";
            String MailIcerik="";            
            String IDDDDD="";
                String Sayfa="";
                String Baslangic="";
                String Bitis="";     
                String Sure="";     
                String CaseAcan="";
               String OperasyonYapan="";               
                String ArizaServis="";
                 String ArizaServisAciklama="";
                  String OperasyonAciklama="";                  
                  String ArizaSebep="";               
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
           
             String SQL00798 = "select * from KapaliCaseMail kcm where Case_ID="+Problem_ID;
              
              
         
                  stmt177 = conn192.createStatement();
                rs93 = stmt177.executeQuery(SQL00798);   
                
                 
                
         
             while(rs93.next())
             {
                 
                 IDDDDD=rs93.getString("Case_ID");
                  ProblemAdi=rs93.getString("ProblemAdi");
                 Sayfa=rs93.getString("Sayfa");
                 Baslangic=rs93.getString("CaseBaslangic");
                 Bitis=rs93.getString("CaseBitis");
                 Sure=rs93.getString("Sure");
                 CaseAcan=rs93.getString("CaseAcan");
                 OperasyonYapan=rs93.getString("OperasyonYapan");                 
                 ArizaServis=rs93.getString("ArizaServis");
                 ArizaServisAciklama=rs93.getString("ArizaServisAciklama");
                 OperasyonAciklama=rs93.getString("operasyonAciklama");
                 ArizaSebep=rs93.getString("ArizaSebep");                                 
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
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
                  
          
                              
        Connection conn1009=null; // connection to the database
              ResultSet rs9007=null;             
            Statement stmt1009=null;     
         
            
        
       
          
         

            
            try {
            // connects to the database
             
        
        ArrayList MailAdresleri=new ArrayList();
            
                            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            
            
            String dbURL_=BaglantiData.dbURL();
            String dbUser_=BaglantiData.dbUser();
       String dbPass_=BaglantiData.dbPass();
       
        conn1009 = DriverManager.getConnection(dbURL_, dbUser_, dbPass_);  
           
              String sql55 = "select MailAdresi from MailAdresi where Aktif_Pasif=1";
              
              
         
                  stmt1009 = conn1009.createStatement();
                rs9007 = stmt1009.executeQuery(sql55);    
         
             while(rs9007.next())
             {
                 String frr=rs9007.getString("MailAdresi");
             MailAdresleri.add(frr);
             }
              
            int len=MailAdresleri.size();
            
            String[] Mailler=new String[len];
            
            
                for (int i = 0; i < len; i++) 
                {                
                    Mailler[i]=MailAdresleri.get(i).toString();                    
                }
                
                MailKonu="No: "+IDDDDD+" Oley.com - "+Sayfa+" sayfası - "+ProblemAdi;
                
                
                
               MailIcerik="\n Merhaba ;\n\n İlgili problem sonlanmıştır.\n\n Süre :" +Sure+"\n\n Sonlanma Zamanı :        "+Bitis+  "  \n Operasyon Yapan  :        "  +OperasyonYapan+   "\n Operasyon Açıklama  :    "+OperasyonAciklama+"\n Problem Sebep  :          "  +ArizaSebep+"\n Servis Açıklama  :          "+ArizaServis+"-"+ArizaServisAciklama   +  "   \n\n İyi Çalışmalar";
                        
               
                EPostaYolla.EPostaYolla.MailGonderMotedu(Mailler,MailKonu,MailIcerik);
                                                                                                                 
        } catch (SQLException ex) {

        } finally {
            if (conn1009 != null) {
                // closes the database connection
                try {
                    conn1009.close();
                } catch (SQLException ex) {
                }
            }
            // sets the message in request scope
        
             
            // forwards to the message page
         //  getServletContext().getRequestDispatcher("/SirketKayit.jsp").forward(request, response);
           response.sendRedirect("AdminBulten.jsp");
  
        }
        

     
                                                            
    
    }
    
 }