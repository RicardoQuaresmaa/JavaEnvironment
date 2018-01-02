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
<link href="../css/datepicker.css" rel="stylesheet" type="text/css"/>
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/bny.css" rel="stylesheet" type="text/css"      
<link href="../CalisanDisKaynak/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>  
    <script src="../CalisanDisKaynak/bootstrap-combobox.js" type="text/javascript"></script>    
<script src="../CalisanDisKaynak/jquery-1.12.3.js" type="text/javascript"></script>
<script src="../CalisanDisKaynak/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../CalisanDisKaynak/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>  
<link href="../CalisanDisKaynak/bootstrap.min.css" rel="stylesheet" type="text/css"/>                                                     
<link href="../CalisanDisKaynak/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
      
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
    
  
    
    
</style>





</head>
    
<body>         
    
      <%
     if (request.getSession().getAttribute("ID_")==null) {
                                                       response.sendRedirect("../Login.jsp");
                                                }
     %>
                                        <%             
   Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
                ResultSet rsr = null;      
                ResultSet rsr1 = null;  
                   ResultSet rsr2 = null;  
           
                
   
   String SQL3 = "select * from oleyArizaTipi_view";
                        
              stmt = con.createStatement();
                   
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
              <c:import url="../import5/ust5.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
      
      
      
      <div class="col-sm-6">
       
          <div class="panel panel-default" style="width:500px;height:450px;margin-top:0%;float:right;">
         
           
           
            
           
         
           
           
           
           
                <div class="panel-body">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px" >
                        
                
    
            </table>   
                    
                    
                    <div class="row" style="height:30%;width:100%;margin-top:0%;">
                            
                            
                               <form role="form" action="../OleyArizaTipiiii" runat="server" method="post" enctype="multipart/form-data" id="formiste" name="NewForm116">
                         
                                
                                   
                                                     <div class="radio" style="width:100%;">
                            
                                        <label style="margin-left:12%;">Kupon Etkisi :</label> <label style="margin-left:13%;"><input type="radio" name="optradio" onclick="kaydet_aktif();" value="akt" id="Aktif_kup">Var</label>
   
    <label style="margin-left:3%;"><input type="radio" name="optradio" onclick="kaydet_aktif();" value="psf" id="Pasif_kup">Yok</label>
</div>
                                
                                    
                                    <div class="radio" style="width:100%;margin-top:10px;margin-bottom:0px;">
                                    
                                        <label style="margin-left:8%;">Mutabakat Etkisi :</label> 
                                            
                                        <label style="margin-left:10%;"><input type="radio" name="optradio1" onclick="kaydet_aktif();" value="akt" id="Aktif_mut">Var</label>
   
    <label style="margin-left:3%;"><input type="radio" name="optradio1" onclick="kaydet_aktif();" value="psf" id="Pasif_mut">Yok</label>
    
    
          
</div>
                                    
                                    
                                    
                  
       
    

           
             
                                                                                                                                                                                                                                                                                                                                                                                                  
                                
                            
                            
                                
                                       

                                
                                           <div class="form-group" id="upfile1" style="margin-left:10%;margin-top:10px;width:100%" >
                                    <button class="btn btn-default" id="temizle_gorev" type="reset" onclick="pasifeal();btnkaydet();"  style="width:40%;">TEMİZLE</button>
                                    <button class="btn btn-default" id="btnKaydettt" type="submit"  style="width:40%">KAYDET</button>
 
  </div>
                                
                            
                                   <input type="hidden" id="ariza_id" name="ariza_id_name"/>
        
                                   <input type="hidden" id="insert_update_id" name="insert_update_name"/>
                        
                        </form>     
                            
                            
                            
                            
                            
                            
                        </div>
              
                    
                </div>
                
            </div>
          
      </div>
      
      
      
       
      
      
      
      
      
      
      <div class="col-sm-6">                                                                                                                                                                                                 
          <img id="blah"  class="img-rounded" src="img/sirketler.png"  alt="" style="width:450px;height:450px;"/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
      </div>
      
  
      
         
      
           
                            
 
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="../import/alt.jsp"></c:import>     
              
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
                   
                <%  
                    rsr2 = stmt.executeQuery(SQL3);
                    while(rsr2.next()){                 
                %>
                
                ["<%= rsr2.getInt("ID")%>","<%= rsr2.getString("problemAdi")%>","<%= rsr2.getString("urunKisimAdi")%>","<%= rsr2.getString("kuponEtk")%>","<%= rsr2.getString("mutEtk")%>"],                                              
    <% } %>    
];


 
$(document).ready(function() {
    
     $('#insert_update_id').val("insert");
    
    
$('#btnKaydettt').attr('disabled',true);  
    
                          
    $('#example').DataTable({
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Problemler"},            
            { title: "Ürün Kısım"}
      
        ],
         
        scrollY:"220px",
        scrollX:"true",
        scrollCollapse: true,
        ordering:false,
        paging:false,
      bFilter:true,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false
                                                                                           
    });
    

    
    
    
    
    
  
    
 
    
    
                 
    $("table tr").css('cursor', 'pointer');
             
     var table = $('#example').DataTable();
     
     
    $('#example tbody').on('click', 'tr', function () {
        
         $('#Aktif_mut').prop('checked',false);    
          $('#Pasif_mut').prop('checked',false);
            $('#Aktif_kup').prop('checked',false);  
            $('#Pasif_kup').prop('checked',false);
            
       
          
         var data = table.row( this ).data();
   //     $('#blah').attr('style',"width:300px;height:300px;margin-top:0%;float:left;");                   
     //   alert(bny[0]+' '+bny[1]);
        
    
    
      if (data[4]==="Aktif") {
    $('#Aktif_mut').prop('checked',true) ;    
}

else if (data[4]==="Pasif") {
    
     $('#Pasif_mut').prop('checked',true)
    
}




  if (data[3]==="Aktif") {
    $('#Aktif_kup').prop('checked',true) ;    
}

else if (data[3]==="Pasif") {
    
     $('#Pasif_kup').prop('checked',true);
    
}


if (((document.getElementById("Aktif_mut").checked) || (document.getElementById("Pasif_mut").checked)) && ((document.getElementById("Aktif_kup").checked) || (document.getElementById("Pasif_kup").checked)) ) 
{
  $('#insert_update_id').val("update");
  $('#btnKaydettt').text("GÜNCELLE");  
}

else {
           $('#btnKaydettt').text("KAYDET");   
           $('#insert_update_id').val("insert");
}



        
       
         $('#ariza_id').val(data[0]);
        
    //    alert(data[0]);
        var kontrolsayi=0;
        
    //    alert(data[3]+' '+data[4]);
    
                
        if (kontrolsayi !==data[0]) 
        
        {
        //    alert(data[0]);
    sendInfo(data[0]);
     kontrolsayi=data[0];
}





                       
    });
    
    
    
    
                                                                     
});



function pasifeal()
{
      $('#btnKaydettt').attr('disabled',true);  
        $('#insert_update_id').val("insert");
         $('#blah').attr('src',"img/sirketler.png");
}




function kaydet_aktif()

{
    
    if (((document.getElementById("Aktif_mut").checked) || (document.getElementById("Pasif_mut").checked)) && ((document.getElementById("Aktif_kup").checked) || (document.getElementById("Pasif_kup").checked)) ) 
{
   $('#btnKaydettt').attr('disabled',false);  
}
}






function displayImage(byte)

{                       
    $('#blah').attr('style',"width:450px;height:450px;");
     $('#blah').attr('src', "data:image/png;base64,"+byte);    
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



    
    
    var request;  
function sendInfo(proid)  
{  
  //var v=document.vinform.t1.value;  
  
  var url="../folder/index25.jsp?val="+proid;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState===4){  
var val=request.responseText;  
// alert(val);
displayImage(val);
}  
}







        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
