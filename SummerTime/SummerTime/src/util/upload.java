package util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;  
import java.io.BufferedOutputStream;  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Iterator;  
import java.util.List;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;   
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import org.apache.commons.fileupload.util.Streams;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


import summer.java.DbUtil;


/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���ý��յı����ʽ  
        request.setCharacterEncoding("UTF-8"); 
        response.setContentType("text/html;charset=UTF-8");
        Connection conn = DbUtil.getConnection();
        Statement st = null;
        Date date = new Date();//��ȡ��ǰʱ��  
        SimpleDateFormat sdfFileName = new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat sdfFolder = new SimpleDateFormat("yyMM");  
        String newfileName = sdfFileName.format(date);//�ļ�����  
        String fileRealPath = "";//�ļ������ʵ��ַ 
          
        String fileRealResistPath = "";//�ļ������ʵ���·�� 
        String fileRealResistPath2 = "";//�ļ������ʵ���·�� 
          
        //����  ������� ���� ��request ����һ��..��������  
        String name = request.getParameter("name"); 
        String state = request.getParameter("state");
        String username=(String)request.getSession().getAttribute("user");      
           
        String firstFileName="";  
        // ����������ϴ��ļ������ڵ�����·��  
        String savePath = this.getServletConfig().getServletContext().getRealPath("/") + "uploads\\";  
        System.out.println("·��" + savePath);  
        File file = new File(savePath);  
        if (!file.isDirectory()) {  
            file.mkdir();  
        }  
  
        try {  
            DiskFileItemFactory fac = new DiskFileItemFactory();  
            ServletFileUpload upload = new ServletFileUpload(fac);  
            upload.setHeaderEncoding("UTF-8");  
            // ��ȡ����ϴ��ļ�  
            List fileList = fileList = upload.parseRequest(request);  
            // �����ϴ��ļ�д�����  
            Iterator it = fileList.iterator();  
            while (it.hasNext()) {  
                FileItem item = (FileItem) it.next();  
                  
                // ���item���ļ��ϴ�����     
                // ����ļ�����·��     
                String fileName = item.getName();  
                if (fileName != null) {  
                    firstFileName=item.getName().substring(item.getName().lastIndexOf("\\")+1);  
                    String formatName = firstFileName.substring(firstFileName.lastIndexOf("."));//��ȡ�ļ���׺��  
                    fileRealPath = savePath + newfileName+ formatName;//�ļ������ʵ��ַ  
                      
                    BufferedInputStream in = new BufferedInputStream(item.getInputStream());// ����ļ�������  
                    BufferedOutputStream outStream = new BufferedOutputStream(new FileOutputStream(new File(fileRealPath)));// ����ļ������  
                    Streams.copy(in, outStream, true);// ��ʼ���ļ�д����ָ�����ϴ��ļ���  
                    //�ϴ��ɹ�����������ݿ�  
                    if (new File(fileRealPath).exists()) {  
                        //����·����ֵ  
                        fileRealResistPath=fileRealPath.substring(fileRealPath.lastIndexOf("\\")+1);  
                        //���浽���ݿ� 
                        java.io.File file2 = new java.io.File(fileRealPath);
                        String newurl = this.getServletConfig().getServletContext().getRealPath("/") + "newUploads\\"+ newfileName+ formatName;
                        Image src = javax.imageio.ImageIO.read(file2); //����Image����
                        float tagsize=600;
                        int old_w=src.getWidth(null); //�õ�Դͼ��
                        int old_h=src.getHeight(null);
                        int new_w=0;
                        int new_h=0; //�õ�Դͼ��
                        int tempsize;
                        float tempdouble;
                        if(old_w>old_h){
                        tempdouble=old_w/tagsize;
                        }else{
                        tempdouble=old_h/tagsize;
                        }
                        new_w=Math.round(old_w/tempdouble);
                        new_h=Math.round(old_h/tempdouble);//������ͼ����
                        BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
                        tag.getGraphics().drawImage(src,0,0,new_w,new_h,null); //������С���ͼ
                        FileOutputStream newimage=new FileOutputStream(newurl); //������ļ���
                        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
                        encoder.encode(tag); //��JPEG����
                        newimage.close();
                        fileRealResistPath2=newurl.substring(newurl.lastIndexOf("\\")+1);  
                        String PicName=newfileName;
                        String Path=fileRealResistPath;
                        String Path2=fileRealResistPath2;
                        String sql="insert into PictureInfo(username,PicName,Path,Thumbnail,Pname,State) values('"+username+"','"+PicName+"','"+Path+"','"+Path2+"','"+name+"','"+state+"')";
                        try {
							st = (Statement) conn.createStatement();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}    // ��������ִ�о�̬sql����Statement����   
                        try {
							int count = st.executeUpdate(sql);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}  // ִ�в��������sql��䣬�����ز������ݵĸ���   
                            try {
								conn.close();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}   //�ر����ݿ�����  
                        
                        System.out.println("���浽���ݿ�:");  
                        System.out.println("name:"+name);
                        System.out.println("ͼƬ����:"+PicName);
                        System.out.println("����·��:"+fileRealResistPath);  
                    }  
                       
                }   
            }   
        } catch (FileUploadException ex) {  
            ex.printStackTrace();  
            System.out.println("û���ϴ��ļ�");  
            return;  
       }   
       response.getWriter().write("1"); 
	    }  
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse resp)  
            throws ServletException, IOException {  
        doGet(req, resp);  
    }  

}
