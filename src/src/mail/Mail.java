package mail;

import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	private String sendTo;
	private String message;
	private String title;



	public Mail() {
		super();
	}



	public String getSendTo() {
		return sendTo;
	}



	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public boolean sendMail() {
		try{
            Properties property = new Properties();

            property.put("mail.smtp.host","smtp.gmail.com");

            //GmailのSMTPを使う場合
            property.put("mail.smtp.auth", "true");
            property.put("mail.smtp.starttls.enable", "true");
            property.put("mail.smtp.host", "smtp.gmail.com");
            property.put("mail.smtp.port", "587");
            property.put("mail.smtp.debug", "true");

            Session session = Session.getInstance(property, new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication("alachige@gmail.com", "aiki1998");
                }
            });

            /*
            //一般的なSMTPを使う場合

            //ポートが25の場合は省略可能
            property.put("mail.smtp.port", 25);

            Session session =
                    Session.getDefaultInstance(property, null);
            */

            MimeMessage mimeMessage = new MimeMessage(session);

            InternetAddress toAddress =
                    new InternetAddress(this.sendTo, "NameCardUser");

            mimeMessage.setRecipient(Message.RecipientType.TO, toAddress);

            InternetAddress fromAddress =
                    new InternetAddress("alachige@gmail.com","NameCard.no-reply");

            mimeMessage.setFrom(fromAddress);

            mimeMessage.setSubject(this.title, "ISO-2022-JP");

            mimeMessage.setText(message, "ISO-2022-JP");

            Transport.send(mimeMessage);

            return true;
        }
        catch(Exception e){
        	System.out.println(e);
            return false;
        }
    }
}
