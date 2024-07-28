package com.bankapp.service;

import javax.mail.*;
import javax.mail.internet.*;

import java.math.BigDecimal;
import java.util.Properties;


public class EmailNotificationService implements NotificationService {
    private final String senderEmail = "durgachandramoulik@gmail.com"; // Replace with your email
    private final String senderPassword = "ocbp udjw ialc uztc"; // Replace with your email password

    @Override
    public void sendAccountDetails(String email, String mobileNo, String accountNo, String tempPassword) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Replace with your SMTP server
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Your New Bank Account Details");
            message.setText("Dear Customer,\n\n"
                    + "Your new bank account has been created successfully.\n"
                    + "Account Number: " + accountNo + "\n"
                    + "Temporary Password: " + tempPassword + "\n\n"
                    + "Please change your password upon first login.\n\n"
                    + "Best regards,\nYour Bank");

            Transport.send(message);

            System.out.println("Email sent successfully to " + email);
            System.out.println("password " + tempPassword);
            System.out.println("accountno  " + accountNo);
            
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public void sendDepositNotification(String email, String accountNo, BigDecimal amount, BigDecimal newBalance) {
        sendTransactionNotification(email, accountNo, "Deposit", amount, newBalance);
    }

    @Override
    public void sendWithdrawalNotification(String email, String accountNo, BigDecimal amount, BigDecimal newBalance) {
        sendTransactionNotification(email, accountNo, "Withdrawal", amount, newBalance);
    }

    private void sendTransactionNotification(String email, String accountNo, String transactionType, BigDecimal amount, BigDecimal newBalance) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(senderEmail, senderPassword);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(transactionType + " Notification");
            message.setText("Dear Customer,\n\n"
                    + "A " + transactionType.toLowerCase() + " transaction has been processed on your account.\n"
                    + "Account Number: " + accountNo + "\n"
                    + "Amount: $" + amount + "\n"
                    + "New Balance: $" + newBalance + "\n\n"
                    + "If you did not authorize this transaction, please contact us immediately.\n\n"
                    + "Best regards,\nYour Bank");

            Transport.send(message);

            System.out.println(transactionType + " notification email sent successfully to " + email);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public void sendAccountClosureNotification(String email, String accountNo) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(senderEmail, senderPassword);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Account Closure Notification");
            message.setText("Dear Customer,\n\n"
                    + "Your account with number " + accountNo + " has been closed as per your request.\n"
                    + "If you did not request this action or have any questions, please contact our customer support immediately.\n\n"
                    + "Thank you for banking with us.\n\n"
                    + "Best regards,\nYour Bank");

            Transport.send(message);

            System.out.println("Account closure notification email sent successfully to " + email);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
   
}