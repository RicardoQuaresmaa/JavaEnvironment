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

    <link href="css/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>
    <script src="CalisanDisKaynak/bootstrap-combobox.js" type="text/javascript"></script>
    <script src="CalisanDisKaynak/jquery-1.12.3.js" type="text/javascript"></script>
    <script src="CalisanDisKaynak/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="js/dataTables.bootstrap.min.js" type="text/javascript"></script>
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
           
                
   String SQL = "select dd.DepartmanID,+dd.SirketAdi+'-'+dd.DepartmanAdi as 'DepartSirket' from DepartmanSirketDetay dd where dd.dep_akt='Aktif'";
   
    String SQL11 = "select * from GorevDepSir";

            
              stmt = con.createStatement();
                rsr = stmt.executeQuery(SQL);                
                 
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import/ust.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%">
   
    
    
        
  
            
         
            <div class="col-sm-12" style="height:100%;">                                                                
       
            
          
  
                
                <div class="panel panel-default" style="width:350px;height:350px;margin-top:3.5%;float:left;margin-left:15%">
                    
                   
                    
                    <div class="panel-body" style="height:100%;width:85%">
                         
                         
                             <form role="form" id="form3" name="NewForm11" action="GorevInsert" runat="server" method="post" enctype="multipart/form-data" >
  <div class="form-group" style="margin-left:10%;width:100%">
    <label for="text">Görev Adı:</label>
    <input type="text" class="form-control" id="GorevAdiii" name="GorevAdi" onkeyup="icazetovaltin(this);" onkeypress="icazetovaltin(this);" style="width:100%;text-align:center;font-size:20px;height:45px;">
  </div>
                                
           
     <div class="form-group" style="margin-left:10%;width:100%;margin-top:10%">
    <label for="text">Departman:</label>
    <div> 
    
        <select id="Departman" class="form-control" onclick="" name="Departmanov" style="font-size:19px;width:100%;height:40px">
    <option class="placeholder" selected disabled value="" selected="true" >Departman Seçiniz</option>
    
      <%  while(rsr.next()){ %>
        
            <option class="sirket" value="<%= rsr.getInt("DepartmanID")%>"><%= rsr.getString("DepartSirket")%></option>
        <% } %>
        
        </select>
        
        
        
        
        
        
        
    </div>
  </div> 
                                
                                
<div class="radio" style="margin-left:30%;margin-top:10%;width:100%">
                                    
    <label><input type="radio" name="optradio" value="akt" id="Aktif">Aktif</label>
   
    <label style="margin-left:15px"><input type="radio" name="optradio" value="psf" id="Pasif">Pasif</label>
</div>
            
                                
                                
                                
                               
                               
                                
                          
                               
                                <div class="form-group" id="upfile1" style="margin-left:10%;margin-top:10%;width:100%" >
                                    <button class="btn btn-default" id="kaydet_gorev" type="submit"  style="width:60%">KAYDET</button> <button class="btn btn-default" id="kaydet_gorev" type="reset" onclick="pasifeal();btnkaydet();"  style="width:37%;padding-left:5px">TEMİZLE</button>
 
  </div>
        
        <input type="hidden" id="Dep_ID_d" name="depaydizulfu" value="">
            
            <input type="hidden" id="Gor_ID_d" name="Gorevaydizulfu" value="">
                    
</form>

                         
                        
  
                     </div>

  </div>
         
      
            <div class="panel panel-default" style="width:600px;height:350px;margin-top:3.5%;float:left;margin-left:30px">
                
                <div class="panel-body" style="height:100%">
                         
                    <table id="example" class="row-border" cellspacing="0" width="100%" height="20px">
                
    
            </table>      
              
                    
                </div>
                
            </div>
                            

      
               


         
                         
   
            </div>
            
         
            
             
            
            
            

     
                       
                
                         
                 
                
                
                
          
                
                
                
           
            
     
            
            
            
            
        
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import/alt.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
          
            
   
                                                                                
 


        

        
        
     
        
      
               <script>
                   
                   
 
                   
                   
                 
                   
                   
            


<% rsr1 = stmt.executeQuery(SQL11);    %>
                   
             
             
            var bizimkiler = [
               
    
                <%  while(rsr1.next()){ %>
                
                ["<%= rsr1.getInt("ID")%>","<%= rsr1.getString("Ad")%>","<%= rsr1.getString("Durum")%>","<%= rsr1.getString("SirketDepartman")%>","<%= rsr1.getString("bny")%>"],
                                              
    <% } %>
    


];
 
$(document).ready(function() {
    
      
                
    
    
    $('#example').DataTable( {
                                       
        data: bizimkiler,
        
        columns: [
            
            { title: "ID" },
            { title: "Görev Adı" }, 
            { title: "Durum" }, 
            { title: "Departman Şirket Bilgisi" },
                        
        ],
         
        scrollY:        "255px",
        scrollX:        "true",
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
        
     
       
   $('#Departman option[value='+data[4]+']').prop('selected',true);

     
      var bunyak=$('#departman option:selected').val();
      
      $('#Dep_ID_d').val(bunyak);
     
          //////////pic
        aktifeal();
      //  alert(data[0]);
     
     
      yonlendirmeguncelle();

        if (data[2]==="Aktif") {
    $('#Aktif').prop('checked',true) ;    
}

else if (data[2]==="Pasif") {
    
     $('#Pasif').prop('checked',true)
    
}


 //$('#Dep_ID_d').val(data[0]);


             
    $('#GorevAdiii').val(data[1]);
    

        $('#Gor_ID_d').val(data[0]);
        
        
        $('#Dep_ID_d').val(data[4]);
          $('#kaydet_gorev').text("GÜNCELLE");
    } );
    
    
    
    
    
    
    
    
     $('#kaydet_gorev').attr('disabled',true);
    
                                           
} );






  $('#Departman').on('click', 'option', function () {
         
        
         
         var Dep_ID_combo_select=$('#Departman').find('option:selected').val();   
                 
         $('#Dep_ID_d').val(Dep_ID_combo_select);
         
        var ddd =$('#Dep_ID_d').val();
         
      //  alert(ddd);
        
      var der =$('#GorevAdiii').val().length;
      if (der>2) {
     aktifeal();   
}


             
    } );




function btnkaydet()
{  $('#kaydet_gorev').text("KAYDET");}

          function  pasifeal()
    {
      $('#kaydet_gorev').attr('disabled',true);  
      $('#form3').attr('action',"GorevInsert");
    }       
    
        function  aktifeal()
    {
      $('#kaydet_gorev').attr('disabled',false);  
    }     

function yonlendirmeguncelle()
{
     $('#form3').attr('action',"GorevUpdate");
}


function yonlendirmekaydet()
{
     $('#form3').attr('action',"GorevInsert");
}


       function icazetovaltin(adef)  
{          
  var letters = /^[a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\.\\,-]+$/;  



// var letters =/[a-zA-Z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split('  ').join(' '); 
  adef.value=adef.value.split('..').join('.'); 
  adef.value=adef.value.split(',,').join(','); 
  adef.value=adef.value.split('--').join('-'); 
  
  var ttt=$('#GorevAdiii').val().length;
  
if ($('#Departman').find('option:selected').val()>0 && ttt>2) {
      $('#kaydet_gorev').attr('disabled',false);  
}

else {
     $('#kaydet_gorev').attr('disabled',true);  
            
}

if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);


adef.focus();  
}  


      
}  


        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      
