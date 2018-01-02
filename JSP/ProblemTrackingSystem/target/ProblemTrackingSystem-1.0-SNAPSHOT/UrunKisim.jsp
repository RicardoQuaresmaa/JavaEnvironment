<%@page import="java.sql.*"%>
<%@page import="Connection.*"%>
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
           
                
   String SQL = "select ID,Adi from Sirket where Aktif_Pasif=1";
   
   String SQL11 = "select u.ID,u.Ad,Sirket_ID from Urun u inner join Sirket s on s.ID=u.Sirket_ID where u.Aktif_Pasif=1 and s.Aktif_Pasif=1";
   
   String SQL112="select * from UrunKisimView";    /// DATATABLE SORGUSU BURSI

            
              stmt = con.createStatement();
                rsr = stmt.executeQuery(SQL);                
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import2/ust2.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
   
              
      <div class="col-sm-3" style="">
            
             
                    
                <div class="panel panel-default" style="width:300px;height:430px;float:right;">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:90%">
                         
                         
  <form role="form" id="form2" name="NewForm11" action="UrunKisimInsert" runat="server" method="post" enctype="multipart/form-data" >
      

      
      
       <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Ürün Kısım Adı:</label>
    <input type="text" class="form-control" id="urunkisimadi_id" name="urunkisimadi_name"   onkeyup="icazet();icazetovaltin(this);" onkeydown="icazet();icazetovaltin(this);"  style="font-size:20px;height:37px;width:100%" >
      
  </div>
      
      
      
      
       <div class="form-group" style="margin-left:10%;width:100%;margin-top:1%">
    <label for="text">Şirket:</label>
    <div> 
    
        <select id="sirketler" class="form-control" name="sirketov" onchange="icazet();" style="font-size:17.8px;width:100%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Şirket Seçiniz</option>
    
      <%  while(rsr.next()){ %>
        
      <option class="sirket" sirketid="<%= rsr.getInt("ID")%>" sirketadi="<%= rsr.getString("Adi")%>"><%= rsr.getString("Adi")%></option>
        <% } %>
        
        </select>
        
        
        
        
        
        
        
    </div>
  </div> 
        
        
        
        
        
        
        <div class="form-group" style="margin-left:10%;width:100%;margin-top:1%">
    <label for="text">Ürün:</label>
    <div> 
    
        <select id="urunler" class="form-control" name="urunov" onchange="icazet();" style="font-size:17.8px;width:100%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Ürün Seçiniz</option>
    
      <% rsr1 = stmt.executeQuery(SQL11);        
          while(rsr1.next()){ %>
        
      <option class="sirket" id="<%= rsr1.getInt("ID")%>" sirketid2="<%= rsr1.getInt("Sirket_ID")%>" urunadi="<%= rsr1.getString("Ad")%>"><%= rsr1.getString("Ad")%></option>
        <% } %>
        
        </select>
        
        
        
        
        
        
        
    </div>
  </div> 
        
        
        
        
      
      
      
      
 
                                
                                
           
    
                                
                                
<div class="radio" style="margin-left:20%;margin-top:10%;width:100%">
                                    
       <label><input type="radio" name="optradio" value="akt" id="Aktif">Aktif</label>
   
       <label style="margin-left:20px"><input type="radio" name="optradio" value="psf" id="Pasif" >Pasif</label>
</div>
            
                                
                                
                                
                         <div class="form-group" id="upfile1" style="border-style: solid;border-width: 1px;width:100%;cursor:pointer;text-align:center;margin-left:10%;margin-top:6%">
                                     <label for="text"  style="cursor:pointer;">Görsel Yükle</label>
 
  </div>      
                               
                                
                          
                               
                                <div class="form-group" id="butonlar" style="margin-left:10%;margin-top:8%;width:100%" >
                                    <button class="btn btn-default" type="submit" id="butonnn"  style="width:55%">KAYDET</button><button class="btn btn-default" type="reset" id="reset" onclick="pasifeal();btnkaydet();yonlendirmekaydet();" style="padding-left:3%;width:40%;font-size:14px;float:right">TEMİZLE</button> 
 
  </div>
        
        
        <input type="hidden" id="Sirket_ID_d" name="Sirket_ID_dd" value="">
            
            <input type="hidden" id="gorselvarmi_ID" name="gorselvarmi" value="martimuyd">
             
            <input type="hidden" id="Urun_ID_d" name="UrunID_boztas" value="">
                
                <input type="hidden" id="UrunKisim_ID" name="UrunKisim_ID_name" value="">
        
        <input type="file" name="logo" id="imgInp" style="display:none">
                    
</form>

                         
                        
  
                     </div>

  </div>
         
        
            
        </div>
        
      
    
        <div class="col-sm-9" style="">
          
            
      
      
            <div class="panel panel-default" style="width:470px;height:430px;float:left;">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
            
            
            
    <!-----         <div class="panel panel-default" style="width:400px;height:430px;float:left;margin-left:30px;">    ---->
                
    <img id="blah" class="img-rounded" src="img/sirketler.png"  style="width:450px;height:429px;border-style:hidden;float:left;margin-left:30px;"/>
                
   <!------          </div>            ------>
        
            
          
      </div>
        
  
   

    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import2/alt2.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                   
                   
                   
             
    function icazet()  
{   

var ttt=document.NewForm11.urunkisimadi_name.value.length;
// var bbb=$('#sirketler').find('option:selected').attr("sirketid");
var bbb1=$('#urunler').find('option:selected').attr("id");

if (bbb1>0 && ttt>2) {
      $('#butonnn').attr('disabled',false);  
}

else {
     $('#butonnn').attr('disabled',true);  
            
}

      
}  
                   
                   
                   
                   
                   
                   
<% rsr2 = stmt.executeQuery(SQL112);    %>
                                             
            var bizimkiler = [
                    
                <%  while(rsr2.next()){ %>
                
                ["<%= rsr2.getInt("urunID")%>","<%= rsr2.getString("kisimAdi")%>","<%= rsr2.getString("UrunAdi")%>","<%= rsr2.getString("Durum")%>"],
                                              
    <% } %>
    
];




 


 
$(document).ready(function() {
    
    
 
     
                                
    $('#example').DataTable( {
                                       
     data:bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Ürün Kısım" },
            { title: "Ürün" }, 
            { title: "Durum" }
            
            
        ],
         
        scrollY:"334px",
        scrollX:"true",
        scrollCollapse: true,
        ordering:false,
        paging:false,
      bFilter:false,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false
                                                                                           
    } );
    
    
     $("table tr").css('cursor', 'pointer');
    
    
    var table = $('#example').DataTable();
    
    
     
    $('#example tbody').on('click', 'tr', function () {
        
        $('#butonnn').text("GÜNCELLE"); 
        
        $('#gorselvarmi_ID').val("martfsdferi");
        
        var data = table.row( this ).data();
        
 
       $('#urunkisimadi_id').val(data[1]);
      
      $('#UrunKisim_ID').val(data[0]);
        
      $('#urunler option[urunadi="'+data[2]+'"]').prop('selected',true);    // ürünler select box'ında ürünü seçiyoruz.
  
   var bny262=$('#urunler option:selected').attr("id");    
   
   var bny263=$('#urunler option:selected').attr("sirketid2");   // seçili ürünün şirker id sini alıyoruz..
      
     $('#sirketler option[sirketid="'+bny263+'"]').prop('selected',true);    // ve ürün kısmından ürünümüzü seçtikten sonra, üründen ise şirketimzi seçiyorz.
   
   
   
   
   
     var bunyak=$('#sirketler option:selected').val();
 
   $('#Sirket_ID_d').val(bunyak);
   
    aktifeal();
   
  $('#form2').attr('action',"UrunKisimUpdate");

        if (data[3]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[3]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}


var eleman=$('#urunler option:selected');
var tfftff=eleman.attr("id");
$('#Urun_ID_d').val(tfftff);
    //    alert($('#Urun_ID_d').val());
        
        
        
        sendInfo(data[0]);
        
 // ----> anaörnek    $('#sirketler option[value=120]').prop('selected',true);
        
 //  $('#sirketler').val(data[3]);
   // dana kuyruğu burada kopuyor
   
    //      $('#Sirket_ID_d').val($('select[name=sirketov]:option:selected').val());
          
   //  alert($('#sirketler option:selected').val());
     
     // $('#Dep_ID_d').val(data[0]);
                      
      //  alert(data[0]);
                                                                     
    } );                                    
    
     $('#sirketler').on('click', 'option', function () {
         
         
         
         var element = $(this);
         var idddf = element.attr("sirketid");
            UrunFiltreSirket(idddf);
         
   //  var bbb=$('#sirketler').find('option:selected').attr("sirketid");   // gelgel
     
   //   alert($(this).attr("sirketid"));
   
   
  // alert(bbb);
    //  icazet();
      
      // alert($('#sirketler').attr("sirketid"));
      
      
         
         //alert("bny");
         /*
          * 
          *     
      
      
      var value = element.attr("value");
      var resim = element.attr("resim");
      
         $('#Calisan_IDDDD').val(value);
          * *
          */
         
        
         /*
         $('#'+iddd).attr('style',"display:none");    
         
         var element = $(this);
         var sirketid_d = element.attr("sirketid");
         alert(sirketid_d);
         */
         
       //  alert(idddf);
        
      
      //   var Sirket_ID_combo_select=$('#sirketler').find('option:selected').val();   
         
     //  alert(idddf);
      
         
         
      ///   $('#Sirket_ID_d').val(Sirket_ID_combo_select);
         
     //    var ddd =$('#Sirket_ID_d').val();
         
     //    alert(ddd);
    
   
} );
    
    
    
    
    
    
    
    
    
    
    
      $('#urunler').on('click', 'option', function () 
      
    {
        
     var element = $(this);
     var idddf = element.attr("id");
    // alert($(this).val());
  //  $('#Urun_ID_d').val();
    // alert(idddf);
    
    $('#Urun_ID_d').val(idddf);
//    alert($('#Urun_ID_d').val(idddf));
    });
    

    
    
    
    

    $('#butonnn').attr('disabled',true);
    
    
    
    
                                       
} );

function btnkaydet()
{  $('#butonnn').text("KAYDET");}



          function  pasifeal()
    {
      $('#butonnn').attr('disabled',true);  
        $('#blah').attr('style',"width:450px;height:429px;border-style:hidden;float:left;margin-left:30px;");    
         $('#gorselvarmi_ID').val("martidsfsdfye");
    }       
    
        function  aktifeal()
    {
      $('#butonnn').attr('disabled',false);  
    }     

function yonlendirmeguncelle()
{
     $('#form2').attr('action',"UrunKisimUpdate");
}


function yonlendirmekaydet()
{
     $('#form2').attr('action',"UrunKisimInsert");
     $('#blah').attr('src',"img/sirketler.png");
}






       function icazetovaltin(adef)  
{          
  var letters = /^[a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\.]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' '); 
  adef.value=adef.value.split('..').join('.'); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  


      
}  



function UrunFiltreSirket(sirketID)
{
   
 //   var lengthh = $('#urunler').children('option').length;     // selectin içindeki option sayısı
  var urunlerselect=document.getElementById("urunler");
  var lengthh=document.getElementById("urunler").length;
 
    
    for(var x=1;x<lengthh+1;x++)
    
    {
         
        var urunid=urunlerselect[x].getAttribute('id');
       if (urunlerselect[x].getAttribute('sirketid2')!==sirketID)
       
            {
  
    
    // urunlerselect[x].Attribute('style')='display:none';
    
 $('#'+urunid).attr('style',"display:none");    
        
            }
            
            else if(urunlerselect[x].getAttribute('sirketid2')===sirketID)
            
            {
                $('#'+urunid).attr('style',"display");    
            }
   
       
    }                                                        
}



////////////////// file resim bölümü

   
    $("#upfile1").click(function () {
                   
  // $("#elktat_logogunc").val("marti");
    $("#imgInp").trigger('click');
    
});
    





   function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('style',"width:450px;height:429px;border-style:hidden;float:left;margin-left:30px;");
            $('#blah').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
        $('#gorselvarmi_ID').val("marti");
    //    alert($('#gorselvarmi_ID').val());
    }
}



 $("#imgInp").change(function(){
    readURL(this);
});

////////////////// file resim bölümü



var request;  
function sendInfo(urunkisimid)  
{  
  //var v=document.vinform.t1.value;  
  
  var url="folder/index22.jsp?val="+urunkisimid;  
  
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
//alert(val);
displayImage(val);
}  
}





function displayImage(byte)

{                       
    $('#blah').attr('style',"width:450px;height:429px;border-style:hidden;float:left;margin-left:30px;");
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
