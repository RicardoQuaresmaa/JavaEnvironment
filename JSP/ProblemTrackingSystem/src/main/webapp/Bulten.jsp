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
  width:1160px;
  height:170px;  
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
                                    
                                           String AdSoyad="";
                                           String bytes="";
                                            if (request.getSession().getAttribute("ID_")==null) {
                                                       response.sendRedirect("Login.jsp");
                                                }
                                            
                                          else  if (request.getSession().getAttribute("adsoyad")!=null) {
                                                    AdSoyad=request.getSession().getAttribute("adsoyad").toString();
                                                    bytes=request.getSession().getAttribute("bytee").toString();
                                                }
                                                    
 
                                            
                                            /*
bnymn=request.getSession().getAttribute("ID_").toString();
int sayi=Integer.parseInt(bnymn);
if (sayi<1) {
    response.sendRedirect("Login.jsp");
        
    }
*/

                                            
 Connection con;                      
                                            
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

   String db_bny=ConnectionDB.dbbb();
    con = DriverManager.getConnection(db_bny);  
                   Statement stmt = null;                                                                             
              
                  ResultSet rsr18799 = null;                    
                                                                                                    
       String SQL007 = "select * from AcikCase order by Case_ID desc";
       
              stmt = con.createStatement();                               
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909;">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import4/ust4.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:85%;">
      
      
      
      
      <form role="form" action="BultenDetay.jsp"  runat="server" method="get" enctype="multipart/form-data" id="formiste" name="NewForm116"   class ="form-horizontal"  style="">
        
                          <input type="hidden" id="Sayfa" name="ProblemID" value="bny"> 
      </form>
      
    
            
            <div class="panel panel-default" onmouseover="butonkontrol();" style="width:1300px;height:570px;margin:0 auto;position: relative;margin-top:-20px;">
                                                           
                    <div class="panel-body" style="height:100%;width:100%;">
                
                            
                  
    
                     
                                                        
                                <table id="example1" class="row-border" cellspacing="0" width="100%" height="90%" >
                
    
            </table>  
                        
                       <div class="row" style="height:270px;">
                            
                             <div class="row" style="height:100%;">
                                 <label id="etki_label"  >Problemin Etkisi :</label>                      
                                 <p id="Problemetki" style="width:1120px;height:30px;font-size:15px;margin-top:-32px;margin-left:226px;"></p>  <br> 
                                  <label id="pro_label">Problem ve Açıklama :</label>
                                <p id="Problemmm" style="width:1200px;height:110px;font-size:15px;float:left;margin-left:50px;"></p>  
                                
                            </div>
                                                                                                                                                                                                                                                                                                                                                                               
                        </div>
        
                                                                                                                                                                                                                                              
                     </div>

  </div>
            
      
       
      
      
      
      
      
   
     
      
  
      
         
      
           
                            
 
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

                                                                                                                         
         








  var bizimkiler45 = [
               
    
                <%  rsr18799 = stmt.executeQuery(SQL007);   
                    while(rsr18799.next()){ 
      
                

             
                 
                %>
                
                ["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= rsr18799.getInt("Case_ID")%>","<%= rsr18799.getString("Sayfa")%>","<%= rsr18799.getString("CaseBaslangic")%>","&nbsp;&nbsp;&nbsp;&nbsp;<%= rsr18799.getString("AyniproblemSayi")%>","<%= rsr18799.getString("AyniProblemLast")%>","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= rsr18799.getString("kuponEtkisi")%>","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= rsr18799.getString("mutabakatEtkisi")%>","<%= rsr18799.getString("CaseAcan")%>","<%= rsr18799.getString("ProblemAdi")%>",".<%= rsr18799.getString("ProblemAciklama")%>","<%= rsr18799.getString("etki")%>"],
                                              
    <% } %>    
];




 
$(document).ready(function() {
    
      $('#adsoyadli').text("<%=AdSoyad%>");
  displayImage("<%=bytes%>");
    
    $('#pro_label').attr('style',"display:none;");  
   
    $('#etki_label').attr('style',"display:none;");  
    

$('#btnKaydettt').attr('disabled',true);  

$('#btnSil').attr('disabled',true);  
    
 
                                   
      $('#example1').DataTable( {
                                       
        data: bizimkiler45,
        
        columns: [
            
            { title: "Arıza ID" },                                                  
            { title: "Sayfa" } ,                                                          
             { title: "Başlama" }, 
             { title: "Toplam Görülme" },
             { title: "Son Görülme" },
             { title: "Kupon Etkisi" },
             { title: "Mutabakat Etkisi" },
             { title: "Case Açan" } 
            
                                                    
                 
        ],
          lengthMenu: [[4,-1], ["Some", "All"]],
        scrollY:"150px",
        scrollX:"500px",
        scrollCollapse:true,
        ordering:false,
        paging:true,
      bFilter:true,
      bInfo:false,
      bPaginate:true,
      hover:false,
      bline:false
                                                                                           
    } );
                                                
    $("tr").css('cursor', 'pointer');          
    
     var table = $('#example1').DataTable();
     
    $('#example1 tbody').on('click', 'tr', function () {
        
        /*
        var data = table.row( this ).data();        
        displayImage(data[4]);        
        $('#problemid_kamyon').val(data[0]);        
        kaydetpasifkontrol();        
        aciklamabosalt();        
      */        
     //   $('#piste').text(data[0]+' '+data[1]); pişti   
     
         $('#pro_label').attr('style',"display;margin-left:50px;");  
 
    $('#etki_label').attr('style',"margin-left:50px;");  
     
       var data = table.row( this ).data();        
     
     $('#Problemetki').text(data[10]);
     
     $('#Problemmm').text(data[8]+" "+data[9]);
     
     
     
    });
    
    
    
    
    
     $('#example1 tbody').on('dblclick', 'tr', function () {
       
       
        var data = table.row( this ).data();       
    
    var dizi=data[0].split(" ");
    
    var len=dizi.length;
    
    var sayi=dizi[len-1];
  
  
   $('#Sayfa').val(sayi);

  $('#formiste').submit();
    

    
    });
                                    
});
function displayImage(byte)

{                       
    
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}

        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      

    























