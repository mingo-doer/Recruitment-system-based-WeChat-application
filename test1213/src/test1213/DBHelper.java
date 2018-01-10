package test1213;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 

public class DBHelper {
	public static final String url = "jdbc:mysql://localhost:3306/testdata";
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "123456";  
    
    public Connection conn = null;  
    public PreparedStatement pst = null;  
  
    public DBHelper() {  
        try {  
            Class.forName(name);//指定连接类型  
            conn = DriverManager.getConnection(url, user, password);//获取连接  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    
    public ResultSet execute(String sql){
    	ResultSet ret=null;
    	try {  
            pst = conn.prepareStatement(sql);//准备执行语句  
            ret=this.pst.executeQuery();
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    	return ret;
    }
    
    public Boolean Nonexecute(String sql,String[] s){
    	try {  
            pst = conn.prepareStatement(sql);//准备执行语句
            for(int i=0;i<s.length;i++)
            {
            	pst.setString(i+1,s[i]);
            }
            this.pst.executeUpdate();
        } catch (Exception e) {  
            e.printStackTrace();  
        }
    	
    	return true;
    }
    
	public void close() {  
        try {  
            this.conn.close();  
            this.pst.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
}
