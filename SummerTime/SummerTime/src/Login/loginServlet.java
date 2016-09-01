package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.DbUtil;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String type=request.getParameter("type");
		Connection conn=DbUtil.getConnection();
			String username = request.getParameter("username");
			try{
				PreparedStatement stmt=conn.prepareStatement("select password from StudentInfo where username=?");				
				stmt.setString(1,username);
				ResultSet rs= stmt.executeQuery();
			while(rs.next()){
			String password = request.getParameter("password");
			if (password.equals( rs.getString("password"))) {
				//login successfully
				HttpSession hs = request.getSession();
				hs.setAttribute("user", username);
				hs.setAttribute("pass", password);
				hs.setAttribute("type", type);
				hs.setAttribute("logined", true);
				//杞悜鐧诲綍鍚庣殑绗竴涓〉闈�
				response.sendRedirect("Other/single.jsp");
			}
			else {
				
				response.sendRedirect("login.html");
				
				}}
			stmt.close();
			
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
				
			}
			
			
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
