<%-- 
    Document   : index
    Created on : Jul 10, 2016, 9:21:59 PM
    Author     : bunyamineymen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            .editableBox {
    width: 75px;
    height: 30px;
}

.timeTextBox {
    width: 54px;
    margin-left:78px;
    height: 25px;
    border: none;
}
            
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <div>
    <select class="editableBox">        
        <option value="1">01:00</option>
        <option value="2">02:00</option>
        <option value="3">03:00</option>
        <option value="4">04:00</option>
        <option value="5">05:00</option>
        <option value="6">06:00</option>
        <option value="7">07:00</option>
        <option value="8">08:00</option>
        <option value="9">09:00</option>
        <option value="10">10:00</option>
        <option value="11">11:00</option>
        <option value="12">12:00</option>
        <option value="13">13:00</option>
        <option value="14">14:00</option>
        <option value="15">15:00</option>
        <option value="16">16:00</option>
        <option value="17">17:00</option>
        <option value="18">18:00</option>
        <option value="19">19:00</option>
        <option value="20">20:00</option>
        <option value="21">21:00</option>
        <option value="22">22:00</option>
        <option value="23">23:00</option>
        <option value="24">24:00</option>
    </select>
    <input class="timeTextBox" name="timebox" maxlength="5"/>
</div>
        
        
        <script>
            
            $(document).ready(function(){
   
    $(".editableBox").change(function(){         
        $(".timeTextBox").val($(".editableBox option:selected").html());
    });
});
            
        </script>
        
    </body>
</html>
