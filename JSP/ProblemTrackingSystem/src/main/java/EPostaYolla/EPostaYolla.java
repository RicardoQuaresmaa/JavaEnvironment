package EPostaYolla;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EPostaYolla 
{
    String[] GonderilecekMailAdres;
    
     public static void MailGonderMotedu(String[] GonderilecekMailAdres,String Baslik , String Icerik )
     {
        try {
    String from = "problemmtrackingsystem@gmail.com";
   String pass = "oley.com_371";
   String[] to =  GonderilecekMailAdres ;
   String host = "smtp.gmail.com";
   Properties props = System.getProperties();
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.smtp.host", host);
   props.put("mail.smtp.user", from);
   props.put("mail.smtp.password", pass);
   props.put("mail.smtp.port", "587");
   props.put("mail.smtp.auth", "true");
   Session session = Session.getDefaultInstance(props, null);
   MimeMessage message = new MimeMessage(session);
   message.setFrom(new InternetAddress(from));
   InternetAddress[] toAddress = new InternetAddress[to.length];
   for (int i = 0; i < to.length; i++) {
    toAddress[i] = new InternetAddress(to[i]);
   }
   for (int i = 0; i < toAddress.length; i++) {
    message.addRecipient(Message.RecipientType.TO, toAddress[i]);
   }
   message.setSubject(Baslik);
   message.setText(Icerik);
   Transport transport = session.getTransport("smtp");
   transport.connect(host, from, pass);
   transport.sendMessage(message, message.getAllRecipients());
   transport.close();
  } catch (Exception e) {
   e.printStackTrace();
  }
}
     
     
     
       public static void main(String[] args) {
           String[] bny={"eymen_15@hotmail.com","bunyamin.alagoz@broadage.com"};
     MailGonderMotedu(bny,"BNYMN","BNY");
    }
     
     
     
  
    
}
