<%-- 
    Document   : ServerSide
    Created on : Jun 11, 2016, 7:37:38 PM
    Author     : bunyamineymen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.12.3.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/fixedcolumns/3.2.2/js/dataTables.fixedColumns.min.js" type="text/javascript"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/fixedcolumns/3.2.2/css/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>
        
        <style>
            
              th, td { white-space: nowrap; }
    div.dataTables_wrapper {
        width: 600px;
        margin: 0 auto;
    }
 
    /* Lots of padding for the cells as SSP has limited data in the demo */
    th,
    td {
        padding-left: 40px !important;
        padding-right: 40px !important;
    }
            
        </style>
    </head>
    <body>
        <table id="example" class="stripe row-border order-column" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>
        
         <script>
        
        $(document).ready(function() {
    var table = $('#example').DataTable( {
        scrollY:        "300px",
        scrollX:        true,
        scrollCollapse: true,
        ajax:           "json.json",
        serverSide:     true,
        fixedColumns:   true
    } );
} );
        
    </script>
    </body>
    
   
    
</html>
