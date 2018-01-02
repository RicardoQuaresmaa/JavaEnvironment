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
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="../css/bny.css" rel="stylesheet" type="text/css"
<link rel="stylesheet" href="http://formvalidation.io/vendor/bootstrap-combobox/css/bootstrap-combobox.css">   
    <link href="../css/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>
    

<script src="../CalisanDisKaynak/bootstrap-combobox.js" type="text/javascript"></script>


<script src="../CalisanDisKaynak/jquery-1.12.3.js" type="text/javascript"></script>



<script src="../CalisanDisKaynak/jquery.dataTables.min.js" type="text/javascript"></script>

<script src="../CalisanDisKaynak/dataTables.bootstrap.min.js" type="text/javascript"></script>


<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                                                   

    
    <link href="../CalisanDisKaynak/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    
    
    
                        
                    
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
           
                
 
   
   String SQL11 = " select u.ID,u.Ad from Urun u where u.Aktif_Pasif=1";
   
   String SQL113="select * from view_Problem_detay";   

 String SQL112="select uk.ID,uk.Urun_ID,uk.Ad from UrunKisim uk inner join Urun u on u.ID=uk.Urun_ID inner join Sirket s on s.ID=u.Sirket_ID  where uk.Aktif_Pasif=1 and u.Aktif_Pasif=1 and s.Aktif_Pasif=1";    

            
              stmt = con.createStatement();
                rsr = stmt.executeQuery(SQL11);                
                 
%>
  
    
        <div class="container" id="wrapper" style="height:99%;width:100%;background-color:#540909">
            
   <div class="row" style="height:11%;">
       
            <c:import url="../import5/ust5.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:80%;">
   
              
  
        
      <div class="col-sm-3">
          
                              
                <div class="panel panel-default" style="width:250px;height:485px;float:right;">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:85%">
                         
                         
  <form role="form" id="form2" name="NewForm11" action="../ProblemInsertttt" runat="server" method="post" enctype="multipart/form-data" >
      

      
      
       <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Problem Adı:</label>
    
        <textarea  class="form-control" id="problemadi_id" name="problemadi_name"   onkeyup="icazet(this);icazetovaltin(this)" onkeydown="icazet(this);icazetovaltin(this);"  style="font-size:13px;height:160px;width:100%;"></textarea>
  </div>
      
      

        
        
      
       <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Açıklama :</label>
   
      <textarea  class="form-control" id="problemaciklama_id" name="problemaciklama_name"   onkeyup="icazet(this);icazetovaltin(this)" onkeydown="icazet(this);icazetovaltin(this);"  style="font-size:13px;height:160px;width:100%;">

</textarea>
  </div>
      
       
                                
                         <div class="form-group" id="upfile1" style="border-style: solid;border-width: 1px;width:100%;cursor:pointer;text-align:center;margin-left:10%;margin-top:6%">
                                     <label for="text"  style="cursor:pointer;">Görsel Yükle</label>
 
  </div>      
                               
                                
                          
                               
                                <div class="form-group" id="butonlar" style="margin-left:10%;margin-top:8%;width:100%" >
                                    
  </div>
        
        
        
            
            <input type="hidden" id="gorselvarmi_ID" name="gorselvarmi" value="martimuyd">
             
            
                
                <input type="hidden" id="UrunKisimProblem_IDD" name="UrunKisimProblem_ID_name" value="">
                    
                    
                    
                    
                    
                     <input type="hidden" id="UrunKisim_IDDD" name="UrunKisim_ID_namename" value="">
                    
                     <input type="hidden" id="silmevarmi" name="silmevarmi" value="yok">
                    
        
        <input type="file" name="logo" id="imgInp" style="display:none">
                    

                                                   
                     </div>
  </div>
        
        
          
      </div>
    
        <div class="col-sm-4.2" style="background-color:red">
            
            
            
                         

        
        
        
        
        
         <div class="panel panel-default" style="width:500px;height:485px;float:left;margin-left:0px;">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">
                
                              
  
    
            </table>      
              
                    
                    <div class="row" style="height:60%;margin-top:5%;">
                        
                               <div class="col-sm-6" style="">

    <div> 
    
       
     
        
         <select id="urunler" class="form-control" name="urunov" onchange="icazet(this);" style="font-size:17px;width:95%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Ürün Seçiniz</option>
    
      <%  
          while(rsr.next()){ %>
        
      <option class="urun" id="<%= rsr.getInt("ID")%>"  urunadi="<%= rsr.getString("Ad")%>"><%= rsr.getString("Ad")%></option>
        <% } %>
        
        </select>
        
      
        
        
        
    </div>
  </div> 
        
        
        
        
        
        
        <div class="col-sm-6" style="">
   
    <div> 
    
       
        
        
         <select id="urunkisim" class="form-control" name="urunkisimov" onchange="icazet(this);" style="font-size:17px;width:95%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Ürün Kısım Seçiniz</option>
    
      <%  rsr1 = stmt.executeQuery(SQL112);   
      while(rsr1.next()){ %>
        
      <option class="urunkisim" urunkisimid="<%= rsr1.getInt("ID")%>" urunid="<%= rsr1.getInt("Urun_ID")%>" urunkisimadi="<%= rsr1.getString("Ad")%>"><%= rsr1.getString("Ad")%></option>
        <% } %>
        
        </select>
        
        
        
        
    </div>
  </div> 
        
        
                        
                    </div>
        <div class="row" style="height:40px;margin-top:3%;">
            
            
                                    
                                    
            
                                    <div class="col-sm-4">
                                        
                                     <button class="btn btn-default" type="reset" id="reset" onclick="pasifeal();btnkaydet();yonlendirmekaydet();" style="padding-left:1%;width:80%;font-size:14px">TEMİZLE</button> 
                                        
                                    </div>
            
                                    <div class="col-sm-4">
                                        
                                        
                                        <button class="btn btn-default" id="sil" type="button" onclick="silicek();" style="padding-left:1%;width:80%;font-size:14px;">SİL</button> 
                                    </div>
            
            <div class="col-sm-4">
                   <button class="btn btn-default" type="submit" id="butonnn"  style="width:80%;padding-left:3%;">KAYDET</button>
                
                
            </div>
            
        </div>

                    
                </div>
                
            </div>
            
            
              
            
        
        
        
        
        
        
        
         
                                                                
      </div>
                        
       </form>
        
        <div class="col-sm-4.8">
            
            <img id="blah" class="img-rounded" src="../img/sirketler.png"  style="width:450px;height:483px;border-style:hidden;float:left;"/>
            
        </div>
    
   

    </div>
        
        
   
    <div class="row" style="height:5%;">
        
      
   <div id="copyright"  style="height:100%;margin-top:2%;" >
    <p style="">&copy; Untitled. All rights reserved. |  Design by Monitoring Departmen of Broadage Sports & oley.com & İddaa.com</p>
</div>
          
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                   
                   
function UrunFiltreKisim(urunID)
{
   
 //   var lengthh = $('#urunler').children('option').length;     // selectin içindeki option sayısı
  var urunkisimselect=document.getElementById("urunkisim");
  var lengthh=document.getElementById("urunkisim").length;
     
    for(var x=1;x<lengthh+1;x++)
    
    {
         
     //   var urunid=urunkisimselect[x].getAttribute('urunid');
       if (urunkisimselect[x].getAttribute('urunid')!==urunID)
       
            {      
                
     urunkisimselect[x].setAttribute('style',"display:none");    
     
 // $('#'+urunid).attr('style',"display:none");    
        
            }
            
            else if(urunkisimselect[x].getAttribute('urunid')===urunID)
            
            {
                  urunkisimselect[x].setAttribute('style',"display");   
             //   $('#'+urunid).attr('style',"display");    
            }          
    }                                                        
}
                   
             
    function icazet(thisis)  
{   
    

    
  var letters = /^[0-9a-zA-Z \-\\*\\.\\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;


if(!thisis.value.match(letters))  
{  

thisis.value = thisis.value.substring(0,thisis.value.length-1);


// thisis.focus();  
}  
// var ttt=thisis.value.length;

// var bbb=$('#urunler').find('option:selected').attr("sirketid");

var bbb1=$('#urunkisim').find('option:selected').attr("urunkisimid");


        var yyy1=$('#problemadi_id').val().length;
 var yyy2=$('#problemaciklama_id').val().length;

// alert(yyy1);

if (bbb1>0 && yyy1>2 && yyy2>2) {
      $('#butonnn').attr('disabled',false);  
}

else {
     $('#butonnn').attr('disabled',true);  
            
}

      
}  






       function icazetovaltin(adef)  
{          
    // alert("bny");
  var letters = /^[a-zA-Z0-9 \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\.]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' '); 
  adef.value=adef.value.split('..').join('.'); 
  adef.value=adef.value.split('((').join('('); 
  adef.value=adef.value.split('))').join(')'); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  


      
}  
                   
                   
                   
                   
                   
                   
<% rsr2 = stmt.executeQuery(SQL113);    %>
                                             
            var bizimkiler = [
                    
                <%  while(rsr2.next()){ %>
                
                ["<%= rsr2.getInt("ID")%>","<%= rsr2.getString("ProblemAdi")%>","<%= rsr2.getString("UrunKisimAdi")%>","<%= rsr2.getString("UrunAdi")%>","<%= rsr2.getString("aciklama")%>"],
                                              
    <% } %>
    
];




 


 
$(document).ready(function() {
    
    
  
    
 $('#gorselvarmi_ID').val("eqweqwer3re");
 
                                
    $('#example').DataTable( {
                                       
     data:bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Problem" },
            { title: "Ürün Kısım" }, 
            { title: "Ürün" }                        
        ],
         lengthMenu: [[9,-1], ["Some", "All"]],
        scrollY:"250px",
        scrollX:"700px",
        scrollCollapse: true,
        ordering:true,
        paging:true,
      bFilter:true,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false
      
                                                                                           
    } );
 //   $("#example_wrapper").css('cursor', 'pointer');
    
     $("table").css('cursor', 'pointer');
    
    
    var table = $('#example').DataTable();
    
    
     
    $('#example tbody').on('click', 'tr', function () {
        
        
        
        
       
        
        $('#gorselvarmi_ID').val("martfsdferi");
     //   alert($('#gorselvarmi_ID').val());
        var data = table.row( this ).data();
        
 
       $('#problemadi_id').val(data[1]);
       
       $('#problemaciklama_id').val(data[4]);
      
  //    $('#UrunKisim_ID').val(data[0]);
        
      $('#urunler option[urunadi="'+data[3]+'"]').prop('selected',true);    // ürünler select box'ında ürünü seçiyoruz.
      
      $('#urunkisim option[urunkisimadi="'+data[2]+'"]').prop('selected',true);   
  
 //  var bny262=$('#urunler option:selected').attr("id");    
   
 //  var bny263=$('#urunler option:selected').attr("sirketid2");   // seçili ürünün şirker id sini alıyoruz..
      
 //    $('#urunler option[sirketid="'+bny263+'"]').prop('selected',true);    // ve ürün kısmından ürünümüzü seçtikten sonra, üründen ise şirketimzi seçiyorz.
   
    $('#sil').attr('disabled',false);
   
   
   
     var bunyak=$('#urunler option:selected').val();
 
   $('#UrunKisimProblem_IDD').val(data[0]);
   
  //  alert($('#UrunKisimProblem_IDD').val());
   
    aktifeal();
   
  $('#form2').attr('action',"../ProblemUpdateeee");



// fatihzeybek   

var elemannn=$('#urunkisim option:selected');
var tfftff=elemannn.attr("urunkisimid");
$('#UrunKisim_IDDD').val(tfftff);
        // alert($('#UrunKisimProblem_IDD').val());
        
        
        
        sendInfo(data[0]);
        
 // ----> anaörnek    $('#urunler option[value=120]').prop('selected',true);
        
 //  $('#urunler').val(data[3]);
   // dana kuyruğu burada kopuyor
   
    //      $('#Sirket_ID_d').val($('select[name=sirketov]:option:selected').val());
          
   //  alert($('#urunler option:selected').val());
     
     // $('#Dep_ID_d').val(data[0]);
                      
      //  alert(data[0]);
       $('#butonnn').text("GÜNCELLE"); 
                                                                     
    } );                                    
    
   
    


                

    $('#butonnn').attr('disabled',true);  
     $('#sil').attr('disabled',true); //zeybu
    
    
    
    
                                       
} );

function btnkaydet()
{  $('#butonnn').text("KAYDET");}

function silicek()
{   
  
    $('#form2').attr('action',"../ProblemDeleteeee");            
    $('#form2').submit();
    
}



          function  pasifeal()
    {
      $('#butonnn').attr('disabled',true);  
        $('#blah').attr('style',"width:460px;height:483px;border-style:hidden;float:left;");    
         $('#gorselvarmi_ID').val("martidsfsdfye");
    }       
    
        function  aktifeal()
    {
      $('#butonnn').attr('disabled',false);  
    }     

function yonlendirmeguncelle()
{
     $('#form2').attr('action',"../ProblemUpdateeee");
}


function yonlendirmekaydet()
{
     $('#form2').attr('action',"../ProblemInsertttt");
      $('#blah').attr('src',"../img/sirketler.png");
}




  $('#urunler').on('click', 'option', function () {
         
         
          //  alert("bunyo");
         var element = $(this);    
         var idddf = element.attr("id");
            UrunFiltreKisim(idddf);               
} );
    
    
    
    
    
      $('#urunkisim').on('click', 'option', function () {
         
         
      //   alert("bunyo");
         
         var element = $(this);    
         var burccc = element.attr("urunkisimid");
            
            //    alert(burccc);
            
         $('#UrunKisim_IDDD').val(burccc);
       //  alert("bunyo");
     
            
} );







////////////////// file resim bölümü

   
    $("#upfile1").click(function () {
                   
  // $("#elktat_logogunc").val("marti");
    $("#imgInp").trigger('click');
    
});
    






   function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('style',"width:450px;height:483px;border-style:hidden;float:left;margin-left:10px;");
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
  
  var url="../folder/index23.jsp?val="+urunkisimid;  
  
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
 
// var res = val.indexOf("abuzittinivr");

// alert(res);



//  alert(val.substring(0,res));
 
 
var resimbyte=val;
//alert(val);
 displayImage(resimbyte);
 
}  
}





function displayImage(byte)

{                       
    $('#blah').attr('style',"width:450px;height:483px;border-style:hidden;float:left;margin-left:10px;");
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
