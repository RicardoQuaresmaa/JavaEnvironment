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
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bny.css" rel="stylesheet" type="text/css"
      <link href="CalisanDisKaynak/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>
      <script src="CalisanDisKaynak/bootstrap-combobox.js" type="text/javascript"></script>
      <script src="CalisanDisKaynak/jquery-1.12.3.js" type="text/javascript"></script>
      <script src="CalisanDisKaynak/jquery.dataTables.min.js" type="text/javascript"></script>
      <script src="CalisanDisKaynak/dataTables.bootstrap.min.js" type="text/javascript"></script>
      <link href="CalisanDisKaynak/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="CalisanDisKaynak/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
                                                              
                <style>
                    
            ul.pagination
            {
                
                margin-top:8px;
            }
                    
                  
                    div.dataTables_length {
    padding-left: 1em;
    }
    div.dataTables_length{
        font-size:3px;   
        
    }
    div.dataTables_filter {
        padding-top:0.1em;
      
    }
    div.dataTables_info
    {
    font-size:12px;    
   margin-top:8px;
    }
     
    div.dataTables_wrapper
    {
        font-size:15px;
        width:470px;
    }
    
    #example_filter
    {     
        width:280px;  
        margin-top:-10px;
    }
    
    
    #example_length label
    {
        font-size:15px;
    }
    
     #example_length label
    {
        margin-top:-8px;
    }
    
    
      #example_filter label
    {     
       font-size:15px;    
    }
    
    
     #example_filter input
    {              
        width:150px;
    }
    
    
#example_paginate
{
    width:460px;
  height:30px;
    float:left;
   margin-top:0px;  
   font-size:10px;
   margin-left:-255px;
   
}

#example_wrapper
{
    
}



#example_previous
{width:70px;}

#example_next
{margin-left:10px;}

.paginate_button
{
    width:40px;
    height:20px;  
    font-size:10px;
}

    div.dataTables_paginate
    {
       margin-top: 5px;             
    }
                            
                </style>    
                    
                    
                  
    
    
    
    
    
</head>
    
    <body style="background-color:#0F0F0F;">         
    
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
     %>
                                        <%  
                                            
                                      int problem__ID=Integer.parseInt(request.getParameter("ProblemID"));      
                                            
   Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
                ResultSet rsr = null;      
                ResultSet rsr1 = null;  
                ResultSet rsr2 = null;
           
                
 
   
   String SQL12 = "select oas.ID,oas.Ad from OleyArizaSebep oas where oas.Aktif_Pasif=1";
   
   String SQL11 = "select ID,Adi from OleyServis where Aktif_Pasif=1";
   

            
              stmt = con.createStatement();
                rsr = stmt.executeQuery(SQL11);                
                 
%>
  
    
        <div class="container" id="wrapper" style="height:99%;width:100%;background-color:#540909">
            
   <div class="row" style="height:11%;">
       
            <c:import url="import4/ust4.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:80%;">
   
              
  
        
      <div class="col-sm-12">
          
                              
                <div class="panel panel-default" style="width:600px;height:485px;margin:0 auto;margin-top:3%;">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:85%">
                         
                         
                        <form role="form" id="form2" name="NewForm11" action="Operasyon" runat="server" method="post" enctype="multipart/form-data" >
      

      <input type="hidden" id="servisidd" name="servisidd"/>
      <input type="hidden" id="ProblemID" name="ProblemID" value="<%=problem__ID%>"/>
      <input type="hidden" id="sebebidd" name="sebebidd"/>
      
       <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Açıklama :</label>
    
    <textarea  id="Aciklama" name="Aciklama" onkeyup="butonkontrol();"  style="font-size:13px;height:100px;width:100%;"></textarea>
  </div>
      
      

         <div class="form-group" style="margin-left:10%;width:100%">
  <select id="servisler" class="form-control" name="urunov" onchange="icazet();" style="font-size:17px;width:95%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Servis Seçiniz</option>
    
      <%  
          while(rsr.next()){ %>
        
      <option class="urun" id="<%= rsr.getInt("ID")%>"  adi="<%= rsr.getString("Adi")%>"><%= rsr.getString("Adi")%></option>
        <% } %>
        
        </select>      
  </div> 
        
      
       <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Servis Açıklama :</label>
   
    <textarea   id="ServisAciklama" name="ServisAciklama"   onkeyup="butonkontrol();"  style="font-size:13px;height:100px;width:100%;">

</textarea>
  </div>
      
       
      
       <div class="form-group" style="margin-left:10%;width:100%">
     <select id="sebebler" class="form-control" name="urunkisimov" onchange="icazet();" style="font-size:17px;width:95%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Sebep Seçiniz</option>
    
      <%  rsr1 = stmt.executeQuery(SQL12);   
      while(rsr1.next()){ %>
        
      <option class="urunkisim" id="<%= rsr1.getInt("ID")%>" ad="<%= rsr1.getString("Ad")%>"><%= rsr1.getString("Ad")%></option>
        <% } %>
        
        </select>  
  </div>
                     
                 
        <div class="row" style="margin-left:10%;width:100%">
            
                 
            
            <div class="col-sm-12">
                   <button class="btn btn-default" type="submit" id="butonnn"  style="width:60%;padding-left:3%;margin-left:20%;">CASE SONLANDIR</button>
                
                
            </div>
            
        </div>            
                               
                                
                          
                    
        
</form>
             
            
         
        

                    

                                                   
                     </div>
  </div>
        
        
          
      </div>
    
        
                        
      
        
       
    
   

    </div>
        
        
   
    <div class="row" style="height:5%;">
        
      
   <div id="copyright"  style="height:100%;margin-top:2%;" >
    <p style="">&copy; Untitled. All rights reserved. |  Design by Monitoring Departmen of Broadage Sports & oley.com & İddaa.com</p>
</div>
          
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                   
                   
             




           
                   


 


 
$(document).ready(function() {
    
    
     $('#adsoyadli').text("<%=AdSoyad%>");
  displayImage("<%=bytes%>");
    
    
    $('#butonnn').attr('disabled',true);  
  
$('#Aciklama').val("");
$('#ServisAciklama').val("");


             




  $('#servisler').on('click', 'option', function () {
         
         

         var element = $(this);    
         var idddf = element.attr("id");
         $('#servisidd').val(idddf);
                 butonkontrol();    
});
    
    
    
    
    
      $('#sebebler').on('click', 'option', function () {
         
         
    
         
         var element = $(this);    
         var burccc = element.attr("id");
            $('#sebebidd').val(burccc);
              
            
      butonkontrol();
     
            
});



                

   
  
    
    
    
                                       
});


function displayImage(byte)

{                       
    
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}


function butonkontrol()
    {
        var lll1=$('#sebebidd').val().length;
          var lll2=$('#servisidd').val().length;
            var lll3=$('#Aciklama').val().length;
              var lll4=$('#ServisAciklama').val().length;
        
        
    //    alert(lll1+' '+lll2+' '+lll3+' '+lll4);
        
        if (lll1>0 && lll2>0 && lll3>0 && lll4>0  )
{
    
     $('#butonnn').attr('disabled',false);  
    
}

else {
	  $('#butonnn').attr('disabled',true);  
}


    }




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
