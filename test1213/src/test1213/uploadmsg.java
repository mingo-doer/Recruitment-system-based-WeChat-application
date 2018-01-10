package test1213;
import java.io.IOException;  
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;



public class uploadmsg extends HttpServlet{
	 	private static final long serialVersionUID = 1L;  

	    @Override  
	    protected void doGet(HttpServletRequest req, HttpServletResponse res)  
	        throws ServletException, IOException {  
	        
	        res.setContentType("text/html;charset=utf-8");          
	        /* 设置响应头允许ajax跨域访问 */  
	        res.setHeader("Access-Control-Allow-Origin", "*");  
	        /* 星号表示所有的异域请求都可以接受， */  
	        res.setHeader("Access-Control-Allow-Methods", "GET,POST");  
	        
	        //获取微信小程序get的参数值并打印
	        String userid = req.getParameter("userid");
	        String title = req.getParameter("title");
	        String context = req.getParameter("context");
	        String time=req.getParameter("time");
	        System.out.println("userid="+userid+"title="+title+"context="+context+"time="+time);
	        
	        //查询mysql数据库
	        String sql="INSERT into messageinfo (Title,WhoSend,Context,Time) VALUES(?,?,?,?)";
	        DBHelper dbhelper=new DBHelper();
			dbhelper.Nonexecute(sql,new String[]{title,userid,context,time});	
			dbhelper.close();
	        
	        //返回值给微信小程序
	        Writer out = res.getWriter();	        
	        out.write("上传成功");
	        out.flush();
	        out.close();
	    }  
	  
	  
	    @Override  
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  
	        throws ServletException, IOException {  

	    } 
}