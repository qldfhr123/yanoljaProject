package com.care.yanolja.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	@Bean
	public JavaMailSender mailSender() {
		JavaMailSenderImpl jms = new JavaMailSenderImpl();
		jms.setHost("smtp.gmail.com");  // 자바프로그램이 이메일 서버로 보낸 후 사용자에게 다시 요청 = 서버를 거쳐감(로그남음)
		jms.setPort(587);
		jms.setUsername("kgy1270@gmail.com");  // 인증번호를 클라이언트에게 보낼 이메일 주소
		jms.setPassword("xvpmjhurhtbrwypa");  // 앱 비밀번호
		
		Properties pro = new Properties();
		pro.setProperty("mail.transport.protocol", "smtp");
		pro.setProperty("mail.smtp.auth", "true");
		pro.setProperty("mail.smtp.starttls.enable", "true");  // SSL/TLS
		jms.setJavaMailProperties(pro);
		return jms; 
	}
}
