package test;

import db.zafu.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

import db.zafu.*;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class test {
	public static void main(String[] args) throws ParseException {
			Connection conn = DBConnection.get_Connection();
			if( conn != null ){
				System.out.println("连接成功");
			}	
			DBOperation db=new DBOperation();
			ArrayList<userInfo> udata=new ArrayList<userInfo>();
			ArrayList<auserInfo> adata=new ArrayList<auserInfo>();
			ArrayList<passageInfo> pdata=new ArrayList<passageInfo>();
			ArrayList<replyInfo> rdata=new ArrayList<replyInfo>();
			userInfo uinfo=new userInfo();
			auserInfo ainfo=new auserInfo();
			passageInfo pinfo=new passageInfo();
			replyInfo rinfo=new replyInfo();
			db.readuser(udata);
			db.readuserbyid("17826875887", uinfo);
			db.readauser(adata);
			db.readauserbyid("11", ainfo);
			db.readpassage(pdata);
			db.readpassagebyid(1, pinfo);
			db.readreply(rdata);
			db.readreplybyid(1, rinfo);
			//db.adduser("aaa", "17826875886", "111111");
			//db.addpassage(2, "17826875887", "想吃东西啊啊啊");
			//db.addreply(2, 1, "17826875886", "吃糖醋排骨水煮鱼啊啊啊啊啊啊");
			db.deletepassage(1);
			db.deletereply(1);
			db.updateuser("17826875887", 1);
	}
}