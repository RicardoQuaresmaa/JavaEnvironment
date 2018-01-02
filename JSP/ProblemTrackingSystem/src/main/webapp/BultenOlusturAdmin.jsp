<%@page import="java.sql.*"%>
<%@page import="Connection.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        
        .Departman_adiii{
            width:100%;
        }

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Panel</title>
<link rel="shortcut icon" href="img/admin.png"/>

<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<link href="css/bny.css" rel="stylesheet" type="text/css"/>
      

<link href="CalisanDisKaynak/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>


    
    <script src="CalisanDisKaynak/bootstrap-combobox.js" type="text/javascript"></script>
    
    

<script src="CalisanDisKaynak/jquery-1.12.3.js" type="text/javascript"></script>


<script src="CalisanDisKaynak/jquery.dataTables.min.js" type="text/javascript"></script>

<script src="CalisanDisKaynak/dataTables.bootstrap.min.js" type="text/javascript"></script>
<link href="CalisanDisKaynak/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<link href="CalisanDisKaynak/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
                                                    
                
                                                                                                 
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
     
  if(request.getSession().getAttribute("AdminMi")!=null)
     {
     
          if (request.getSession().getAttribute("AdminMi").toString()=="false" ) {
                                                       response.sendRedirect("Login.jsp");
                                                }
         
     }    
     %>
    
                                        <%   
                                        
   Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
              
                ResultSet rsr1 = null;  
                ResultSet rsr2 = null;  
           
                
 
   
   String SQL11765 = "select ID,Adi from Etki";

   String SQL113 = "select * from oleycomsayfavearizatipi";
            
              stmt = con.createStatement();
                

                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import6/ust6.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
                                                                                                         
      <div class="row" style="width:1200px;height:400px;margin:0 auto;margin-top:2%;">
            
          
          <div class="col-sm-4" style="height:100%;">
              
                              <div class="panel panel-default" style="width:400px;height:400px;margin-left:30px;">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:85%">
                         
                         
  <form role="form" id="form44" name="NewForm1199" action="BultenOlusturInsert" runat="server" method="post" enctype="multipart/form-data" >

      
                      
                                
           
     <div class="form-group" style="margin-left:10%;width:100%;margin-top:4%">
    <label for="text">Oley.com Sayfa ve Arıza Tipi :</label>
    <div>      
        <select id="ArizaTipi"  class="form-control"  name="ArizaTipi_name" style="font-size:16px;width:100%;height:40px;float:left;">
    <option class="placeholder" selected disabled value="" selected="true" >Arıza Tipi Seçiniz</option>  
      <%  
          rsr2=stmt.executeQuery(SQL113);
          while(rsr2.next()){            
      %>        
      <option class="calisaniste"  id="<%= rsr2.getInt("ID")%>" problem="<%= rsr2.getString("SayfaProblem")%>" ><%= rsr2.getString("SayfaProblem")%></option>
        <% } %>        
        </select>                
     <input id="ArizaTipiListe"  name="ArizaTipiListe" onkeyup="arizaTipleriFiltrele();"  style="border:none;float:left;font-size:14px;height:38px;margin-left:-300px;margin-top:1px;width:89%;text-align:center;"/>                                                            
    </div>
  </div>   
        
        
                                                             
     <div class="form-group" style="margin-left:10%;width:100%;margin-top:18%;">
    <label for="text">Görsel Ekle :</label>
    <div>      
        <select id="Gorseller"  class="form-control"  name="Gorseller" style="font-size:16px;width:100%;height:40px;float:left;">
    <option class="placeholder" selected disabled value="" selected="true" >Görsel Tipi Seçiniz</option>              
      <option class="calisaniste" value="" id="problemgorseli_id" >Problem Görseli</option>            
      <option class="calisaniste" value="" id="servisgorseli_id" >Servis Görseli</option>            
      <option class="calisaniste" value="" id="diskkullanimorani_id" >Disk Kullanım Oranı</option>            
        </select>                                                                            
    </div>
  </div>   
        
                                        
           
     <div class="form-group" style="margin-left:10%;width:100%;margin-top:18%;">
    <label for="text">Arızanın Etkisi :</label>
    <div> 
     
      
       <select id="ArizaEtki"  class="form-control"  name="ArizaEtki" style="font-size:14px;width:100%;height:40px;float:left;">
    <option class="placeholder" selected disabled value="" selected="true" >Arıza Etkisi Seçiniz</option>
  
      <%  
          rsr1=stmt.executeQuery(SQL11765);
          while(rsr1.next()){            
      %>
        
      <option class="calisaniste"  id="<%= rsr1.getInt("ID")%>" etki="<%= rsr1.getString("Adi")%>" ><%= rsr1.getString("Adi")%></option>
        <% } %>
        
        </select>  
        
     <input id="ArizaEtkiFiltreText"  name="ArizaEtkiFiltreText_name" onkeyup="arizaEtkileriFiltrele();" onkeydown="" onkeypress=""  style="border:none;float:left;font-size:14px;height:38px;margin-left:-300px;margin-top:1px;width:89%;text-align:center;"/>     
                                                       
    </div>
  </div>   
                                               
           <div class="form-group" style="margin-left:10%;width:100%;height:160px;margin-top:18%;">
                                                                                                                                                                                                                                                                                                                                                             
                                <div class="form-group" id="upfile1" style="float:left;margin-top:10%;width:100%;float:left;">
                                    
                                    <button class="btn btn-default" type="reset" id="reset" onclick="temizlebutonu();" style="padding-left:3%;width:30%;font-size:14px;float:left">TEMİZLE</button> 
                                       <button class="btn btn-default" type="submit" id="butonnn"  style="width:65%;float:right;">BÜLTEN OLUŞTUR</button>
 
  </div>
        
        
          
        
          </div>
        
        
        <input type="hidden" id="ArizaTipi_ID" name="ArizaTipi_ID" value="">                                 
           <input type="hidden" id="ArizaEtki_ID" name="ArizaEtki_ID" value="">
               
               
               
                    <input type="file" name="logo" id="imgInp" style="display:none" />
                    <input type="file" name="logo1" id="imgInp1" style="display:none" />
                    <input type="file" name="logo2" id="imgInp2" style="display:none" />
                    
</form>

                         
                        
  
                     </div>

  </div>
              
          </div>
                

        <div class="col-sm-8" style="height:100%;">
            
            
            
            <img id="resim"  class="img-rounded" style="width:400px;height:400px;float:left;margin-left:50px;"/>
                  
                      <img id="resim1" class="img-rounded" style="width:210px;height:198px;float:left;margin-left:20px;"/>
                      
                      <img id="resim2" class="img-rounded" style="width:210px;height:200px;float:left;margin-left:20px;margin-top:2px;"/>
          
            
        </div>
        
        
  
         
      
           
                            

      </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                      
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import2/alt2.jsp"></c:import>     
              
          </div>
    
  </div>
                     
               <script>





 
$(document).ready(function() {
    
         $('#adsoyadli').text("<%=AdSoyad%>");
  displayImage("<%=bytes%>");
    
        $('#butonnn').attr('disabled',true);
        
        
        
         
                                  
        
        
     $("#ArizaTipi").on('click', 'option', function () {
         
        
    
      var element = $(this);
         var idddf = element.attr("id");       
              $('#ArizaTipi_ID').val(idddf);
          //    alert($('#ArizaTipi_ID').val());
     
              $('#ArizaTipiListe').val($("#ArizaTipi").val());
              
              validasyon();
              
    });
    
    
    
    
       $("#Gorseller").on('click', 'option', function () {
        
    });
    
    
    
    
       $("#ArizaEtki").on('click', 'option', function () { 
           
            var element = $(this);
         var idddf = element.attr("id");       
              $('#ArizaEtki_ID').val(idddf);
           //   alert($('#ArizaEtki_ID').val());
           
           
           $('#ArizaEtkiFiltreText').val($("#ArizaEtki").val());
           
           validasyon();
           
    });
    
    
                            

    

    
    
    
               $("#problemgorseli_id").click(function () {    // tıklamayı tetiklemek burada oluyor...
                   
    $("#imgInp").trigger('click');
    
});




          $("#servisgorseli_id").click(function () {    // tıklamayı tetiklemek burada oluyor...
                   
    $("#imgInp1").trigger('click');
    
});





          $("#diskkullanimorani_id").click(function () {    // tıklamayı tetiklemek burada oluyor...
                   
    $("#imgInp2").trigger('click');
    
});










     $("#imgInp").change(function(){
    readURL(this);
});



     $("#imgInp1").change(function(){
    readURL1(this);
});




     $("#imgInp2").change(function(){
    readURL2(this);
});




  function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
              $('#resim').attr('style',"width:400px;height:400px;float:left;margin-left:50px;");
            $('#resim').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
    validasyon();
}





  function readURL1(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#resim1').attr('style',"width:210px;height:200px;float:left;margin-left:20px;");
            
            $('#resim1').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
    validasyon();
}






  function readURL2(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#resim2').attr('style',"width:210px;height:200px;float:left;margin-left:20px;");
            $('#resim2').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
    validasyon();
}


    
});


function displayImage(byte)

{                       
    
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}


function arizaTipleriFiltrele()
{         
      var xtxtlength=document.getElementById("ArizaTipi").length;
      var xtxtxt=document.getElementById("ArizaTipi");
       var calisantextbox=document.getElementById("ArizaTipiListe").value.toLowerCase();
       
     
     
for (var i = 1; i < xtxtlength+1; i++)
        {                    
           var element=xtxtxt[i].getAttribute('problem').toLowerCase();                      
            var iddd=xtxtxt[i].getAttribute('id');                                                                                                            
            if (element.indexOf(calisantextbox) === -1 )                         
            {                        
       $('#'+iddd).attr('style',"display:none");                             
}
else
{
    $('#'+iddd).attr('style',"display;");        
}         
    }
}





function arizaEtkileriFiltrele()
{         
      var xtxtlength=document.getElementById("ArizaEtki").length;
      var xtxtxt=document.getElementById("ArizaEtki");
       var calisantextbox=document.getElementById("ArizaEtkiFiltreText").value.toLowerCase();
     
for (var i = 1; i < xtxtlength+1; i++)
        {                    
           var element=xtxtxt[i].getAttribute('etki').toLowerCase();                      
            var iddd=xtxtxt[i].getAttribute('id');                                                                                                            
            if (element.indexOf(calisantextbox) === -1 )                         
            {                        
       $('#'+iddd).attr('style',"display:none");                             
}
else
{
    $('#'+iddd).attr('style',"display;");        
}         
    }
}


function validasyon()
{
    
    var delil1=$('#ArizaTipi_ID').val().length;
    var delil2=$('#ArizaEtki_ID').val().length;
    var delil3=$('#imgInp').val().length;
    var delil4=$('#imgInp1').val().length;
    var delil5=$('#imgInp2').val().length;

      
      if ((delil1>0) && (delil2>0) && (delil3>0)  && (delil4>0)  && (delil5>0) ) 
      
        {                   
           $('#butonnn').attr('disabled',false);          
        }
        
        else
        {             
               $('#butonnn').attr('disabled',true);  
        }
    
    
}



function temizlebutonu()

{    
         $('#resim').attr('style',"display:none;");
         $('#resim1').attr('style',"display:none;");
         $('#resim2').attr('style',"display:none;");      
             $('#ArizaTipi_ID').val("");      
                 $('#ArizaEtki_ID').val("");   
}




                
        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
