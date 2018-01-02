<%@page import="Connection.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Panel</title>
<link rel="shortcut icon" href="img/admin.png"/>
<link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bny.css" rel="stylesheet" type="text/css"      
<link href="CalisanDisKaynak/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>  
<script src="CalisanDisKaynak/bootstrap-combobox.js" type="text/javascript"></script>    
<script src="CalisanDisKaynak/jquery-1.12.3.js" type="text/javascript"></script>
<script src="CalisanDisKaynak/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="CalisanDisKaynak/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>  
  <link href="CalisanDisKaynak/bootstrap.min.css" rel="stylesheet" type="text/css"/>                                                     
  <link href="CalisanDisKaynak/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
  
                          
                    
                <style>                                                                                                   
    #example_filter
    {     
        width:280px;  
        margin-top:-10px;
    margin-right:20px;
       
    }
     
    
     #example_filter input
    {              
        width:170px;
    }
   
    
    
       #example_length 
    {              
       
   display:none;
    }
    
   
   
    
      #example_filter label
    {     
       font-size:17px;    
    }
    
   

      
      
      
      #example1_wrapper
{
  width:1160px;
  height:300px;
}
      
         
      #example1_paginate
    {     
       font-size:17px;    
         width:600px;
  height:70px;
    float:left;
   margin-top:-20px;  
   font-size:10px;
   margin-left:-285px;

    }
      
        #example1_filter label
    {     
       font-size:17px;    
    }
    
    
       #example1_length label
    {              
       
 font-size:17px;    
    }
      
                </style>    
                                                          
                                                                                                                                                                                                                                                                                   
</head>
    
<body>         
    
    
                                        <%  
                                           String AdSoyad="";
                                           String bytes="";
                                            if (request.getSession().getAttribute("ID_")==null) {
                                                       response.sendRedirect("Login.jsp");
                                                }
                                            
                                          else  if (request.getSession().getAttribute("adsoyad")!=null) {
                                                    AdSoyad=request.getSession().getAttribute("adsoyad").toString();
                                                    bytes=request.getSession().getAttribute("bytee").toString();
                                                }
                                           
                                         
                                            
int problem__ID=Integer.parseInt(request.getParameter("ProblemID"));
 

             ResultSet rs = null;               
            Statement stmt = null;         
        Connection conn = null;
                                                 
                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    conn = DriverManager.getConnection(db_bny);  
                                                                                    
              
              
        String b644="";
        String b645="";
                String b646="";
                        String b647="";
                                String b648="";
           
              String sql = "select * from bultengorsel where ID="+problem__ID;
              
              
         
                  stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);    
         
             while(rs.next())
             {
               b644 = javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("resim"));
                 b645 = javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("disk"));
                 b646 = javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("servis"));
                 b647 = javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("problemresim"));
                 b648 = javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("sayfa"));
             }
              
                                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909;">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import6/ust6.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
      
      
      
      

      
    
            
            <div class="panel panel-default" onmouseover="butonkontrol();" style="width:1300px;height:450px;margin:0 auto;position: relative;background-color:#540909;">
                                                           
                    <div class="panel-body" style="height:100%;width:100%;">
                
                            
           
    
                     <form role="form" action="OperasyonAdmin.jsp"  runat="server" method="get" enctype="multipart/form-data" id="formiste" name="NewForm116"     >
                           <input type="hidden" id="ProblemID" name="ProblemID" value="<%=problem__ID%>"> 
                        </form>
                             
                        
                        <div class="row" style="width:100%;height:100%;">
                            
                            
                            <div class="col-sm-3" style="height:100%;">
                                
                                
                                <div class="row" style="height:50%;">
                                    
                                    <img id="OleySayfa" src="" style="width:100%;height:97%;" alt=""/>
                                    
                                </div>
                                
                                
                                <div class="row" style="height:50%;">
                                    
                                       <img id="Problem" style="width:100%;height:97%;" alt=""/>
                                    
                                </div>;
                                
                                
                              
                                
                            </div>
                            
                            <div class="col-sm-6" style="height:100%;">
                                
                                   <img id="CaseResim" style="height:100%;width:100%;" alt=""/>
                                
                            </div>
                            
                            <div class="col-sm-3" style="height:100%;">
                                
                                <img id="servis" style="width:100%;height:48%;" alt=""/>
                                
                                 <img id="disk" style="width:100%;height:48%;margin-top:8px;" alt=""/>
                                
                            </div>
                          
                             
                            
                        </div>
                        
                        
                        
                                                                        
                        
                            
                            
                            
                        
                                
                                
                                
            
                       
        
        
    
        
            
            
        
        
        
                                 
              
        
        
        
 
                         
                         
                      
                        
          
                                
                                                                                                                                                                                                                                              
                     </div>

  </div>
            
      
       
      
      
      
      
      
   
     
      
  
      
         
      
           
                            
 
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import4/alt4.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                                                                                                                                                                                                                                                        



 
$(document).ready(function() {
    
  $('#adsoyadli').text("<%=AdSoyad%>");
  displayImage1("<%=bytes%>");

 
  displayImage("<%=b644%>","OleySayfa");
  displayImage("<%=b645%>","Problem");
  displayImage("<%=b646%>","CaseResim");
  displayImage("<%=b647%>","servis");
  displayImage("<%=b648%>","disk");

    

    
    
  
  $('#CaseResim').on('dblclick', function () {
                      
        /*
         var element = $(this);
         var idddf = element.attr("id");
        GorevFiltreDepartman(idddf);
             */
            
        //    alert($('#ProblemIDDDD').val());
            
            $('#formiste').submit();
});

  
  
  
    
                                           
});





function displayImage1(byte)

{                       
    
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}






function displayImage(byte,iddegeri)

{                       
    
     $('#'+iddegeri).attr('src', "data:image/png;base64," +byte);    
}









    

 
    
    




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      

    























