package Bean;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WriteJsServlet
 */
@WebServlet("/WriteJsServlet")
public class WriteJsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteJsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("");
		 try {
			  String datajspath= request.getServletContext().getRealPath("/js/data.js");
			  Writer bw = new BufferedWriter( new OutputStreamWriter(new FileOutputStream(datajspath),"UTF-8"));
			  bw.append("var data = [];");
			  Connection conn=DbUtil.getConnection();
			  Statement stat=conn.createStatement();
			  ResultSet rs=stat.executeQuery("select * from myArtical order by logdate desc");
			  while(rs.next()){
				  	bw.write("\r\n\r\n");
				  	bw.write("data.push({\r\n");
				  	bw.write("\t'date':'"+rs.getString("logdate")+"',\r\n");
				  	bw.write("\t'intro':'"+rs.getString("intro")+"',\r\n");
				  	bw.write("\t'media':'<img src=\".."+rs.getString("media")+"\">',\r\n");
				  	bw.write("\t'loglike':'"+rs.getString("loglike")+"',\r\n");
				  	bw.write("\t'comment':'"+rs.getString("comment")+"',\r\n");
				  	bw.append("})");
			  }
	            bw.close();
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	}

}
