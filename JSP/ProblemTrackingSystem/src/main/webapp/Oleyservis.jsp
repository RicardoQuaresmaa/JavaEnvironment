<%@page import="Connection.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Admin Panel</title>

<link rel="shortcut icon" href="img/admin.png"/>

<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bny.css" rel="stylesheet" type="text/css"/>
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
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">    
            
   <div class="row" style="height:15%;">
       
            <c:import url="import3/ust3.jsp"></c:import>  
          
        </div>      
            
      
            
  <div class="row" style="height:75%;background-color:">
    <div class="col-sm-1" style="height:90%;background-color:"></div>
    
    <div class="col-sm-10" style="height:90%">
        
        <div class="row" style="height:100%;background-color:">
            
            <div class="col-sm-1" style="height:100%"></div>
            <div class="col-sm-11" style="height:100%;background-color:">                                                                                                               
                <div class="panel panel-default" id="panelim" style="width:260px;height:370px;margin-top:5%;float:left;margin-left:15%">                                                           
                    <div class="panel-body" style="height:100%;width:80%">
                                                
   <form role="form" action="OleyServisInsert" runat="server" method="post" enctype="multipart/form-data" id="form1" name="NewForm" class ="form-horizontal">                                
                                
                                
  <div class="form-group" style="margin-left:10%;width:100%">
      <label for="text">Oley Servis Adı:</label>
      <input type="text"  class="form-control" id="servisadi_id" name="servisadii_name" onkeyup="alphanumeric(this);icazetovaltin(this);" onkeydown="alphanumeric(this);icazetovaltin(this);" style="width:100%;text-align:center;font-size:17px;height:35px">
        
     
  </div>                                                                        
       
        <div class="form-group" style="margin-left:10%;width:100%;">
      <label for="text">Servis Görevi:</label>
      <input type="text"  class="form-control" id="servisgorevi_id" name="servisgorevi_name" onkeyup="alphanumeric(this);icazetovaltin(this);" onkeydown="alphanumeric(this);icazetovaltin(this);" style="width:100%;text-align:center;font-size:17px;height:35px">
        
     
  </div>
       
       
              
<div class="radio" style="margin-left:20%;margin-top:2%;width:100%;margin-bottom:-10px;">
                                    
    <label><input type="radio" name="kritiklikdurumu" onclick="radiofunction();" value="kritik" id="kritik">Kritik</label><br>
   
        <label><input type="radio" name="kritiklikdurumu" onclick="radiofunction();" value="cokkritik" id="cokkritik">Çok Kritik</label>
    
    
          
</div>
       
       <hr  style="margin-left:0%;width:100%;">      
       
<div class="radio" style="margin-left:15%;width:100%;margin-top:-10px;">
                            
    <label><input type="radio" name="aktiflikdurumu" value="akt" id="Aktif">Aktif</label>
   
    <label style="margin-left:20px"><input type="radio" name="aktiflikdurumu" value="psf" id="Pasif">Pasif</label>
    
</div>
       
      
                                                                                                                                                                                                                              
                                <div class="form-group" id="upfile11" style="margin-left:20%;margin-top:5%;width:100%" >
                                    <button class="btn btn-default" id="btn_kayit_gunc" type="submit" onsubmit="" style="width:50%;padding-left:5px">KAYDET</button> <button class="btn btn-default" type="reset" id="reset" onclick="imgdefault();" style="padding-left:3%;width:43%;font-size:14px">TEMİZLE</button> 
 
  </div>
       
           <input type="hidden" id="servis_ID_ID_ID" name="servis_ID_name">
                  
</form>

                                          
                         <img id="blah" src="#"    style="float:left;width:140px;height:100px;margin-left:10px;border-style:hidden;display:none"/>
  
                     </div>
                    
                    
                     
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

  </div>
         
      
            <div class="panel panel-default" style="width:370px;height:370px;margin-top:5%;float:left;margin-left:20px">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" name="tablo" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
                            

      
               
              

         
                         
   
            </div>
            
            </div>
            
        </div>
            
            <div class="col-sm-1" style="height:90%;background-color:"></div>
            
            
        
    </div>
            
            
   
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import3/alt3.jsp"></c:import>     
              
          </div>
    
  </div>
            
        
            
   
                                                                                
                                     <%   
                  
                                  
   Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
                ResultSet rs = null;        
                
   String SQL = "select * from oleyservis_view";
            
              stmt = con.createStatement();
                rs = stmt.executeQuery(SQL);    

 //ArrayList <imagebyte> imagebyte=new ArrayList<imagebyte>() ;
 
%>


        


        
     

      
               <script>
                   
                   
                   function alphanumeric(asdasd)  
{   
    
    // var budur=asdasd.value;
    // var boyut=asdasd.value.length;
  var letters = /^[0-9a-zA-Z \- \\*\\.\\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı]+$/;  
 
 //  var letters = /[^a-z0-9]+$/;

 ///   /^[A-Za-z]+$/;   /^[0-9a-zA-Z]+$/;  
if(!asdasd.value.match(letters))  
{  

asdasd.value = asdasd.value.substring(0,asdasd.value.length-1);


asdasd.focus();  
}  

//////////////////////
var bir=document.getElementById("kritik").checked;
var iki=document.getElementById("cokkritik").checked;


var ttt33=document.getElementById("servisadi_id").value.length;
var ttt44=document.getElementById("servisgorevi_id").value.length;


if (ttt33>2 && ttt44>2 && (bir || iki))
{  
      $('#btn_kayit_gunc').attr('disabled',false);  
}

else {
     $('#btn_kayit_gunc').attr('disabled',true);  
            
}

////////////////////////////
      
}  



function radiofunction()
{
    
    var ttt33=document.getElementById("servisadi_id").value.length;
var ttt44=document.getElementById("servisgorevi_id").value.length;


if (ttt33>2 && ttt44>2)
{  
      $('#btn_kayit_gunc').attr('disabled',false);  
}

else {
     $('#btn_kayit_gunc').attr('disabled',true);  
            
}
    
}

                                           
            var bizimkiler = [
                <%  while(rs.next()){
                   
                      
           //   imagebyte.add(new imagebyte(rs.getInt("ID"), rs.getBytes("Logo")));
           
                %>                                                                                                                        
                
                ["<%= rs.getInt("ID")%>","<%= rs.getString("Adi")%>","<%= rs.getString("Durumu")%>","<%= rs.getString("gorevi")%>","<%= rs.getString("kritiklik")%>"],                                              
    <%  } %>
];


 
$(document).ready(function() {
    
    
  pasifeal();
  
    
    

    
 

    
    
    
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Servis Adı" },            
            { title: "Durum" }  
             
                             
        ],         
        scrollY:        "293px",
        scrollX:        "true",
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
        
        
        var data = table.row( this ).data();
        
        aktifeal();
        
        $('#servisadi_id').val(data[1]);
        
        $('#form1').attr('action',"OleyServisUpdate");
        
          $('#servisgorevi_id').val(data[3]);
        
          $('#servis_ID_ID_ID').val(data[0]);

        if (data[2]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[2]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}



   if (data[4]==="Aktif") {
    $('#kritik').prop('checked',true) ;    
}

else if (data[4]==="Pasif") {
    
     $('#cokkritik').prop('checked',true)
    
}



             
   
    
   
     
    $('#btn_kayit_gunc').text("GÜNCELLE");
     

        
        
    } );
    
    
    
} );



function imgdefault()
{
  // $('#blah').attr('src',"img/seffaf.png");
  // $('#blah').attr('style',"display:none");
    $('#btn_kayit_gunc').text("KAYDET");
pasifeal();
$('#form1').attr('action',"OleyServisInsert");

          
}






      function  pasifeal()
    {
      $('#btn_kayit_gunc').attr('disabled',true);  
    }         


function  aktifeal()
    {
      $('#btn_kayit_gunc').attr('disabled',false);  
    }
    
    
    
            
                     function icazetovaltin(adef)  
{          
 // var letters = /^[a-zA-Z0-9 \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' ');   
}  
    


        </script>
               
               
        
 
  

</body>
</html>
      
      
        
      
      
