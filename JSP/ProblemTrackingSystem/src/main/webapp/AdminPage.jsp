
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
       
         <div  style="height:60%">
                    
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
  
      <a class="navbar-brand" href="AdminPage.jsp">ADMİN HOME PAGE</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
                                                  
      	                                 
                                <li><a href="AdminBulten.jsp" accesskey="2" title="">BÜLTEN</a></li>     
                                <li><a href="Sirket.jsp" accesskey="2" title="">KAYIT PANELİ-1</a></li>                               
				<li><a href="Mail.jsp" accesskey="2" title="">KAYIT PANELİ-2</a></li>                              
				<li><a href="Oleyservis.jsp" accesskey="3" title="">oley.com Kayıt Paneli</a></li>                                                               
                                                                                                                    
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Login.jsp"><span class="glyphicon glyphicon-user"></span> Sign Out</a></li>
        
      </ul>
    </div>
  </div>
</nav>
    
    
</div>
          
        </div>      
            
            <div class="row" style="height:75%">
                
                <div class="row" style="height:30%;">
                    
                    <p style="font-size:50px;margin-left:30%;color:black;">ADMİN PANELİ PLANI</p>
                    
                </div>
                
                <div class="row" style="height:20%;">
                    
                    <img src="img/panel1.PNG" style="margin-left:5%;" alt=""/>
                    
                </div>
                
                <div class="row" style="height:20%;" >
                    
                    <img src="img/panel2.PNG" alt="" style="margin-left:5%;"/>
                    
                </div>
                
                <div class="row" style="height:20%;">
                    
                    <img src="img/oley_panel.PNG" alt="" style="margin-left:5%;" />
                    
                </div>
                
                
            </div>
            
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import/alt.jsp"></c:import>     
              
          </div>
    
  </div>
            
        
            
   
              

        
     

      
               
               
        
 
  

</body>
</html>
      
      
        
      
      
