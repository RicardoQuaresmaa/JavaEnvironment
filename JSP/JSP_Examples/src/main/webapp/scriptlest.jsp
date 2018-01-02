<HTML>
<BODY>
<%
    System.out.println( "Evaluating date now" );
    java.util.Date date = new java.util.Date();
%>
Hello!  The time is now
<%
      out.println( String.valueOf( date ));
%>
</BODY>
</HTML>