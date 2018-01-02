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

    
    <script src="js/jquery-1.12.3.js" type="text/javascript"></script>
    <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
        width:500px;
    }
    
#example_paginate
{
    width:500px;
  height:70px;
    float:left;
   margin-top:-5px;
  
   font-size:10px;
   margin-left:-290px;
}



#example_previous
{width:70px;}

#example_next
{margin-right:5px;}

.paginate_button
{
    width:40px;
    height:20px;  
    font-size:10px;
    background-color:white;
}



    div.dataTables_paginate
    {
       margin-top: 5px;             
    }
    
    
    
  .dataTables_length
  {
     width:300px;
     height:40px;
     /* background-color:red; */
  }
  
    #example_filter
    {
   /*    background-color:red;  */
        width:270px;
    }    
    
    
                </style>    
                    
                    
                    
                    
                    
     
     
                                                                                              
     </head>
    
    
    
    
<body>    
     <%
     if (request.getSession().getAttribute("ID_")==null) {
                                                       response.sendRedirect("Login.jsp");
                                                }
     %>
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import/ust.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
    <div class="col-sm-1" style="height:90%;"></div>
    
    <div class="col-sm-11" style="height:90%">
        
        <div class="row" style="height:100%;">
            
            
            
            
            <div class="col-sm-1" style="height:100%"></div>
            <div class="col-sm-9" style="height:100%;">                                                                                                               
                <div class="panel panel-default" id="panelim" style="width:250px;height:370px;margin-top:5%;float:left;margin-left:5%">                                                           
                    <div class="panel-body" style="height:100%;width:80%">
                        
                        
   <form role="form" action="MusteriSirketInsert" runat="server" method="post" enctype="multipart/form-data" id="form1" name="NewForm" class ="form-horizontal">                                
                                
                                
  <div class="form-group" style="margin-left:10%;width:100%">
      <label for="text">Müşteri Şirket:</label>
      <input type="text"  class="form-control" id="sirketadi" name="sirketadii" onkeyup="alphanumeric();icazetovaltin(this);" onkeydown="alphanumeric();icazetovaltin(this);" style="width:100%;text-align:center;font-size:17px;height:35px">
        
        <input type="hidden" id="elktat" name="ID_beeem">
            
            <input type="hidden" id="elktat_logogunc" name="logoguncvarmi" >
  </div>
                                
                                                                      
<div class="radio" style="margin-left:20%;margin-top:5%;width:100%">
                                    
    <label><input type="radio" name="optradio" value="akt" id="Aktif">Aktif</label>
   
    <label style="margin-left:20px"><input type="radio" name="optradio" value="psf" id="Pasif"   >Pasif</label>
</div>
                                            
                                                                
                                <div class="form-group" id="upfile1" style="border-style: solid;border-width: 1px;width:100%;cursor:pointer;text-align:center;margin-left:10%;margin-top:5%">
                                     <label for="text"  style="cursor:pointer;">Logo Yükle</label>
 
  </div>
                                                                                         
                                <div class="form-group" id="upfile11" style="margin-left:10%;margin-top:5%;width:100%" >
                                    <button class="btn btn-default" id="btn_kayit_gunc" type="submit" onsubmit="" style="width:50%;padding-left:5px">KAYDET</button> <button class="btn btn-default" type="reset" id="reset" onclick="imgdefault();" style="padding-left:3%;width:43%;font-size:14px">TEMİZLE</button> 
 
  </div>
                      <input type="file" name="logo" id="imgInp" style="display:none" />
</form>

                                          
                         <img id="blah" src="#"    style="float:left;width:140px;height:100px;margin-left:10px;border-style:hidden;display:none"/>
  
                     </div>
                    
                    
                     
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

  </div>
         
      
            <div class="panel panel-default" style="width:570px;height:370px;margin-top:5%;float:left;margin-left:20px">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" name="tablo" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
                            

      
               
              

         
                         
   
            </div>
            
         
            
             
            
            
            
      <div class="col-sm-1" style="height:100%;"></div>
     
                       
                
                         
                 
                
                
                
          
                
                
                
            </div>
            
        </div>
            
           
            
            
        
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import/alt.jsp"></c:import>     
              
          </div>
    
  </div>
            
        
            
   
                                                                                
                                     <%   
                  
                                  
     Connection con;                       
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
                ResultSet rs = null;        
                
   String SQL = "select * from [MusteriSirket_view]";

            
              stmt = con.createStatement();
                rs = stmt.executeQuery(SQL);    

 //ArrayList <imagebyte> imagebyte=new ArrayList<imagebyte>() ;
 
%>


        


        
     

      
               <script>
                   
                   
                   function alphanumeric()  
{   
    
    // var budur=document.NewForm.sirketadii.value;
    // var boyut=document.NewForm.sirketadii.value.length;
  var letters = /^[0-9a-zA-Z \- \\*\\.\\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı]+$/;  
 
 //  var letters = /[^a-z0-9]+$/;

 ///   /^[A-Za-z]+$/;   /^[0-9a-zA-Z]+$/;  
if(!document.NewForm.sirketadii.value.match(letters))  
{  

document.NewForm.sirketadii.value = document.NewForm.sirketadii.value.substring(0,document.NewForm.sirketadii.value.length-1);


document.NewForm.sirketadii.focus();  
}  

//////////////////////7

var ttt=document.NewForm.sirketadii.value.length;
if (ttt>2) {
      $('#btn_kayit_gunc').attr('disabled',false);  
}

else {
     $('#btn_kayit_gunc').attr('disabled',true);  
            
}

////////////////////////////
      
}  

                                           
            var bizimkiler = [
                <%  while(rs.next()){
                     String b644 = javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("Logo"));
                      
           //   imagebyte.add(new imagebyte(rs.getInt("ID"), rs.getBytes("Logo")));
           
                %>                                                                                                                        
                
                ["<%= rs.getInt("ID")%>","<%= rs.getString("Adi")%>","<%= rs.getString("Durum")%>","<%=b644%>"],                                              
    <%  } %>
];


 
$(document).ready(function() {
    
 
    
    
    
  pasifeal();
  
    
    
    
               $("#upfile1").click(function () {
                   
  $("#elktat_logogunc").val("marti");
    $("#imgInp").trigger('click');
    
});
    
 
    
     $("#imgInp").change(function(){
    readURL(this);
});
    
    
    
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Şirket Adı" },            
            { title: "Durum" }                                            
        ],         
        lengthMenu:[[5,-1],["Some","All"]],
        scrollY:        "200px",
        scrollX:        "true",
        scrollCollapse: true,
        ordering:true,
        paging:true,
      bFilter:true,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false                                                                                                       
    
    } );   
    
                      
        $("table tr").css('cursor', 'pointer');
  
    
    
    
     var table = $('#example').DataTable();
     
    $('#example tbody').on('click', 'tr', function () {
        var data = table.row( this ).data();
        
          
        
        
        
        $('#sirketadi').val(data[1]);
        
        $('#form1').attr('action',"MusteriSirketUpdate");

        if (data[2]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[2]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}
             
    $('#elktat').val(data[0]);
    
   
     
    $('#btn_kayit_gunc').text("GÜNCELLE");
    
    aktifeal();
     
   //  alert(data[0]);
     
        displayImage(data[3]);
        
    //   alert($('#elktat').val());
        
        
    } );
    
    
    
} );



function imgdefault()
{
   $('#blah').attr('src',"img/seffaf.png");
  // $('#blah').attr('style',"display:none");
    $('#btn_kayit_gunc').text("KAYDET");
pasifeal();
$('#form1').attr('action',"MusteriSirketInsert");

          
}


function displayImage(byte)

{                       
    $('#blah').attr('style',"float:left;width:140px;height:100px;margin-left:25px;border-style:hidden");
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}




   function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('style',"float:left;width:140px;height:100px;margin-left:25px;border-style:hidden");
            $('#blah').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
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
//  var letters = /^[a-zA-Z0-9 \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' '); 
/*
if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  
*/

      
}  
    


        </script>
               
               
        
 
  

</body>
</html>
      
      
        
      
      
