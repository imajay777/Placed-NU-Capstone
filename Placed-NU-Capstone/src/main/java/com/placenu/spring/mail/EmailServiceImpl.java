package com.placenu.spring.mail;

import java.io.File;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
@Component
public class EmailServiceImpl implements EmailService{
	 @Autowired
	 
	    public JavaMailSender emailSender;
        
	    public void sendSimpleMessage(String to, String subject, String text) {
	        try {
	            SimpleMailMessage message = new SimpleMailMessage();
	            message.setTo(to);
	            message.setSubject(subject);
	            message.setText(text);

	            emailSender.send(message);
	        } catch (MailException exception) {
	            exception.printStackTrace();
	        }
	    }

	    @Override
	    public void sendSimpleMessageUsingTemplate(String to,
	                                               String subject,
	                                               SimpleMailMessage template,
	                                               String ...templateArgs) {
	        String text = String.format(template.getText(), templateArgs);  
	        sendSimpleMessage(to, subject, text);
	    }

	    @Override
	    public void sendMessageWithAttachment(String to,
	                                          String subject,
	                                          String text,
	                                          String pathToAttachment) {
	        try {
	            MimeMessage message = emailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);

	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(text);

	            FileSystemResource file = new FileSystemResource(new File(pathToAttachment));
	            helper.addAttachment("Invoice", file);

	            emailSender.send(message);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	    }
	}


