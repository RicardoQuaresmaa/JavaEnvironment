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

  width:650px;
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
                ResultSet rsr17 = null;      
                ResultSet rsr1 = null;  
                  ResultSet rsr187 = null;  
                  ResultSet rsr18799 = null;                    
                  ResultSet rsr1089bb = null; 
                  
                  
                
       
                

     String SQL11 = "select ID,Adi from Sirket where Aktif_Pasif=1";
      String SQL13 = "select dd.DepartmanID 'ID',dd.DepartmanAdi 'depadi',dd.Sirket_ID 'sirket_ID' from DepartmanSirketDetay3 dd";
       String SQL119 = "select * from ProblemGorevView";              
       String SQL007 = "select * from ProblemDetay_view";
        String SQL13154 ="select g.ID 'ID',g.Ad 'Ad',d.ID 'dep_ID',d.Sirket_ID 'sirket_ID' from Gorev g inner join Departman d on d.ID=g.Departman_ID inner join Sirket s on s.ID=d.Sirket_ID where s.Aktif_Pasif=1 and d.Aktif_Pasif=1 and g.Aktif_Pasif=1";
       
       
       
    

            
              stmt = con.createStatement();
              rsr17 = stmt.executeQuery(SQL11); 
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import2/ust2.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
      
      
      
      
      
      
      
      <div class="col-sm-3">
          
       <div class="panel panel-default" style="width:350px;height:450px;float:right;margin-right:-30px;">
                
                <div class="panel-body">
                         
       <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">  
                    
            </table>      
              
                    
                </div>
                
            </div>   
          
          
          
          
      </div>
      
      
        <div class="col-sm-9">
            
            <div class="panel panel-default" onmouseover="butonkontrol();" style="width:950px;height:450px;float:left;margin-left:20px;">
                                                           
                    <div class="panel-body" style="height:100%;width:100%;">
                        
                        <div class="row" style="height:80%;width:100%;">
                            
                           <form role="form" action="ProblemGorev" runat="server" method="post" enctype="multipart/form-data" id="formiste" name="NewForm116">
                            
                            <div class="col-sm-3" style="height:100%;">                                
                               <img id="blah"  alt="" src="img/sirketler.png" style="width:225px;height:225px;"/>
                                         <select id="sirketler" class="form-control" name="sirketov" style="font-size:17.8px;width:106%;height:40px;margin-top:30px;">
    <option class="placeholder" selected disabled value="" selected="true" >Şirket Seçiniz</option>
    
      <%      
          while(rsr17.next()){ %>
        
      <option class="sirket" value="<%= rsr17.getInt("ID")%>"><%= rsr17.getString("Adi")%></option>
        <% } %>
        
        </select>
        
        
        
         <select id="Departman" class="form-control" name="Departmanov" style="font-size:19px;width:106%;height:40px;margin-top:10px;">
    <option class="placeholder" selected disabled value="" selected="true" >Departman Seçiniz</option>
    
      <%  rsr1 = stmt.executeQuery(SQL13);   
          while(rsr1.next()){ %>
        
            <option class="sirket" id="<%= rsr1.getInt("ID")%>"  sirketid="<%= rsr1.getInt("sirket_ID")%>"><%= rsr1.getString("depadi")%></option>
        <% } %>
        
        </select>
        
   
        
           <select id="gorev" class="form-control" name="gorevov" style="font-size:19px;width:106%;height:40px;margin-top:10px;">
    <option class="placeholder" selected disabled value="" selected="true" >Görev Seçiniz</option>
    
      <%  rsr1089bb = stmt.executeQuery(SQL13154);   
          while(rsr1089bb.next()){ %>
        
            <option class="sirket" id="<%= rsr1089bb.getInt("ID")%>" sirketid="<%= rsr1089bb.getInt("sirket_ID")%>"  depid="<%= rsr1089bb.getInt("dep_ID")%>"><%= rsr1089bb.getString("Ad")%></option>
        <% } %>
        
        </select>
                            </div>
                            <div class="col-sm-9" style="height:100%;">
                                                        
                                <table id="example1" class="row-border" cellspacing="0" width="100%" height="90%" >
                
    
            </table>     
                                
                                
                                
            
                            </div>
        
        
    
        
           <input id="gorevid_tablodan" name="gorevid_tir_name" type="hidden"/>
            <input id="problemid_tablodan" name="problemid_tir_name" type="hidden"/>
            
            
            
            <input id="gorevid_kamyon" name="gorevid_kamyon_name" type="hidden"/>
            <input id="problemid_kamyon" name="problemid_kamyon_name" type="hidden"/>
            
            
            <input id="islem_id" name="islem_name" type="hidden"/>
            
            
        
        
        
                                 
                        </div>
        
        
        
        <div class="row" style="height:20%;width:100%;">
            
            <div class="col-sm-3" style="height:100%;">
                
                
                                                            <button class="btn btn-default" type="reset" onclick="pasifeal();resimdefault();" style="width:60%;">TEMİZLE</button>                                                                
                                    <button class="btn btn-default" id="btnSil"  type="submit" disabled style="width:36%;">SİL</button>                      <br>
            <button class="btn btn-default" id="btnKaydettt"  type="submit" disabled style="width:99%;margin-top:10px;">KAYDET</button>                                      
            
                
            </div>
            <div class="col-sm-6" style="height:100%;">
                
                
                <textarea  class="form-control" id="problemgorevaciklama_kamyon" placeholder="Problem - Görev İlişkisi.." name="problemgorevaciklama_kamyon_name"  onkeyup="icazetov(this);kaydetpasifkontrol();"  onkeydown="icazetov(this);kaydetpasifkontrol();"  style="font-size:20px;height:80px;width:105%;float:left;margin-left:-15px;"></textarea>
                
            </div>
           
                                    
                                   
                              </form>             
        
                                        
                                
                                </div>
                         
                         
                      
                        
          
                                
                                                                                                                                                                                                                                              
                     </div>

  </div>
            
        </div>
       
      
      
      
      
      
   
     
      
  
      
         
      
           
                            
 
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import/alt.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                                                                                                                                                                                                                                                        
                     function icazetov(adef)  
{          
  var letters = /^[0-9a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\,\\.]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' ');   
  adef.value=adef.value.split('..').join('.'); 
  adef.value=adef.value.split(',,').join(','); 

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}     
}  

                                                                                                                         
            var bizimkiler = [
               
    
                <%  rsr187 = stmt.executeQuery(SQL119);   
                    while(rsr187.next()){ 
                
                %>
                
                ["<%= rsr187.getString("UrunKisimPro")%>","<%= rsr187.getString("gorevDepSirket")%>","<%= rsr187.getInt("UrunKisimProblem_ID")%>","<%= rsr187.getInt("Gorev_ID")%>","<%= rsr187.getString("problemgorevaciklama")%>"],
                                              
    <% } %>
    


];








  var bizimkiler45 = [
               
    
                <%  rsr18799 = stmt.executeQuery(SQL007);   
                    while(rsr18799.next()){ 
                String b644 = javax.xml.bind.DatatypeConverter.printBase64Binary(rsr18799.getBytes("Resim"));
                %>
                
                ["<%= rsr18799.getInt("ID")%>","<%= rsr18799.getString("ProblemAdi")%>","<%= rsr18799.getString("UrunKisimAdi")%>","<%= rsr18799.getString("UrunAdi")%>","<%=b644%>"],
                                              
    <% } %>    
];




 
$(document).ready(function() {
    

$('#btnKaydettt').attr('disabled',true);  

$('#btnSil').attr('disabled',true);  
    
                          
    $('#example').DataTable( {                                       
        data: bizimkiler45,        
        columns: [            
            { title: "ID" },
            { title: "ProblemAdi" },                                           
            { title: "UrunKisimAdi" },
            { title: "UrunAdi" }
            
        ],
            
        scrollY:"350px",
        scrollX:"true",
        scrollCollapse: true,
        ordering:false,
        paging:false,
      bFilter:true,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false
                                                                                           
    } );
                                   
      $('#example1').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "Ürün-Kısım-Problem" },                                                  
            { title: "Görev-Departman-Şirket"}           
        ],
          lengthMenu: [[6,-1], ["Some", "All"]],
        scrollY:"223px",
        scrollX:"true",
        scrollCollapse:true,
        ordering:true,
        paging:true,
      bFilter:true,
      bInfo:false,
      bPaginate:true,
      hover:false,
      bline:false
                                                                                           
    } );
                                                
    $("tr").css('cursor', 'pointer');          
    
     var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        
        displayImage(data[4]);
        
        $('#problemid_kamyon').val(data[0]);
        
        kaydetpasifkontrol();
        
        aciklamabosalt();
        
      
        
     //   $('#piste').text(data[0]+' '+data[1]); pişti
                       
    });
    
    var kontrolsayi=0;
    
      var table1 = $('#example1').DataTable();
      
      $('#example1 tbody').on('click', 'tr', function () {
                                                                            
        var data = table1.row( this ).data();
        
        
        
    
        
        $('#problemgorevaciklama_kamyon').val(data[4]);
                         
        $('#gorevid_kamyon').val('');
$('#problemid_kamyon').val('');
                     
        $('#gorevid_tablodan').val(data[3]);
        
        $('#problemid_tablodan').val(data[2]);                
   
        $('#islem_id').val("delete");
        
        pasifeal();
        
        $('#btnSil').attr('disabled',false);  
        
       
        if (kontrolsayi !==data[4]) 
        
        {
    sendInfo(data[2]);
     kontrolsayi=data[2];
}
       
                       
    });
    
    
 
    
    
       $('#sirketler').on('click', 'option', function () {
                           
         var element = $(this);
         var idddf = element.attr("value");
         DepartmanFiltreSirket(idddf);
  
     
         /*
         $('#'+iddd).attr('style',"display:none");    
         
         var element = $(this);
         var sirketid_d = element.attr("sirketid");
         alert(sirketid_d);
         */
                      
} );
    
    
    
    
    
      $('#Departman').on('click', 'option', function () {
                           
         var element = $(this);
         var idddf = element.attr("id");
        GorevFiltreDepartman(idddf);
             
});
    
    
    
  
  
      $('#gorev').on('click', 'option', function () {
                           
                           
         var element = $(this);
         var idddf = element.attr("id");       
              $('#gorevid_kamyon').val(idddf);
              kaydetpasifkontrol();
              
        //       alert($('#problemid_kamyon').val()+' '+$('#gorevid_kamyon').val());
              
               aciklamabosalt();
              
});
  
  
  
    
                                           
});

function resimdefault()
{
      $('#blah').attr('src',"img/sirketler.png");
}

function pasifeal()
{
      $('#btnKaydettt').attr('disabled',true);  
      
      $('#btnSil').attr('disabled',true); 
        
 
}



function GorevFiltreDepartman(departmanID)
{
   
 //   var lengthh = $('#Departman').children('option').length;     // selectin içindeki option sayısı
  var Gorevselect=document.getElementById("gorev");
  var lengthh=document.getElementById("gorev").length;
     
    for(var x=1;x<lengthh+1;x++)    
    {         
        var gor_id=Gorevselect[x].getAttribute('id');
       if (Gorevselect[x].getAttribute('depid')!==departmanID)       
            {      
    // urunlerselect[x].Attribute('style')='display:none';    
 $('#'+gor_id).attr('style',"display:none");            
            }            
            else if(Gorevselect[x].getAttribute('depid')===departmanID)            
            {
                $('#'+gor_id).attr('style',"display");    
            }          
    }   
}

function aciklamabosalt()
{    
    $('#problemgorevaciklama_kamyon').val('');
}

function kaydetpasifkontrol()
{
    $('#btnSil').attr('disabled',true);  
    
    var lll1= $('#gorevid_kamyon').val();
    
    var lll2= $('#problemid_kamyon').val();
    
    
    var lll3= $('#problemgorevaciklama_kamyon').val().length;
    
   // alert(lll3);
    
    if (lll1>0 && lll2>0 && lll3>3)
    
       {
           
    $('#btnKaydettt').attr('disabled',false);  
    $('#islem_id').val("insert");
}

else
{
      $('#btnKaydettt').attr('disabled',true);  
}
    
}

function DepartmanFiltreSirket(sirketID)
{
  
 //   var lengthh = $('#Departman').children('option').length;     // selectin içindeki option sayısı
  var Departmanselect=document.getElementById("Departman");
  var lengthh=document.getElementById("Departman").length;
     
    for(var x=0;x<lengthh+1;x++)    
    {         
        var dep_id=Departmanselect[x].getAttribute('id');
       if (Departmanselect[x].getAttribute('sirketid')!==sirketID)       
            {      
    // urunlerselect[x].Attribute('style')='display:none';    
 $('#'+dep_id).attr('style',"display:none");            
            }            
            else if(Departmanselect[x].getAttribute('sirketid')===sirketID)            
            {
                $('#'+dep_id).attr('style',"display");    
            }   
      
    }        
      
}







function displayImage(byte)

{                       
    $('#blah').attr('style',"width:225px;height:225px;");
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
    
    
    
    
    var request;  
function sendInfo(proid)  
{  
  //var v=document.vinform.t1.value;  
  
  var url="folder/index24.jsp?val="+proid;  
  
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

    
    
    
 
    
    




        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      

    























