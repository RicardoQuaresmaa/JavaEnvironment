
<%@page import="java.sql.*"%>
<%@page import="Connection.*" %> 

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
        width:600px;
    }
    
#example_paginate
{
    width:500px;
  height:70px;
    float:left;
   margin-top:-15px;
  
   font-size:10px;
   margin-left:-200px;
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
    
<body>         

 <%
     if (request.getSession().getAttribute("ID_")==null) {
                                                       response.sendRedirect("Login.jsp");
                                                }
     
     if(request.getSession().getAttribute("AdminMi")!=null)
     {
     
          if (request.getSession().getAttribute("AdminMi").toString()=="false" ) {
                                                       response.sendRedirect("Login.jsp");
                                                }
         
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
           
                
   String SQL = "select * from Calisan_view";
   
    

            
              stmt = conn.createStatement();
                rsr = stmt.executeQuery(SQL);                
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import/ust.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%">
  
      <div class="panel panel-default" onmouseover="butonkontrol();" style="width:500px;height:350px;margin-top:2%;float:left;margin-left:5%">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:100%">
                         
                         
                        <form role="form" action="EmployeeInsertbny"  runat="server" method="post" enctype="multipart/form-data" id="formiste" name="NewForm116"   class ="form-horizontal"  style="width:240px;height:300px;float:left">
                                
                                

   <div class = "form-group">
      
		
      <div class = "col-sm-12">
          <input type = "text"  class = "form-control" id = "firstname" name="Calisanisimttt" value="" onkeydown="icazetovaltin(this);butonkontrol();" onkeyup="icazetovaltin(this);butonkontrol();" style="text-align:center" placeholder = "Enter First Name">
      </div>
   </div>
   
   <div class = "form-group">
    
		
      <div class = "col-sm-12">
          <input type = "text" class = "form-control" style="text-align:center" id ="lastname" name="Calisansoyisimttt" value="" onkeydown="icazetovaltinsoyad(this);butonkontrol();" onkeyup="icazetovaltinsoyad(this);butonkontrol();" placeholder = "Enter Last Name">
      </div>
   </div>                                                                                                                                                                
            
                                <div class = "form-group" style="margin-top:10px">      		
      <div class = "col-sm-12">
          <input type = "text"  class = "form-control" id = "UserName" name="Calisankullaniciadittt" value="" onkeydown="icazetov(this);butonkontrol();" onkeyup="icazetov(this);butonkontrol();" style="text-align:center" placeholder = "Enter the UserName">
      </div>
   </div>
   
   <div class = "form-group">
    
		
      <div class = "col-sm-12">
          <input type = "text" class = "form-control" style="text-align:center" id = "Password" name="Calisanparolattt" value="" onkeydown="icazetov(this);butonkontrol();" onkeyup="icazetov(this);butonkontrol();" placeholder = "Enter the Password">
      </div>
       
        <label class = "checkbox-inline" style="font-size:16px;float:left;margin-left:47px;float:top">
      <input type = "radio" name = "optradio" id = "Aktif" value = "akt" > Aktif
   </label>
   
   <label class = "checkbox-inline" style="font-size:16px;margin-left:4px">
      <input type = "radio" name = "optradio" id = "Pasif" value = "psf"> Pasif
   </label>    
       
       <div class="form-group" style="float:left;background-color:red;margin-left:20px;height:30px;margin-top:9px">
           
           <input id="example1" onclick="butonkontrol();" onkeyup="butonkontrol();" onkeydown="butonkontrol();" onkeypress="butonkontrol();" name="demirperde" type="text" placeholder="Doğum Tarihi" style="width:130px;height:30px;float:left;text-align:center"  >
           
       </div>
       
       
            
            <div class="form-group" id="upfile1" style="border-style: solid;width:300px;border-width: 1px;margin-top:9px;width:100px;height:30px;cursor:pointer;text-align:center;float:left;margin-left:20px">
                                     <label for="text"  style="cursor:pointer;font-size:12px;height:30px;margin-top:5px">Fotoğraf Yükle</label>
 
  </div>
       
       <button class="btn btn-default" id="btnKaydettt"  type="submit" disabled style="float:left;width:48%;margin-left:20px">KAYDET</button>  <button class="btn btn-default" type="reset" onclick="imagedefault();pasifeal();" style="width:37%;margin-left:5px;float:left;">TEMİZLE</button>
       
   </div>                     
                                
     <input type="file" id="imgInp" name="logoo"  style="display:none" />
     
     
     <input type="hidden" id="elktat" value="martin" name="logoguncvarmi"> 
         
         
         
           <input type="hidden" id="calisanaydiiiii" name="ID_bmmmmm"> 
                            
</form>
                        
                        
     <img id="blah" src="img/sirketler.png"  alt="" style="float:right;width:200px;height:240px;margin-top:20px;"/>                 
                                
                                                                                                                                                                                                                                              
                     </div>

  </div>
         
      
            <div class="panel panel-default" style="width:700px;height:350px;float:left;margin-left:30px;margin-top:2%;">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
                            
 
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
                    if (isimuzunluk>1 && soyisimuzunluk>1 && kullaniciadiuzunluk>5 && parolauzunluk>5 && tarihkismi===10) {
    
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



}  

adef.value=adef.value.toString().toUpperCase();
      
}  
                   
                                                                                                                                 
            var bizimkiler = [
               
    
                <%  while(rsr.next()){ 
                String b644 = javax.xml.bind.DatatypeConverter.printBase64Binary(rsr.getBytes("Resim"));
                %>
                
                ["<%= rsr.getInt("ID")%>","<%= rsr.getString("AdSoyad")%>","<%= rsr.getString("Durum")%>","<%= rsr.getString("KullaniciAdi")%>","<%= rsr.getString("Sifre")%>","<%=b644%>","<%= rsr.getDate(3) %>","<%= rsr.getString("Adiii")%>","<%= rsr.getString("Soyadiii")%>"],
                                              
    <% }

%>
    


];
 
$(document).ready(function() {
    
    
   // alert(""); 
    
    
$('#btnKaydettt').attr('disabled',true);  
    
    
                $('#example1').datepicker({
                    format:"yyyy-mm-dd"
                });  
    
    
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Ad Soyad" },             
            { title: "Durum" }                        
        ],
      lengthMenu: [[5,-1], ["Some", "All"]],
        scrollY:"194px",
        scrollX:"true",
      scrollCollapse: true,
        ordering:true,
        paging:true,      
    bFilter:true,
     bInfo:false,
      bPaginate:false,
      hover:true,
      bline:false,                                                                                         
    } );
    
    
    
    
    
    $("table tr").css('cursor', 'pointer');
  
    
    
    
     var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        
        
        
        $('#formiste').attr('action',"EmployeeUpdatebny");

        if (data[2]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[2]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}
         $('#firstname').val(data[7]);
         
         $('#lastname').val(data[8]);
         
         
         $('#UserName').val(data[3]);
         
        
         $('#Password').val(data[4]);
         
         
         
         $('#calisanaydiiiii').val(data[0]);
 
     $('#example1').val(data[6]);
   
     
   
     
   
     
        displayImage(data[5]);
        
 $('#btnKaydettt').attr('disabled',true); 
        
         $('#btnKaydettt').text("GÜNCELLE");
    } );
    
    
    
    
    
         $("#upfile1").click(function () {
    $("#imgInp").trigger('click');
});
    
                                           
});



function pasifeal()
{
      $('#btnKaydettt').attr('disabled',true);  
}


function imagedefault()
{
     
    $('#blah').attr('src',"img/sirketler.png");
    $('#elktat').val("martin");
      $('#btnKaydettt').text("KAYDET");

       $('#formiste').attr('action',"EmployeeInsertbny");
     
        pasifeal();
}



  $("#imgInp").change(function(){
      $('#blah').attr('style',"float:right;width:200px;height:240px;margin-top:20px;margin-right:15px;");
    readURL(this);
    
     $('#elktat').val("marti");
});




function displayImage(byte)

{                       
    $('#blah').attr('style',"float:right;width:200px;height:240px;margin-top:20px;margin-right:15px;");
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}




function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('style',"float:right;width:200px;height:240px;margin-top:20px;margin-right:15px");
            $('#blah').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
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
      
      
        
      
      
