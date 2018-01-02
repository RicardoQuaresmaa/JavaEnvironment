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
                                                                                                                                                                                                                                                                                   
</head>
    
<body>         
     <%
     if (request.getSession().getAttribute("ID_")==null) {
                                                       response.sendRedirect("Login.jsp");
                                                }
     %>
    
                                        <%             
      Connection conn;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    conn = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
                ResultSet rsr = null;      
                ResultSet rsr1 = null;  
           ResultSet rsr2 = null;  
                
   String SQL = "select * from Calisan_view";
   
    

            
              stmt = conn.createStatement();
                rsr = stmt.executeQuery(SQL);                
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import3/ust3.jsp"></c:import>  
          
        </div>      
            
            
  <div class="row" style="height:75%;">
      
      <div class="col-sm-3"></div>
      
      <div class="col-sm-6">
          
          <img src="img/site-yapim-halinde.jpg" style="width:700px;height:400px;" alt=""/>
          
      </div>
      
      
      <div class="col-sm-3"></div>
      
     
      
      
      
  <!-----burası
      
       <div class="panel panel-default" style="width:350px;height:450px;margin-top:0%;float:left;margin-left:30px">
           
         
           
           <select id="Departman" class="form-control" name="Departmanov" style="font-size:19px;width:80%;height:40px;margin-top:3%;float:left;margin-left:25px;">
    <option class="placeholder" selected disabled value="" selected="true" >Ürün Seçiniz</option>
    
    
        
            <option class="sirket" value=""></option>
       
        
        </select>
                
           
           
               <select id="Departman" class="form-control" name="Departmanov" style="font-size:19px;width:80%;height:40px;margin-top:2%;float:left;margin-left:25px;">
    <option class="placeholder" selected disabled value="" selected="true" >Ürün Kısım Seçiniz</option>
    
    
        
            <option class="sirket" value=""></option>
       
        
        </select>
           
         
           
           
           
           
                <div class="panel-body" style="margin-top:100px;">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px" >
                
    
            </table>      
              
                    
                </div>
                
            </div>
      
      
      
      
      
      
      
      
  
      <div class="panel panel-default" onmouseover="butonkontrol();" style="width:950px;height:450px;margin-top:0%;float:left;margin-left:1%;">
                                                           
                    <div class="panel-body" style="height:100%;width:100%;">
                        
                        <div class="row" style="height:65%;width:100%;">
                            
                            <div class="col-sm-4" style="height:100%;">                                
                               <img id="blah" src=""  alt="" style="width:270px;height:270px;float:left;"/>
                            </div>
                            <div class="col-sm-8" style="height:100%;">
                                                        
                                <table id="example1" class="row-border" cellspacing="0" width="100%" height="20px" style="float:right;">
                
    
            </table>      
                                
                                
                            </div>
                        </div>
                         
                         
                        
                        <div class="row" style="height:35%;width:100%;">
                            
                            
                            <div class="row" style="height:100%;width:100%;">
                                
                                <div class="col-sm-4" style="height:100%;">
                                    
                                 <select id="Departman" class="form-control" name="Departmanov" style="font-size:19px;width:80%;height:40px;margin-top:3%;float:right;">
    <option class="placeholder" selected disabled value="" selected="true" >Şirket Seçiniz</option>
    
    
        
            <option class="sirket" value=""></option>
       
        
        </select>
                        
                                    
                                    
                                     <select id="Departman" class="form-control" name="Departmanov" style="font-size:19px;width:80%;height:40px;margin-top:3%;float:right;">
    <option class="placeholder" selected disabled value="" selected="true" >Departman Seçiniz</option>
    
    
        
            <option class="sirket" value=""></option>
       
        
        </select>
                                    
                                    
                                    
                        <select id="Departman" class="form-control" name="Departmanov" style="font-size:19px;width:80%;height:40px;margin-top:3%;float:right;">
    <option class="placeholder" selected disabled value="" selected="true" >Görev Seçiniz</option>
    
    
        
            <option class="sirket" value=""></option>
       
        
        </select>             
                                    
                                    
                                    
                                </div>
        
        
                                
        <div class="col-sm-5" style="height:100%;">
            
                <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Görevin Problem ile İlişkisi :</label>
    <input type="text" class="form-control" id="Departman_adiii" name="Departman_adiii_t"   onkeyup="icazet();icazetovaltin(this)" onkeydown="icazet();icazetovaltin(this);"  style="text-align:center;font-size:20px;height:120px;width:100%;">
      
  </div>
            
        </div>
                                
        <div class="col-sm-3" style="height:100%;">
            
            <button class="btn btn-default" id="kaydet_gorev" style="width:80%;margin-top:23%;margin-left:15%;" type="submit">TEMİZLE</button> 
             
            <button class="btn btn-default" id="kaydet_gorev" style="width:80%;margin-top:9%;margin-left:15%;" type="reset">KAYDET</button> 
            
        </div>
                                
                            </div>
                            
                            
                            
                            
                            
                            
                        </div>
                        
          
                                
                                                                                                                                                                                                                                              
                     </div>

  </div>
         
      
       ---burası--->
                            
 
    </div>  
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import/alt.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                   
                   function minkarakter()
                   {
                  var isimuzunluk=document.NewForm116.Calisanisimttt.value.length;
                   var soyisimuzunluk=document.NewForm116.Calisansoyisimttt.value.length;
                     var kullaniciadiuzunluk=document.NewForm116.Calisankullaniciadittt.value.length;
                    var parolauzunluk=document.NewForm116.Calisanparolattt.value.length;
                    var tarihkismi=document.NewForm116.demirperde.value.length;
                    if (isimuzunluk>3 && soyisimuzunluk>3 && kullaniciadiuzunluk>5 && parolauzunluk>5 && tarihkismi===10) {
    
    return "ButonAktifleşsin";
}

else
{
    return "ButonPasifsin";
}
                       
                       
                   }
                   
                   
                  
    
    
                   
                   
                   
                  
                                                                        
                     function icazetov(adef)  
{          
  var letters = /^[0-9a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split(' ').join(''); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  


      
}  





                  
                     function icazetovaltin(adef)  
{          
  var letters = /^[a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' '); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  


      
}  



                     function icazetovaltinsoyad(adef)  
{          
  var letters = /^[a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split(' ').join(''); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  

adef.value=adef.value.toString().toUpperCase();
      
}  
                   
                                                                                                                                 
            var bizimkiler = [
               
    
                <%  while(rsr.next()){ 
                String b644 = javax.xml.bind.DatatypeConverter.printBase64Binary(rsr.getBytes("Resim"));
                %>
                
                ["<%= rsr.getInt("ID")%>","<%= rsr.getString("AdSoyad")%>","<%= rsr.getString("Durum")%>","<%= rsr.getString("KullaniciAdi")%>","<%= rsr.getString("Sifre")%>","<%=b644%>","<%= rsr.getDate(3) %>","<%= rsr.getString("Adiii")%>","<%= rsr.getString("Soyadiii")%>"],
                                              
    <% } %>
    


];
 
$(document).ready(function() {
    
    
$('#btnKaydettt').attr('disabled',true);  
    
                          
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Problemler" }                                           
        ],
         
        scrollY:"260px",
        scrollX:"true",
        scrollCollapse: true,
        ordering:false,
        paging:false,
      bFilter:false,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false,
                                                                                           
    } );
    
    
    
    
    
    
    
    
    
      $('#example1').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "Çalışan" },
            { title: "Şirket" },                                          
            { title: "Departman" },
            { title: "Görev" }
        ],
         
        scrollY:"225px",
        scrollX:"true",
        scrollCollapse: true,
        ordering:false,
        paging:false,
      bFilter:false,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false,
                                                                                           
    } );
    
    
    
    
    
    
    
    
    
    
    
    
    $("table tr").css('cursor', 'pointer');
  
    
    
    
     var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        
        displayImage(data[5]);
                       
    } );
    
    
    
    
    
  
    
                                           
});



function pasifeal()
{
      $('#btnKaydettt').attr('disabled',true);  
}











function displayImage(byte)

{                       
    $('#blah').attr('style',"width:270px;height:270px;");
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}









 function butonkontrol()
                   
    {
       if (minkarakter()==="ButonAktifleşsin") {
         $('#btnKaydettt').attr('disabled',false);  
}

else if (minkarakter()==="ButonPasifsin") {
    
       $('#btnKaydettt').attr('disabled',true);  
   
}
        
    }




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
