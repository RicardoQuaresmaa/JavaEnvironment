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
                    
                 
              
     
   #example_paginate
{
    width:160px;
  height:70px;
    float:left;
   margin-top:-20px;  
   font-size:10px;
   margin-left:-55px;
   background-color:red;
}

#example1_wrapper
{
    width:600px;
}
     
    div.dataTables_wrapper
    {
        font-size:15px;
        width:300px;
    }
   
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
    
    
    
    
    /*    
    2. datatable başlangıç yeri
      */     
      
      
      
      
      
         
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
      String SQL13 = "select dd.DepartmanID 'ID',dd.DepartmanAdi 'depadi',dd.Sirket_ID 'sirket_ID' from DepartmanSirketDetay2 dd";
       String SQL119 = "select * from calisan_gorev_view";              
       String SQL007 = "select c.ID,c.Ad+' '+c.Soyad as 'adsoyad',c.Resim 'resim' from Calisan c where c.Aktif_Pasif=1";
        String SQL13154 ="select g.ID 'ID',g.Ad 'Ad',d.ID 'dep_ID',d.Sirket_ID 'sirket_ID' from Gorev g inner join Departman d on d.ID=g.Departman_ID inner join Sirket s on  s.ID=d.Sirket_ID where g.Aktif_Pasif=1 and d.Aktif_Pasif=1 and s.Aktif_Pasif=1";
       
       
       
    

            
              stmt = con.createStatement();
                             rsr17 = stmt.executeQuery(SQL11); 
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import/ust.jsp"></c:import>  
          
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
            
            <div class="panel panel-default"  style="width:950px;height:450px;float:left;margin-left:20px;">
                                                           
                    <div class="panel-body" style="height:100%;width:100%;">
                        
                        <div class="row" style="height:100%;width:100%;">
                            
                           <form role="form" action="CalisanGorev" runat="server" method="post" enctype="multipart/form-data" id="formiste" name="NewForm116">
                            
                            <div class="col-sm-3" style="height:100%;">                                
                               <img id="blah"  alt="" src="img/sirketler.png" style="width:225px;height:270px;float:left;"/>
                                         <select id="sirketler" class="form-control" name="sirketov" style="font-size:17.8px;width:106%;height:40px;">
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
        
   
        
        <select id="gorev" class="form-control" onclick="gorevFonksiyon();" name="gorevov" style="font-size:19px;width:106%;height:40px;margin-top:10px;">
    <option class="placeholder" selected disabled value="" selected="true" >Görev Seçiniz</option>
    
      <%  rsr1089bb = stmt.executeQuery(SQL13154);   
          while(rsr1089bb.next()){ %>
        
            <option class="sirket" id="<%= rsr1089bb.getInt("ID")%>" sirketid="<%= rsr1089bb.getInt("sirket_ID")%>"  depid="<%= rsr1089bb.getInt("dep_ID")%>"><%= rsr1089bb.getString("Ad")%></option>
        <% } %>
        
        </select>
                            </div>
                            <div class="col-sm-9" style="height:100%;">
                                                        
                                <table id="example1" class="row-border" cellspacing="0" width="100%" height="90%" style="float:right;">
                
    
            </table>     
                                
                                
                                <p id="piste" style="width:45%;float:left;font-size:22px;color:#000066;height:25px;font-weight:lighter;"></p> 
                            <button class="btn btn-default" type="reset" onclick="pasifeal();" style="width:15%;margin-left:3%;float:left;margin-top:0px;">TEMİZLE</button>                                                                   
            <button class="btn btn-default" id="btnSil"  type="submit" disabled style="float:left;width:15%;margin-left:3%;margin-top:0px;">SİL</button>                      
            <button class="btn btn-default" id="btnKaydettt"  type="submit" disabled style="float:left;width:15%;margin-left:3%;margin-top:0px;">KAYDET</button>                                      
                            </div>
        
        
        
           <input id="gorevid_tablodan" name="gorevid_tir_name" type="hidden"/>
            <input id="calisanid_tablodan" name="calisanid_tir_name" type="hidden"/>
            
            
            
            <input id="gorevid_kamyon" name="gorevid_kamyon_name" type="hidden"/>
            <input id="calisanid_kamyon" name="calisanid_kamyon_name" type="hidden"/>
            
            <input id="islem_id" name="islem_name" type="hidden"/>
        
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
                   
                   function minkarakter()
                   {
             
                  var gorev1=document.NewForm116.gorevid_tir_name.value.length;
                                    var calisan1=document.NewForm116.calisanid_tir_name.value.length;
                                    var gorev2=document.NewForm116.gorevid_kamyon_name.value.length;
                                    var calisan2=document.NewForm116.calisanid_kamyon_name.value.length;
                
              //       alert(gorev1+' '+calisan1+' '+gorev2+' '+calisan2);
                
                    if ((gorev1>0 && calisan1>0) ||(gorev2>0 && calisan2>0)) {
    
    
    
    document.getElementById('btnKaydettt').setAttribute('disabled',false);
    

}

else
{
    document.getElementById('btnKaydettt').setAttribute('disabled',true);
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
               
    
                <%  rsr187 = stmt.executeQuery(SQL119);   
                    while(rsr187.next()){ 
                
                %>
                
                ["<%= rsr187.getString("calisan")%>","<%= rsr187.getString("gorev")%>","<%= rsr187.getString("departman")%>","<%= rsr187.getString("sirket")%>","<%= rsr187.getInt("calisanid")%>","<%= rsr187.getInt("gorevid")%>"],
                                              
    <% } %>
    


];








  var bizimkiler45 = [
               
    
                <%  rsr18799 = stmt.executeQuery(SQL007);   
                    while(rsr18799.next()){ 
                String b644 = javax.xml.bind.DatatypeConverter.printBase64Binary(rsr18799.getBytes("resim"));
                %>
                
                ["<%= rsr18799.getInt("ID")%>","<%= rsr18799.getString("adsoyad")%>","<%=b644%>"],
                                              
    <% } %>
    


];











 
$(document).ready(function() {
    

$('#btnKaydettt').attr('disabled',true);  

$('#btnSil').attr('disabled',true);  
    
                          
    $('#example').DataTable( {
                                       
        data: bizimkiler45,
        
        columns: [
            
            { title: "ID" },
            { title: "Ad Soyad" }                                           
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
            
            { title: "Çalışan" },
            { title: "Görev" },
            { title: "Departman" },
            { title: "Şirket" }                                          
        ],
          lengthMenu: [[7,-1], ["Some", "All"]],
        scrollY:"270px",
        scrollX:"true",
        scrollCollapse: true,
        ordering:true,
        paging:true,
      bFilter:true,
      bInfo:false,
      bPaginate:false,
      hover:true,
      bline:false
                                                                                           
    } );
    
    
    
    
    
    
    
    
    
    
    
    
    $("table tr").css('cursor', 'pointer');
  
    
    
    
     var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        
        displayImage(data[2]);
        
        $('#calisanid_kamyon').val(data[0]);
        
        minkarakter();
        
        kaydetpasifkontrol();
        
     //   $('#piste').text(data[0]+' '+data[1]); pişti
                       
    } );
    
    
      var table1 = $('#example1').DataTable();
      
      $('#example1 tbody').on('click', 'tr', function () {
                    
        var data = table1.row( this ).data();
                     
        $('#calisanid_tablodan').val(data[4]);
        
        $('#gorevid_tablodan').val(data[5]);                
   
        $('#islem_id').val("delete");
        
        pasifeal();
        
        $('#btnSil').attr('disabled',false);  
        
         
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
                      
});
    
    
    
    
    
      $('#Departman').on('click', 'option', function () {
                           
         var element = $(this);
         var idddf = element.attr("id");
        GorevFiltreDepartman(idddf);
             
});
    
    
    
    
      $('#gorev').on('click', 'option', function () {
                           
         var element = $(this);
         var idddf = element.attr("id");
      
      $('#gorevid_kamyon').val(idddf);
      
             minkarakter();
      kaydetpasifkontrol();
});
    
  
  
  
    
                                           
});


 

function pasifeal()
{
      $('#btnKaydettt').attr('disabled',true);  
      
      $('#btnSil').attr('disabled',true); 
        
   $('#blah').attr('src',"img/sirketler.png");
   
   $('#gorevid_kamyon').val("");
   $('#calisanid_kamyon').val("");
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



function kaydetpasifkontrol()
{
    $('#btnSil').attr('disabled',true);  
    
    var lll1= $('#gorevid_kamyon').val();
    
    var lll2= $('#calisanid_kamyon').val();
    
    if (lll1>0 && lll2>0)
    
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
    $('#blah').attr('style',"width:225px;height:270px;");
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}
















        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      

    























