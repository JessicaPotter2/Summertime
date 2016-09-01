
import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.security.PublicKey;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.sun.mail.util.MailSSLSocketFactory;

import summer.java.DbUtil;

/**
 * Servlet implementation class SendMailSSL
 */
@WebServlet("/SendQQMailSSL")
public class SendQQMailSSL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendQQMailSSL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Pwds="";
		
		Connection conn = DbUtil.getConnection();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String mail = request.getParameter("email");		
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = stmt
					.executeQuery("select password from StudentInfo where email='" + mail
							+ "'");
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		
		try {
			if (rs.next()) {
				 Pwds = rs.getString("password");		
				request.setAttribute("Pwds", Pwds);
	
				System.out.print(Pwds);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	  
		final String Name = "1569504523@qq.com";//
		final String Pwd = "lu19950220";//
	  
		  
		  
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.ssl.enable", "true");
		props.setProperty("mail.smtp.host", "smtp.qq.com");
		props.put("mail.smtp.ssl.socketFactory",
				"javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.port", "465");
		
		Session session = Session.getDefaultInstance(props,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(Name, Pwd);
					}
				});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Name));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mail));
			
			
			message.setSubject("您好!这是一封自动邮件");
			message.setText("您的密码"+Pwds);
            Transport.send(message);
			System.out.println("Done");
			pw.print("<script language='javascript'>alert('邮件发送成功，请注意查收！');window.location.href='login.html';</script>");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
			
		}
			//response.sendRedirect("SendQQMailSSL");
			
	}
	
}
