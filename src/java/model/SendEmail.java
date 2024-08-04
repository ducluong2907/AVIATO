/*
package testmail;
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author HP
 */
public class SendEmail {

    public String sendEmail(String email) throws MessagingException {
        Properties pr = new Properties();
        System.out.println("Preparing to send main");
        pr.setProperty("mail.smtp.host", "smtp.gmail.com");
        pr.setProperty("mail.smtp.port", "587");
        pr.setProperty("mail.smtp.auth", "true");
        pr.setProperty("mail.smtp.starttls.enable", "true");
        String myaccount = "kiennhhe163054@fpt.edu.vn";
        String password = "qgpqvpnobfsjfhre";
        Session session = Session.getInstance(pr, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myaccount, password);
            }
        });
        String otp = new DecimalFormat("000000").format(new Random().nextInt(999999));
        Message mess = prepareMessage(session, myaccount, email, otp);
        Transport.send(mess);
        return otp;
    }

    private static Message prepareMessage(Session session, String account, String infor, String otp) {
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(account));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(infor));
            message.setSubject("Reset Email");
            message.setText("New password is : " + otp);
            return message;
        } catch (MessagingException ex) {
            Logger.getLogger(SendEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
