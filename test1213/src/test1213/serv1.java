package test1213;
import java.io.IOException;  
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;



  
  
  
  
public class serv1 extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
  
  
    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse res)  
        throws ServletException, IOException {  
// TODO Auto-generated method stub
        
        res.setContentType("text/html;charset=utf-8");          
        /* 设置响应头允许ajax跨域访问 */  
        res.setHeader("Access-Control-Allow-Origin", "*");  
        /* 星号表示所有的异域请求都可以接受， */  
        res.setHeader("Access-Control-Allow-Methods", "GET,POST");  
        
        //获取微信小程序get的参数值并打印
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println("username="+username+" ,password="+password);
        
        
        String sql="SELECT * from userinfo";
        DBHelper dbhelper=new DBHelper();
        try {
			ResultSet ret=dbhelper.execute(sql);
			while(ret.next()){
				String dbuserid=ret.getString(1);
				String dbusername=ret.getString(2);
				System.out.println(dbuserid+"\t"+dbusername);
			}
			dbhelper.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
        
        //json格式数据
        //制作一个resdata-msgdata的json数据串
        String resdata="{\"msgdata\":[";  
        for(int i=0;i<4;i++){
        	JSONObject json=new JSONObject();
            json.put("title", i);
            json.put("whosend", i+""+i);
            json.put("time", "2017-12-17");
            json.put("context", "文章内容"+i);
            json.put("whoread", new String[]{"张三","李四","王五"});
            System.out.println(json.toString());
            if(i!=3)resdata=resdata+json.toString()+",";
            else resdata+=json.toString();
        }
        resdata+="]}";
        System.out.println(resdata);
        
        //返回值给微信小程序
        Writer out = res.getWriter();
        //out.write("进入后台了");
        //String s = "{\"employees\": [{ \"firstName\":\"John\" , \"lastName\":\"Doe\" },{ \"firstName\":\"Anna\" , \"lastName\":\"Smith\" },{ \"firstName\":\"Peter\" , \"lastName\":\"Jones\" }]}";
        
        out.write(resdata);
        out.flush();   
    }  
  
  
    @Override  
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  
        throws ServletException, IOException {  
        PrintWriter out = resp.getWriter();  
        String str = "<html><title></title><body>你好Hello World sb!!!</body></html>";  
        out.println(str);  
        out.flush();  
        out.close();  
        System.out.println("dopost...");  
    }  
}  