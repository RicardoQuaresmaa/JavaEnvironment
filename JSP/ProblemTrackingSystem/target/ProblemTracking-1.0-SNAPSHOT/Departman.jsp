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
           
                
   String SQL = "select ID,Adi from Sirket where Aktif_Pasif=1";
   
   String SQL11 = "select * from DepartmanSirketDetay";

            
              stmt = con.createStatement();
                rsr = stmt.executeQuery(SQL);                
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import/ust.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%">
   
    
    
        
  
            
            <div class="col-sm-1" style="height:100%"></div>
            <div class="col-sm-10" style="height:100%;background-color:">                                                                
       
            
          
  
                
                <div class="panel panel-default" style="width:250px;height:350px;margin-top:3.5%;float:left;margin-left:10%">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:85%">
                         
                         
  <form role="form" id="form2" name="NewForm11" action="DepartmentInsert" runat="server" method="post" enctype="multipart/form-data" >
  <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Departman Adı:</label>
    <input type="text" class="form-control" id="Departman_adiii" name="Departman_adiii_t"   onkeyup="icazet();icazetovaltin(this)" onkeydown="icazet();icazetovaltin(this);"  style="text-align:center;font-size:20px;height:37px;width:100%" >
      
  </div>
                                
                                
           
     <div class="form-group" style="margin-left:10%;width:100%;margin-top:10%">
    <label for="text">Şirket:</label>
    <div> 
    
        <select id="sirketler" class="form-control" onclick="icazet();" name="sirketov" style="font-size:17.8px;width:100%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Şirket Seçiniz</option>
    
      <%  while(rsr.next()){ %>
        
      <option class="sirket" value="<%= rsr.getInt("ID")%>" bny="<%= rsr.getString("Adi")%>"><%= rsr.getString("Adi")%></option>
        <% } %>
        
        </select>
        
        
        
        
        
        
        
    </div>
  </div> 
                                
                                
<div class="radio" style="margin-left:20%;margin-top:15%;width:100%">
                                    
       <label><input type="radio" name="optradio" value="akt" id="Aktif">Aktif</label>
   
       <label style="margin-left:20px"><input type="radio" name="optradio" value="psf" id="Pasif" >Pasif</label>
</div>
            
                                
                                
                                
                               
                               
                                
                          
                               
                                <div class="form-group" id="upfile1" style="margin-left:10%;margin-top:15%;width:100%" >
                                    <button class="btn btn-default" type="submit" id="butonnn"  style="width:55%">KAYDET</button><button class="btn btn-default" type="reset" id="reset" onclick="pasifeal();btnkaydet();yonlendirmekaydet();" style="padding-left:3%;width:40%;font-size:14px;float:right">TEMİZLE</button> 
 
  </div>
        
        
        <input type="hidden" id="Sirket_ID_d" name="Sirket_ID_dd" value="">
             
            <input type="hidden" id="Dep_ID_d" name="Depa_ID_dd" value="">
        
        
                    
</form>

                         
                        
  
                     </div>

  </div>
         
      
            <div class="panel panel-default" style="width:600px;height:350px;margin-top:3.5%;float:left;margin-left:70px">
                
                <div class="panel-body">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
                            

      
               


         
                         
   
            </div>
            
         
            
             
            
            
            
      <div class="col-sm-1" style="height:100%"></div>
     
                       
                
                         
                 
                
                
                
          
                
                
                
           
            
     
            
            
            
            
        
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import/alt.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                   
                   
                   
             
    function icazet()  
{   
    

    
  var letters = /^[0-9a-zA-Z \- \\*\\.\\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;


if(!document.NewForm11.Departman_adiii_t.value.match(letters))  
{  

document.NewForm11.Departman_adiii_t.value = document.NewForm11.Departman_adiii_t.value.substring(0,document.NewForm11.Departman_adiii_t.value.length-1);

 
 //   document.NewForm11.Departman_adiii_t.focus();  
}  
var ttt=document.NewForm11.Departman_adiii_t.value.length;
if ($('#sirketler').find('option:selected').val()>0 && ttt>2) {
      $('#butonnn').attr('disabled',false);  
}

else {
     $('#butonnn').attr('disabled',true);  
            
}

      
}  
                   
                   
                   
                   
                   
                   
<% rsr1 = stmt.executeQuery(SQL11);    %>
                                             
            var bizimkiler = [
                    
                <%  while(rsr1.next()){ %>
                
                ["<%= rsr1.getInt("DepartmanID")%>","<%= rsr1.getString("DepartmanAdi")%>","<%= rsr1.getString("SirketAdi")%>","<%= rsr1.getString("dep_akt")%>"],
                                              
    <% } %>
    
];




 


 
$(document).ready(function() {
    
     
                                
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Departman Adı" }, 
            { title: "Şirket Adı" },
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
        
        
   
       
   
   
 
   
 // ----> anaörnek    $('#sirketler option[value=120]').prop('selected',true);
 
   $('#sirketler option[bny="'+data[2]+'"]').prop('selected',true);
        
 //  $('#sirketler').val(data[3]);
   // dana kuyruğu burada kopuyor
   
    //      $('#Sirket_ID_d').val($('select[name=sirketov]:option:selected').val());
          
   //  alert($('#sirketler option:selected').val());
     
      var bunyak=$('#sirketler option:selected').val();
      
      $('#Sirket_ID_d').val(bunyak);
     
          //////////dana
        aktifeal();
      //  alert(data[0]);
     
     
        
       $('#form2').attr('action',"DepartmentUpdate");

        if (data[3]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[3]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}
// alert(data[0]);

$('#butonnn').text("GÜNCELLE");

 $('#Dep_ID_d').val(data[0]);


             
    $('#Departman_adiii').val(data[1]);
    
    
  
    
    
    
 //   alert($('#Dep_ID_d').val());
     
  //  $('#btn_kayit_gunc').text("GÜNCELLE");
     
   //  alert(data[0]);
     
  
        
    //   alert($('#elktat').val());
        
        
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
    
    
    
    
    
    
    

    $('#butonnn').attr('disabled',true);
    
    
    
    
                                       
} );

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
     $('#form2').attr('action',"DepartmentUpdate");
}


function yonlendirmekaydet()
{
     $('#form2').attr('action',"DepartmentInsert");
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
        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
