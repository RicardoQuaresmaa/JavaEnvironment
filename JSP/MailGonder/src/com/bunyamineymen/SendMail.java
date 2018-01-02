package com.bunyamineymen;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.MatrixParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.PathSegment;
import javax.ws.rs.core.Response;

@Path("/mail")
public class SendMail 
{
	@POST
	@Path("/gonder")
	public void SendMail
	(									
					@FormParam("contact_name") String contact_name,
					@FormParam("email") String email,
					@FormParam("url") String subject,		
					@FormParam("msg") String msg
	)
	
	{
		
		try {
		final String username = "problemmtrackingsystem@gmail.com";
		final String password = "oley.com_371";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");    
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("problemmtrackingsystem@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("bunyamin.alagoz@broadage.com"));
			message.setSubject(subject);
			message.setContent("<h1>"+email+msg+contact_name+"</h1>","text/html;charset=utf-8");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	
	}
								
}



 