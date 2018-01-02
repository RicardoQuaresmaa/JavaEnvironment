<%@ page import="java.sql.*"%>  
  <%@page import="Connection.*"%>
<%  
    
String s=request.getParameter("val");

if(s.isEmpty()){  

}else{  
int id=Integer.parseInt(s);  
//out.print(id);   
 Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
     Statement stmt = null;
     ResultSet rs = null;
     String SQL="select Aciklama,Resim from UrunKisimProblem where ID="+id;
                            
stmt = con.createStatement();
                rs = stmt.executeQuery(SQL);       
while(rs.next()){  
      String b644 =javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("Resim"));
out.print(b644);  
}  
con.close();  
}
  
%>  



              


