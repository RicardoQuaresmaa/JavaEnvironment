<%@page import="java.sql.*"%>
<%@page isErrorPage="true" %>  
<%@page import="Connection.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        
        .Urunnn_adiii{
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
    <link href="CalisanDisKaynak/bootstrap.min.css" rel="stylesheet" type="text/css"/>




     
    
            
        <style>
            
            * { box-sizing:border-box; }

body {
	font-family: Helvetica;
	background: #eee;
  -webkit-font-smoothing: antialiased;
}

hgroup { 
	text-align:center;
	margin-top: 4em;
}

h1, h3 { font-weight: 300; }

h1 { color: #636363; }

h3 { color: #4a89dc; }

form {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
}

.group { 
	position: relative; 
	margin-bottom: 45px; 
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	-webkit-appearance: none;
	display: block;
	background: #fafafa;
	color: #636363;
	width: 100%;
	border: none;
	border-radius: 0;
	border-bottom: 1px solid #757575;
}

input:focus { outline: none; }


/* Label */

label {
	color: #999; 
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	-webkit-transition:all 0.2s ease;
	transition: all 0.2s ease;
}


/* active */

input:focus ~ label, input.used ~ label {
	top: -20px;
  -webkit-transform: scale(.75);
          transform: scale(.75); left: -2px;
	/* font-size: 14px; */
	color: #4a89dc;
}


/* Underline */

.bar {
	position: relative;
	display: block;
	width: 100%;
}

.bar:before, .bar:after {
	content: '';
	height: 2px; 
	width: 0;
	bottom: 1px; 
	position: absolute;
	background: #4a89dc; 
	-webkit-transition:all 0.2s ease; 
	transition: all 0.2s ease;
}

.bar:before { left: 50%; }

.bar:after { right: 50%; }


/* active */

input:focus ~ .bar:before, input:focus ~ .bar:after { width: 50%; }


/* Highlight */

.highlight {
	position: absolute;
	height: 60%; 
	width: 100px; 
	top: 25%; 
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}


/* active */

input:focus ~ .highlight {
	-webkit-animation: inputHighlighter 0.3s ease;
	        animation: inputHighlighter 0.3s ease;
}


/* Animations */

@-webkit-keyframes inputHighlighter {
	from { background: #4a89dc; }
	to 	{ width: 0; background: transparent; }
}

@keyframes inputHighlighter {
	from { background: #4a89dc; }
	to 	{ width: 0; background: transparent; }
}


/* Button */

.button {
  position: relative;
  display: inline-block;
  padding: 12px 24px;
  margin: .3em 0 1em 0;
  width: 100%;
  vertical-align: middle;
  color: #fff;
  font-size: 16px;
  line-height: 20px;
  -webkit-font-smoothing: antialiased;
  text-align: center;
  letter-spacing: 1px;
  background: transparent;
  border: 0;
  border-bottom: 2px solid #3160B6;
  cursor: pointer;
  -webkit-transition:all 0.15s ease;
  transition: all 0.15s ease;
}
.button:focus { outline: 0; }


/* Button modifiers */

.buttonBlue {
  background: #4a89dc;
  text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
}

.buttonBlue:hover { background: #357bd8; }


/* Ripples container */

.ripples {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: transparent;
}


/* Ripples circle */

.ripplesCircle {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  opacity: 0;
  width: 0;
  height: 0;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.25);
}

.ripples.is-active .ripplesCircle {
  -webkit-animation: ripples .4s ease-in;
          animation: ripples .4s ease-in;
}


/* Ripples animation */

@-webkit-keyframes ripples {
  0% { opacity: 0; }

  25% { opacity: 1; }

  100% {
    width: 200%;
    padding-bottom: 200%;
    opacity: 0;
  }
}

@keyframes ripples {
  0% { opacity: 0; }

  25% { opacity: 1; }

  100% {
    width: 200%;
    padding-bottom: 200%;
    opacity: 0;
  }
}

footer { text-align: center; }

footer p {
	color: #888;
	font-size: 13px;
	letter-spacing: .4px;
}

footer a {
	color: #4a89dc;
	text-decoration: none;
	-webkit-transition:all .2s ease;
	transition: all .2s ease;
}

footer a:hover {
	color: #666;
	text-decoration: underline;
}

footer img {
	width: 80px;
	-webkit-transition:all .2s ease;
	transition: all .2s ease;
}

footer img:hover { opacity: .83; }

footer img:focus , footer a:focus { outline: none; }

            
        </style>

    
    

</head>
    
<body>         
    
 <% session.invalidate(); %>
                   
  
    
        <div class="container-fluid" id="wrapper" style="height:100%;width:100%;background-color:#540909">
            
   <div class="row" style="height:15%;">
       
    <div  style="height:60%">
                    
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
  
        <a class="navbar-brand" href="Login.jsp" style="align-content:center;">Problem Tracking System Login Page</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    
      <ul class="nav navbar-nav navbar-right">
     
        
      </ul>
    </div>
  </div>
</nav>
    
    
</div>
          
        </div>      
  <div class="row" style="height:75%">
      
      
    <form role="form" id="form3" name="NewForm11" action="LoginControl" runat="server" method="post" enctype="multipart/form-data" style="margin:0 auto;" >
    
          
          <img style="height:150px;width:350px;margin-top:-40px;margin-left:-15px;" src="img/broadage-oley-com.png"> 
  <div class="group">
      <input type="text" id="KullaniciAdi" name="KullaniciAdi_name" value="" onkeyup="icazetovaltin(this);"><span class="highlight"></span><span class="bar"></span>
    <label>Kullanıcı Adı</label>
  </div>
  <div class="group">
      <input type="password" id="Parola" name="Parola_name" value="" onkeyup="icazetovaltin(this);"><span class="highlight"></span><span class="bar"></span>
    <label>Şifre</label>
  </div>
              <button type="submit" class="button buttonBlue">SİSTEME GİRİŞ YAP
    <!---- <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>   --->
  </button>
</form>
        
    </div>
   
    <div class="row" style="height:10%">
        
      
              
               <c:import url="import2/alt2.jsp"></c:import>     
              
          </div>
    
  </div>
            
          
           
            
         
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    
    <script>
            
            
            $(window, document, undefined).ready(function() {
                
                $('#KullaniciAdi').val("");
                $('#Parola').val("");

  $('input').blur(function() {
    var $this = $(this);
    if ($this.val())
      $this.addClass('used');
    else
      $this.removeClass('used');
  });

  var $ripples = $('.ripples');

  $ripples.on('click.Ripples', function(e) {

    var $this = $(this);
    var $offset = $this.parent().offset();
    var $circle = $this.find('.ripplesCircle');

    var x = e.pageX - $offset.left;
    var y = e.pageY - $offset.top;

    $circle.css({
      top: y + 'px',
      left: x + 'px'
    });

    $this.addClass('is-active');

  });

  $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
  	$(this).removeClass('is-active');
  });

});


                   function icazetovaltin(adef)  
{          
  var letters = /^[a-zA-Z \\Ü\\Ğ\\İ\\Ş\\Ç\\Ö\\ü\\ğ\\i\\ş\\ç\\ö\\ı\\]+$/;  

//var letters =/[^a-z0-9\\,\\.\\;]/g;

  adef.value=adef.value.split(' ').join(''); 
adef.value=adef.value.toLowerCase();
if(!adef.value.match(letters))  
{  

adef.value = adef.value.substring(0,adef.value.length-1);



}  


      
}  


        
            
    </script>

    

   
  

</body>
</html>
      
      
        
      
      
