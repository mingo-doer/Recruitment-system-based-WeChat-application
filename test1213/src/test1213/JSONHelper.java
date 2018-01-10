package test1213;



import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

public class JSONHelper {
public static String createJsonData(String dataname,List<String> jsonlist){
	String data="";
	data="{\""+dataname+"\":[";  
    for(int i=0;i<jsonlist.size();i++){
        if(i!=jsonlist.size()-1)data=data+jsonlist.get(i)+",";
        else data+=jsonlist.get(i);
    }
    data+="]}";
	return data;
	
}
}
