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

import org.json.JSONObject;



public class getmsg extends HttpServlet{
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
	        String username = req.getParameter("username");
	        System.out.println("username="+username);
	        
	        List<String> jsonlist = new ArrayList<String>();
	        //查询mysql数据库
	        String sql="select messageinfo.Title,messageinfo.WhoSend,messageinfo.Time,messageinfo.Context FROM messageinfo";
	        DBHelper dbhelper=new DBHelper();
	        try {
				ResultSet ret=dbhelper.execute(sql);
				while(ret.next()){
					String title=ret.getString(1);
					String whosend=ret.getString(2);
					String time=ret.getString(3);
					String context=ret.getString(4);
					JSONObject json=new JSONObject();
					json.put("title", title);
		            json.put("whosend", whosend);
		            json.put("time", time);
		            json.put("context", context);
		            jsonlist.add(json.toString());
				}				
				dbhelper.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	        
	        //这里的msgdata 是返回小程序中 setdata 的res.data.mesdata
	        String resdata=JSONHelper.createJsonData("msgdata", jsonlist);
	        System.out.println(resdata);
	        
	        //返回值给微信小程序
	        Writer out = res.getWriter();
	        out.write(resdata);
	        out.flush();
	        out.close();
	    }  
	  
	  
	    @Override  
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  
	        throws ServletException, IOException {  

	    }  
}
