<%--
Document   : Sendemail
Created on : 12 Apr, 2023, 6:13:19 PM
Author     : Aatifulla Baig
--%>

<%@page import="java.security.Security"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>JSP Page</title>
     </head>
     <body>
         <%@ page import="javax.mail.*, javax.mail.internet.*, java.util.*" %>

<%
   // Sender's email ID needs to be mentioned
   final String from = "aub26pvt@gmail.com";

   // Recipient's email ID needs to be mentioned
   String to = request.getParameter("emailInput");

   // Sender's email password needs to be mentioned
   final String password = "Aatif@1234";

   // SMTP server information
   String host = "smtp.gmail.com";
   int port = 587;

   // Get system properties
   Properties props = System.getProperties();

   // Setup mail server
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.smtp.host", host);
   props.put("mail.smtp.port", port);
   props.put("mail.smtp.auth", "true");
   props.put("mail.session.shared", "true");
   Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

   // Get the default Session object.
   Session userSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
       protected PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication(from, password);
       }
   });

   try {
       // Create a default MimeMessage object.
       MimeMessage message = new MimeMessage(userSession);

       // Set From: header field of the header.
       message.setFrom(new InternetAddress(from));

       // Set To: header field of the header.
       message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

       // Set Subject: header field
       message.setSubject("Notification email");

       // Now set the actual message
       message.setText("This is a notification email.");

       // Send message
       Transport.send(message);

       // Display message sent confirmation
       out.println("Notification email sent successfully.");
   } catch (MessagingException mex) {
       mex.printStackTrace();
   }
%>

     </body>
</html>
