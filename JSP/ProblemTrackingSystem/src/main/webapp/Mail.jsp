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

<link href="css/bny.css" rel="stylesheet" type="text/css"

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
   Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
                ResultSet rsr = null;      
                ResultSet rsr1 = null;  
                ResultSet rsr2 = null;  
           
                
 
   
   String SQL11765 = "select * from vw_Mail";

   String SQL113 = "select * from CalisanMail";
            
              stmt = con.createStatement();
                

                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import2/ust2.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%">
   
    
    
        
  
            
            <div class="col-sm-1" style="height:100%"></div>
            <div class="col-sm-10" style="height:100%;background-color:">                                                                
       
            
          
  
                
                <div class="panel panel-default" style="width:400px;height:370px;margin-top:3.5%;float:left;margin-left:5%;">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:85%">
                         
                         
  <form role="form" id="form44" name="NewForm1199" action="MailInsert" runat="server" method="post" enctype="multipart/form-data" >

            <div class="form-group" style="margin-left:10%;width:100%;">
    <label for="text">Mail Adresi :</label>
    <input type="text" class="form-control" id="MailAdresiiii" name="MailAdresiiii_name"   onkeyup="sondurak()"   style="text-align:center;font-size:20px;height:37px;width:100%" >
      
  </div>                    
                                
           
     <div class="form-group" style="margin-left:10%;width:100%;margin-top:2%">
    <label for="text">Çalışan :</label>
    <div> 
     
        <select id="Calisans"  class="form-control"  name="sirketov" style="font-size:17.8px;width:100%;height:40px;float:left;">
    <option class="placeholder" selected disabled value="" selected="true" >Çalışan Seçiniz</option>
  
      <%  
          rsr2=stmt.executeQuery(SQL113);
          while(rsr2.next()){
              String b649 = javax.xml.bind.DatatypeConverter.printBase64Binary(rsr2.getBytes("Resim"));
      %>
        
      <option class="calisaniste" value="<%= rsr2.getInt("ID")%>" id="<%= rsr2.getInt("ID")%>" Resim="<%=b649%>" adsoyad="<%= rsr2.getString("AdSoyad")%>"><%= rsr2.getString("AdSoyad")%></option>
        <% } %>
        
        </select>
                
     <input id="CalisanListe"  name="CalisanListename" onkeyup="icazetovaltinsoyad(this);calisanfiltrele();" onkeydown="icazetovaltinsoyad(this);" onkeypress="icazetovaltinsoyad(this);"  style="border:none;float:left;font-size:17.8px;height:38px;margin-left:-300px;margin-top:1px;width:89%;text-align:center;"/>     
                                                       
    </div>
  </div>   
        
        
          
        
        
        
        
        
           <div class="form-group" style="margin-left:10%;width:100%;height:160px;margin-top:18%;">
    
      

        
        
        
        
               <img id="imagee" style="width:130px;height:140px;float:left;margin-top:5px;"/>
        
                                
<div class="radio" style="float:left;margin-left:6%;margin-top:3%;width:50%;">
                                    
       <label><input type="radio" name="optradio" value="akt" id="Aktif">Aktif</label>
   
       <label style="margin-left:20px"><input type="radio" name="optradio" value="psf" id="Pasif" >Pasif</label>
</div>
            
                                
                                
                                
                               
                               
                                
                          
                               
                                <div class="form-group" id="upfile1" style="margin-left:6%;float:left;margin-top:1%;width:50%;">
                                    <button class="btn btn-default" type="reset" id="reset" onclick="temizlebutonu();" style="padding-left:3%;width:100%;font-size:14px;float:left">TEMİZLE</button> 
                                    
 
  </div>
        
        
                 <div class="form-group" id="upfile1" style="margin-left:6%;float:left;margin-top:1%;width:50%;">
                                 
                                    <button class="btn btn-default" type="submit" id="butonnn"  style="width:100%;float:left;margin-top:0%">KAYDET</button>
 
  </div>
        
          </div>
        
        
        <input type="hidden" id="Calisan_IDDDD" name="Calisan_ID_dd" value="">
             
            
        
           <input type="hidden" id="MailIDDDDD_TYU" name="Mail_ID_dd" value="">
                    
</form>

                         
                        
  
                     </div>

  </div>
         
      
            <div class="panel panel-default" style="width:600px;height:370px;margin-top:3.5%;float:left;margin-left:30px;">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
                            

      
               


         
                         
   
            </div>
            
         
            
             
            
            
            
      <div class="col-sm-1" style="height:100%"></div>
     
                       
                
                         
                 
                
                
                
          
                
                
                
           
            
     
            
            
            
            
        
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import2/alt2.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        

        
      
               <script>
                   
                   
                   
                   
                   
                   
                 
                   
                   
                   
                   
                   
                   
                   
                                                                                                                                                                   
                   
<% rsr1 = stmt.executeQuery(SQL11765);    %>
                                             
            var bizimkiler = [
                    
                <%  while(rsr1.next()){ %>
                
                ["<%= rsr1.getInt("ID")%>","<%= rsr1.getString("MailAdresi")%>","<%= rsr1.getString("AdSoyad")%>","<%= rsr1.getString("Durum")%>","<%= rsr1.getInt("CalisanID")%>"],
                                              
    <% } %>
    
];


       
    function icazet()  
{   
       
  var letters = /^[0-9a-zA-Z \- \\*\\.\\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;


if(!document.NewForm11.Departman_adiii_t.value.match(letters))  
{  

document.NewForm11.Departman_adiii_t.value = document.NewForm11.Departman_adiii_t.value.substring(0,document.NewForm11.Departman_adiii_t.value.length-1);


document.NewForm11.Departman_adiii_t.focus();  
}  
var ttt=document.NewForm11.Departman_adiii_t.value.length;
if ($('#sirketler').find('option:selected').val()>0 && ttt>2) {
      $('#butonnn').attr('disabled',false);  
}

else {
     $('#butonnn').attr('disabled',true);  
            
}
      
}  




 


function icazetovaltinsoyad(adef)  
{          
  var letters = /^[a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

 // adef.value=adef.value.split(' ').join(''); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  

// adef.value=adef.value.toString().toUpperCase();
      
}  




function isEpostaValid() 
{
    var ePostaPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
   var hyhyhy= document.getElementById("MailAdresiiii").value;
// ytyt.value=ytyt.value.toLowerCase();      
  // alert((ePostaPattern.test(ytyt.value)));
  // alert(hyhyhy);
   if (!ePostaPattern.test(hyhyhy)) 
   
        {
       //  alert("bnyuuuu");
            return false;
            
        }
        
        else {return true;}
   
}




function sondurak()
{
                    
    if (isEpostaValid() && Calisanvalidasyonnn())
    
        {
        
    $('#butonnn').attr('disabled',false);  
    
}

else {
       $('#butonnn').attr('disabled',true);       
}

    
    
    
}





 
$(document).ready(function() {
    
     
                                
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Mail Adresi" }, 
            { title: "Calişan" },
            { title: "Durum" }
                            
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
    
    
     $("table tr").css('cursor', 'pointer');
    
    
    var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
          
       
 //  document.getElementById("form44").reset();
 
 
 
       $('#CalisanListe').attr('style','display:none');
 
   
 // onchange="alert(this.options[this.selectedIndex].getAttribute('adsoyad'));"
   
 // ----> anaörnek    $('#sirketler option[value=120]').prop('selected',true);
 
   $('#Calisans option[value='+data[4]+']').prop('selected',true);
   
$('#form44').attr('action',"MailUpdate");
        
  //     var element=$('#Calisans');
   
      //  alert($('#Calisans option:selected').val());
        
        var element=$('#Calisans option:selected');
       var bnbn=element.attr("resim");;
   var bnbn1=element.attr("value");;
   displayImagee(bnbn);
   
     //   $('#CalisanListe').val("");

 // calisanfiltrele();



   
      $('#Calisan_IDDDD').val(bnbn1);///////////////////////////////////////////////////////////////////////////////
   
   
        //  
//  $('#sirketler').val(data[3]);
   // dana kuyruğu burada kopuyor
   
  

   // alert(this.options[this.selectedIndex].getAttribute('adsoyad'));
   


   
    //      $('#Sirket_ID_d').val($('select[name=sirketov]:option:selected').val());
          

     
      
      
      $('#MailIDDDDD_TYU').val(data[0]);
   
     $('#MailAdresiiii').val(data[1]);
        
     

        if (data[3]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[3]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}

// alert("bny");
        
         guncellemodu();
    } );
    
    
    
    
    
    
    
    
    
    
     $('#sirketler').on('click', 'option', function () {
                                                              
         var Sirket_ID_combo_select=$('#sirketler').find('option:selected').val();   
         
     //    alert(Sirket_ID_combo_select);
         
         $('#Sirket_ID_d').val(Sirket_ID_combo_select);
         
     //    var ddd =$('#Sirket_ID_d').val();
         
     //    alert(ddd);
      var der =$('#Departman_adiii').val().length;
      if (der>2) {
     $('#butonnn').attr('disabled',false);
   
}
             
    } );
    
    
    
    $("#sirketler").change(function(){         
        $("#CalisanListe").val($("#sirketler option:selected").html());
    });
    
    
    

    $('#butonnn').attr('disabled',true);
    
    
    
    
    
    
      function displayImagee(bytee)

{                       
    $('#imagee').attr('style',"width:130px;height:140px;float:left;margin-top:5px;");
     $('#imagee').attr('src', "data:image/png;base64,"+bytee);    
}
    
    


 
  $('#Calisans').on('click', 'option', function () {
      
      
      var element = $(this);
      
      var adsoyad = element.attr("adsoyad");
      var value = element.attr("value");
      var resim = element.attr("resim");
      
         $('#Calisan_IDDDD').val(value);
  
   // alert(resim);
 //   var selectValue1 = $(this).find("option[value="+$(this).val()+"]").val();
    
  
   
     
     //  var selectValue3 = $(this).find("option[value="+$(this).val()+"]").AdSoyad();
       
       displayImagee(resim);
       
 $('#CalisanListe').val(adsoyad);
 
 
 
     var selectValue2 = $(this).val();
     
     
   //  alert(selectValue2);
 
    sondurak();   // yalcin
             
    } );
    
    
    ////tren gelir hoş gelir
    
    
    
    

      
      
    

    
    
    
    
    
    //////////
                                                                                  
} );






  
                      function Calisanvalidasyonnn()
                   {
                  var Calisannn=$('#Calisans').val();
                  
                //  alert(Calisannn);
                    if (Calisannn!==null) {
    
    return true;
}

else 
{
     return false;
}


                       
                       
                   }





/*
 function musaffaedelim()
    {
        var x = document.getElementById("Calisans").selectedIndex;
         alert(document.getElementsByTagName("option")[x].AdSoyad);
    }
*/


function calisanfiltrele()
{
    
 
    
      var xtxtlength=document.getElementById("Calisans").length;
      var xtxtxt=document.getElementById("Calisans");
     var calisantextbox=document.getElementById("CalisanListe").value.toLowerCase();
   
 
  
     

for (var i = 1; i < xtxtlength+1; i++)

        {
            
        //    alert("bnyyy");
           var element=xtxtxt[i].getAttribute('adsoyad').toLowerCase();
           
           
            var iddd=xtxtxt[i].getAttribute('value');
          
             
    //  alert(element);
            
     
           
      
                                               
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



































function btnkaydet()
{  $('#butonnn').text("KAYDET");}



          function  pasifeal()
    {
      $('#butonnn').attr('disabled',true);  
    }       
    
        function  aktifeal()
    {
      $('#butonnn').attr('disabled',false);  
    }     

function yonlendirmeguncelle()
{
     $('#form44').attr('action',"MailUpdate");
}


function yonlendirmekaydet()
{
     $('#form44').attr('action',"MailInsert");
}



function temizlebutonu()

{
    yonlendirmekaydet();
    btnkaydet();
    pasifeal();
     $('#CalisanListe').attr('style','border:none;float:left;font-size:17.8px;height:38px;margin-left:-300px;margin-top:1px;width:89%;text-align:center;');
    
         $('#imagee').attr('src',"img/seffaf.png");
}


function guncellemodu()

{
    yonlendirmeguncelle();        
      $('#butonnn').text("GÜNCELLE");
      aktifeal();
}







    
    
    
    
    
  




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
