package Login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClaRegServlet
 */
@WebServlet("/ClaRegServlet")
public class ClaRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClaRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out=response.getWriter();
	
		String PassWord=request.getParameter("PassWord");
		String Email=request.getParameter("Email");
		
		String ClassName=request.getParameter("ClassName");
		System.out.print(PassWord);
		ClaOperation u=new ClaOperation();
		int num=u.isExists(ClassName);
		if(num==0){
			int num1=u.addCla(ClassName,Email,PassWord);
			if(num1>0){
				out.print("<script type='text/javascript' language='javascript'>alert('success');location.href='Classlogin.html';</script>");
			}
			else{
				out.print("<script type='text/javascript' language='javascript'>alert('fail');history.go(-1);</script>");
			}
		}else
		{
			out.print("<script type='text/javascript' language='javascript'>alert('this loginName is exists!');history.go(-1);</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
