package mail;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;

import com.sun.mail.pop3.POP3Store;

public class SendEmail {

//************************************* Send Email ****************************************

    public static void SendEmail(String to, String from, String host, String username, String password , String v_Code) {
        //Get the session object
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.fallback", "false");


        Session session = Session.getDefaultInstance(properties);
        session.setDebug(true);

        //compose the message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Mail Send From App");
//            message.setContent("<a href='http://localhost:8080/login.html?v_code="+v_Code+">Click Ya Man </a> <br> <h1>sending html mail check</h1>", "text/html");
//            message.setText("Hello i am fadie, this is example of sending email  ");
message.setContent("<!DOCTYPE html>\n" +
        "<html lang=\"en\">\n" +
        "<head>\n" +
        "    <meta charset=\"UTF-8\">\n" +
        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
        "    <link rel=\"shortcut icon\" href=\"images/logo.jpg\">\n" +
        "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
        "    <title>Confirmimation</title>\n" +
        "    <style>\n" +
        "body{\n" +
        "    overflow: hidden\n" +
        "}\n" +
        "*{\n" +
        "  font-color: gray;\n" +
        "  font-family: Helvetica;\n" +
        "  font-weight: 100;\n" +
        "  box-sizing: border-box;\n" +
        "}\n" +
        "  #success-body {\n" +
        "    height: 96vh;\n" +
        "    background-color: #1976D2;\n" +
        "    padding-top: 10vh;\n" +
        "    text-align: center;\n" +
        "  }\n" +
        "    #success-box {\n" +
        "      max-width: 600px;\n" +
        "      height: 90%;\n" +
        "      display: block;\n" +
        "      margin: auto;\n" +
        "      width: 90vw;\n" +
        "      padding: 5px;\n" +
        "      background-color: white;\n" +
        "      border-radius: 5px;\n" +
        "      animation: fadein 800ms;\n" +
        "      animation: fly 800ms ease-out;\n" +
        "      animation-fill-mode: forwards;\n" +
        "     box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);\n" +
        "    }\n" +
        "      h1, h3 {\n" +
        "        display: block;\n" +
        "        margin: auto;\n" +
        "        width: 95%;\n" +
        "        margin-top: 20px;\n" +
        "        text-align: center;\n" +
        "      }\n" +
        "      h1 {\n" +
        "        color: black;\n" +
        "        font-weight: 300;\n" +
        "        font-size: 42px;\n" +
        "      }\n" +
        "      h3 {\n" +
        "        color: #78909C;\n" +
        "      }\n" +
        "      #check {\n" +
        "        font-size: 60px;\n" +
        "        margin: 30px auto;\n" +
        "        color: #66BB6A;\n" +
        "        animation: grow 900ms;\n" +
        "        animation-fill-mode: forwards;\n" +
        "\n" +
        "      }\n" +
        "      button {\n" +
        "          width: 59%;\n" +
        "          display: block;\n" +
        "          margin: 40px auto;\n" +
        "          background-color: dodgerblue;\n" +
        "          cursor: pointer;\n" +
        "          border: 1px solid darkblue;\n" +
        "          padding: 20px 30px;\n" +
        "          color: white;\n" +
        "          border-radius: 30px;\n" +
        "          font-weight: bold;}\n" +
        "\n" +
        "       button:hover {\n" +
        "          opacity: 0.9;\n" +
        "        }\n" +
        "        button:active {\n" +
        "          filter: brightness(0.9);\n" +
        "        }\n" +
        "     \n" +
        "#check {\n" +
        "      margin: 30px auto;\n" +
        "      animation: grow 1000ms;\n" +
        "      animation-fill-mode: forwards; \n" +
        "}\n" +
        "\n" +
        " @keyframes fly {\n" +
        "    0%{transform:   translateY(50vh);}\n" +
        "    30% {transform: translateY(-5vh);}\n" +
        "    60% {transform: translateY(3vh);}\n" +
        "    90% {transform: translateY(0vh);}\n" +
        "}\n" +
        "@keyframes grow {\n" +
        "  0% {transform:  scale(0);}\n" +
        "  30% {transform: scale(1);}\n" +
        "  60% {transform: scale(1.5);}\n" +
        "  90% {transform: scale(1);}\n" +
        "}\n" +
        "</style>\n" +
        "</head>\n" +
        "<body>\n" +
        "    <div id=\"success-body\">\n" +
        "\t<div id=\"success-box\">\n" +
        "    \t<h1>Message Received!</h1>\n" +
        "    \t<h3>We have successfully received your message and we'll be getting back to you shortly</h3>\n" +
        "    \t<!--<img id=\"check\" src=\"images/true.png\" width=\"100px\" height=\"100px\">-->\n" +
        "        <!--<a href='http://localhost:8080/login.html?v_code=\"+v_Code+\"' ></a>-->\n" +
        "        <form action=\"http://localhost:8080/login.html?v_code="+v_Code+" >\n" +
        "        <button>Back To Home</button>     \n" +
        "        </form></div></div>\n" +
        "</body>\n" +
        "</html>","text/html");
            // Send message
            Transport transport = session.getTransport("smtp");
            transport.connect(host, username, password);
            transport.sendMessage(message, message.getAllRecipients());
            System.out.println("message sent successfully....");

        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }


//    ************************** recieve Email *****************************

    public static void receiveEmail(String pop3Host, String storeType,
                                    String user, String password) {
        try {
            //1) get the session object
            Properties properties = new Properties();
            properties.put("mail.pop3.host", pop3Host);
            Session emailSession = Session.getDefaultInstance(properties);

            //2) create the POP3 store object and connect with the pop server
            POP3Store emailStore = (POP3Store) emailSession.getStore(storeType);
            emailStore.connect(user, password);

            //3) create the folder object and open it
            Folder emailFolder = emailStore.getFolder("INBOX");
            emailFolder.open(Folder.READ_ONLY);

            //4) retrieve the messages from the folder in an array and print it
            Message[] messages = emailFolder.getMessages();
            for (int i = 0; i < messages.length; i++) {
                Message message = messages[i];
                System.out.println("---------------------------------");
                System.out.println("Email Number " + (i + 1));
                System.out.println("Subject: " + message.getSubject());
                System.out.println("From: " + message.getFrom()[0]);
                System.out.println("Text: " + message.getContent().toString());
            }

            //5) close the store and folder objects
            emailFolder.close(false);
            emailStore.close();

        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
