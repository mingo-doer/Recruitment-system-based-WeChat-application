package test1213;
import java.io.IOException;  
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



public class getjobdetail extends HttpServlet {  
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
        String positionid = req.getParameter("positionid");
       
        //System.out.println("positionid="+positionid);
        
        List<String> jsonlist = new ArrayList<String>();
        String sql="select position.PositionID, position.positionName ,Salary,Location,WorkExperience,Education,company.CompanyName,CompanyIntro,PositionIntro,position.Contacter,position.ContacterPhone "
        		+ "FROM position ,company WHERE company.PositionID=position.PositionID ";
        DBHelper dbhelper=new DBHelper();
        try {
			ResultSet ret=dbhelper.execute(sql);
			while(ret.next()){
				String positionName=ret.getString(2);
				String Salary=ret.getString(3);
				String Location=ret.getString(4);
				String WorkExperience=ret.getString(5);
				String Education=ret.getString(6);
				String CompanyName=ret.getString(7);
				String CompanyIntro=ret.getString(8);
				String PositionIntro=ret.getString(9);
				String Contacter=ret.getString(10);
				String ContacterPhone=ret.getString(11);
				
				JSONObject json=new JSONObject();
			
				//key,value
				json.put("positionName", positionName);
				json.put("Salary", Salary);
				json.put("Location", Location);
				json.put("WorkExperience", WorkExperience);
				json.put("Education", Education);
				json.put("CompanyName", CompanyName);
				json.put("CompanyIntro", CompanyIntro);
				json.put("PositionIntro", PositionIntro);
				json.put("Contacter", Contacter);
				json.put("ContacterPhone", ContacterPhone);
			
				jsonlist.add(json.toString());
				
				//System.out.println(positionName+"\t"+Salary+"\t"+Location+"\t"+WorkExperience+"\t");
			}
			dbhelper.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        String resdata=JSONHelper.createJsonData(" getjobdetail", jsonlist);
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