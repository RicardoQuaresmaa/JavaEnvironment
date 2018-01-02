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
        width:400px;  
        margin-top:30px;  
    }
     
    
     #example1_filter input
    {              
        width:170px;
       
    }
   
    
    
       #example1_length 
    {              
       
   display:none;
    }
    
   
   
    
      #example1_filter 
    {     
         width:600px;
       
    }
    
   

      
      
      
      #example1_wrapper
{
  width:1160px;
  height:260px;  
  margin-bottom:-180px;
  margin-top:-10px;
}
      
         

      
        #example1_filter label
    {     
       font-size:17px;            
          margin-top:-40px;
          font-weight: 100;
          width:400px;
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
     
  if(request.getSession().getAttribute("AdminMi")!=null)
     {
     
          if (request.getSession().getAttribute("AdminMi").toString()=="false" ) {
                                                       response.sendRedirect("Login.jsp");
                                                }
         
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
                  ResultSet rsr2 = null;    
                                                                                                    
       String SQL007 = "select * from KapaliCase1 order by Case_ID desc";
         String SQL008="select * from RaporProblemFiltre";
              stmt = con.createStatement();                               
%>
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909;">
            
   <div class="row" style="height:15%;">
       
            <c:import url="import6/ust6.jsp"></c:import>  
          
        </div>      
  <div class="row" style="height:75%;">
      
      
      
      
      <form role="form" action="BultenArsivDetayAdmin.jsp"  runat="server" method="get" enctype="multipart/form-data" id="formiste" name="NewForm116"   class ="form-horizontal"  style="">
        
                          <input type="hidden" id="Sayfa" name="ProblemID" value="bny"> 
      </form>
      
    
            
            <div class="panel panel-default" onmouseover="butonkontrol();" style="width:1300px;height:570px;margin:0 auto;position: relative;margin-top:-40px;">
                                                           
                    <div class="panel-body" style="height:100%;width:100%;">
                
                
                       
   
                                                        
                        <table id="example1" class="row-border" cellspacing="0" width="100%" height="90%" style="margin-top:0px;">
                
    
            </table>  
                        
                        <div class="row" style="width:100%;height:90px;">
                            
                            <div class="col-sm-1" style="height:100%;">
                                
                            </div>
                            
                            <div class="col-sm-3" style="height:100%;">
                                
                                <select id="bilgilers"  class="form-control"  name="sirketov" style="font-size:17px;width:85%;height:40px;margin-left:20%;margin-top:10px;">
    <option class="placeholder" selected disabled value="" selected="true" >Problem Detay Seçiniz</option>
  
     
        
      <option id="opt_pro" value="">Problem</option>
      <option id="opt_aci" value="">Açıklama</option>
      <option id="opt_ope" value="">Operasyon Açıklama</option>
      <option id="opt_srv" value="">Servis Açıklama</option>
  
        
        </select>
                                
                                
                                
                               
                                
                                
                            </div>
                            
                           <div class="col-sm-7" style="height:100%;">
                              
                               <div style="float:left;">
                                 <label id="label" style="font-size:15px;margin-top:10px;"></label>
                                 <p id="paragraf" style="width:750px;height:120px;font-size:13px;"></p>
                                </div>
                                
                            </div>
                            
                             <div class="col-sm-1" style="height:100%;">
                                
                            </div>
                                                                                                                                                           
                        </div>
                        
                                                            
                         
       
         
                                
                                                                                                                                                                                                                                              
                     </div>

  </div>
            

    </div>

  </div>
            
 
      
               <script>
                                                                                                                                                                                                                                                        
 
                                                                                                                         
         








  var bizimkiler45 = [
               
    
                <%  rsr18799 = stmt.executeQuery(SQL007);   
                    while(rsr18799.next()){ 
      
                

             
                 
                %>
                
                ["&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= rsr18799.getInt("Case_ID")%>","<%= rsr18799.getString("Sayfa")%>","&nbsp;&nbsp;<%= rsr18799.getString("Sure")%>","<%= rsr18799.getString("SonGorulme")%>","&nbsp;&nbsp;&nbsp;<%= rsr18799.getString("AyniTipProblemSayi")%>","<%= rsr18799.getString("CaseAcan")%>","&nbsp;<%= rsr18799.getString("OperasyonYapan")%>","<%= rsr18799.getString("CaseBaslangic")%>","<%= rsr18799.getString("CaseBitis")%>","<%= rsr18799.getString("ArizaSebep")%>","<%= rsr18799.getString("kuponEtkisi")%>","<%= rsr18799.getString("mutabakatEtkisi")%>","<%= rsr18799.getString("etki")%>","<%= rsr18799.getString("ProblemAdi")%>","<%= rsr18799.getString("ArizaServis")%> - <%= rsr18799.getString("ArizaServisAciklama")%> ","<%= rsr18799.getString("operasyonAciklama")%>","<%= rsr18799.getString("ProblemAciklama")%>","<%= rsr18799.getString("ProblemAdi")%>"],
                                              
    <% } %>    
];




 
$(document).ready(function() {
        $('#adsoyadli').text("<%=AdSoyad%>");
  displayImage("<%=bytes%>");
    
    var problem="";
    var Aciklama="";
    var Operasyon="";
    var ServisAciklama="";
   

$('#btnKaydettt').attr('disabled',true);  

$('#btnSil').attr('disabled',true);  
    
 
                                   
      $('#example1').DataTable( {
                                       
        data: bizimkiler45,
        
        columns: [
            
            { title: "Arıza ID" },                                                  
            { title: "Sayfa" } ,                                                          
            { title: "Süre" } ,                                                                       
             { title: "Son Görülme" },
             { title: "Sayı" },
             { title: "Case Açan" } ,
             { title: "Operasyon Yapan" },                                                                                         
             { title: "Case Başlangıç" },
             { title: "Case Bitiş" },
             { title: "Sebep" },
             { title: "Kupon Etkisi" },
             { title: "Mutabakat Etkisi" },
               { title: "Arıza Etkisi" },
               { title: "Problem Adı" }
        ],
          lengthMenu: [[4,-1], ["Some", "All"]],
        scrollY:"320px",
        scrollX:"500px",
        scrollCollapse:true,
        ordering:false,
        paging:false,
      bFilter:true,
      bInfo:false,
      bPaginate:false,
      hover:false,
      bline:false
                                                                                           
    });
                                                
    $("tr").css('cursor', 'pointer');          
    
     var table = $('#example1').DataTable();
     var tasiyici="";
    $('#example1 tbody').on('click', 'tr', function () {
        
        /*
        var data = table.row( this ).data();        
        displayImage(data[4]);        
        $('#problemid_kamyon').val(data[0]);        
        kaydetpasifkontrol();        
        aciklamabosalt();        
      */        
     //   $('#piste').text(data[0]+' '+data[1]); pişti       
     
       var data = table.row( this ).data();        

     problem=data[17];
     Aciklama=data[16];
     Operasyon=data[15];
     ServisAciklama=data[14];
     tasiyici=data[0].split(" ")[1];
       $('#label').text("Problem "+data[0].split(" ")[1]+":");
     $('#paragraf').text(problem);
     
    });
    
    
    
    
    
     $('#example1 tbody').on('dblclick', 'tr', function () {
       
       
        var data = table.row( this ).data();       
    
    var dizi=data[0].split(" ");
    
    var len=dizi.length;
    
    var sayi=dizi[len-1];
  
  
   $('#Sayfa').val(sayi);

  $('#formiste').submit();

    });
    
    
    
     
      $('#bilgilers').on('click', 'option', function () {
                
               
         var element = $(this);
         var idddf = element.attr("id");
      
            
            
            if (idddf==="opt_pro") 
            {
     $('#label').text("Problem "+tasiyici+":");
     $('#paragraf').text(problem);
}

            if (idddf==="opt_aci") 
            {
     $('#label').text("Açıklama :");
     $('#paragraf').text(Aciklama);
}

            if (idddf==="opt_ope") 
            {
     $('#label').text("Operasyon Açıklama :");
     $('#paragraf').text(Operasyon);
}

            if (idddf==="opt_srv") 
            {
     $('#label').text("Servis Açıklama :");
     $('#paragraf').text(ServisAciklama);
}

});
    
    
    
    
                                      
});

function displayImage(byte)

{                       
    
     $('#blah').attr('src', "data:image/png;base64," +byte);    
}

        </script>
               
               
        
   
  

</body>
</html>
      
      
        
      
      

    























