package test1213;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.URL;
import java.net.URLConnection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;



  
  
  
  
public class onlogin extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
  
  
    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse res)  
        throws ServletException, IOException {  
    	// TODO Auto-generated method stub
        
        
    }  
  
  
    @Override  
    protected void doPost(HttpServletRequest req, HttpServletResponse res)  
        throws ServletException, IOException {  
    	res.setContentType("text/html;charset=utf-8");          
        /* 设置响应头允许ajax跨域访问 */  
        res.setHeader("Access-Control-Allow-Origin", "*");  
        /* 星号表示所有的异域请求都可以接受， */  
        res.setHeader("Access-Control-Allow-Methods", "GET,POST");  
        
        //获取code、encryptedData、iv
        String code = req.getParameter("code");
        String encryptedData=req.getParameter("encryptedData");
        String iv=req.getParameter("iv");
        
        code="0037vzy02MN0nY0PVRx02xhyy027vzye";//临时code正式使用时需删除
        String appid="wx0827c92272fb3b6d";
        String appsecret="953a9a1a1ee169c9d91efab659c60d89";
        String url="https://api.weixin.qq.com/sns/jscode2session?appid="+appid+
        							"&secret="+appsecret+"&js_code="+code+"&grant_type=authorization_code";        
        String result=this.get(url);
        System.out.println("result="+result);
        
        //提取并保留openid
        
        
        String resdata="{ \"openId\":\"openid=123456\"}";
        JSONObject json=new JSONObject(resdata);
        String openId=json.get("openId").toString();
        String sql="INSERT userinfo (userinfo.openid,userinfo.nickName) VALUES(?,?)";
        DBHelper dbhelper=new DBHelper();
		dbhelper.Nonexecute(sql,new String[]{openId,"testname"});	
		dbhelper.close();
        
        //返回值给微信小程序
        Writer out = res.getWriter();    
        out.write(resdata);
        out.flush();   
    }  
    public String get(String url) {  
        BufferedReader in = null;  
        try {  
            URL realUrl = new URL(url);  
            // 打开和URL之间的连接  
            URLConnection connection = realUrl.openConnection();  
            // 设置通用的请求属性  
            connection.setRequestProperty("accept", "*/*");  
            connection.setRequestProperty("connection", "Keep-Alive");  
            connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");  
            connection.setConnectTimeout(5000);  
            connection.setReadTimeout(5000);  
            // 建立实际的连接  
            connection.connect();  
            // 定义 BufferedReader输入流来读取URL的响应  
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));  
            StringBuffer sb = new StringBuffer();  
            String line;  
            while ((line = in.readLine()) != null) {  
                sb.append(line);  
            }  
            return sb.toString();  
        } catch (Exception e) {  
            System.out.println("erro:"+e.getMessage()); 
        }  
        // 使用finally块来关闭输入流  
        finally {  
            try {  
                if (in != null) {  
                    in.close();  
                }  
            } catch (Exception e2) {  
                e2.printStackTrace();  
            }  
        }  
        return "faile";  
    }  
}  