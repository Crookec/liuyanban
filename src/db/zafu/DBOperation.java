package db.zafu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;


public class DBOperation {
	private Connection conn;
	
	public DBOperation(){
		
	}
	//--------------------读取全部----------------------
	public void readuser(ArrayList<userInfo> data){//读取用户
		conn=DBConnection.get_Connection();
		try{
			String sql="select uname,uphone,upswd,flag from user";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				String uname=rs.getString("uname");
				String uphone=rs.getString("uphone");
				String upswd=rs.getString("upswd");
				int flag=rs.getInt("flag");
				userInfo info= new userInfo(uname,uphone,upswd,flag);
				data.add(info);
			}
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void readauser(ArrayList<auserInfo> data){//读取管理员
		conn=DBConnection.get_Connection();
		try{
			String sql="select uid,upswd from auser";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				String uid=rs.getString("uid");
				String upswd=rs.getString("upswd");
				auserInfo info= new auserInfo(uid,upswd);
				data.add(info);
			}
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void readpassage(ArrayList<passageInfo> data){//读取帖子
		conn=DBConnection.get_Connection();
		try{
			String sql="select pid,uphone,text from passage";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				int pid=rs.getInt("pid");
				String uphone=rs.getString("uphone");
				String text=rs.getString("text");
				passageInfo info= new passageInfo(pid,uphone,text);
				data.add(info);
			}
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void readreply(ArrayList<replyInfo> data){//读取回复
		conn=DBConnection.get_Connection();
		try{
			String sql="select rid,pid,uphone,text from reply";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				int rid=rs.getInt("rid");
				int pid=rs.getInt("pid");
				String uphone=rs.getString("uphone");
				String text=rs.getString("text");
				replyInfo info= new replyInfo(rid,pid,uphone,text);
				data.add(info);
			}
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	//----------------------按id读取------------------------
	public void readuserbyid(String id,userInfo info){//读取用户
		conn=DBConnection.get_Connection();
		try{
			String sql="select uname,uphone,upswd,flag from user where uphone='"+id+"'";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			String uname=rs.getString("uname");
			String uphone=rs.getString("uphone");
			String upswd=rs.getString("upswd");
			int flag=rs.getInt("flag");
			info.set_uname(uname);
			info.set_uphone(uphone);
			info.set_upswd(upswd);
			info.set_flag(flag);
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void readauserbyid(String id,auserInfo info){//读取管理员
		conn=DBConnection.get_Connection();
		try{
			String sql="select uid,upswd from auser where uid='"+id+"'";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			String uid=rs.getString("uid");
			String upswd=rs.getString("upswd");
			info.set_uid(uid);
			info.setUpswd(upswd);
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void readpassagebyid(int pid,passageInfo info){//读取帖子
		conn=DBConnection.get_Connection();
		try{
			String sql="select pid,uphone,text from passage where pid='"+pid+"'";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			int ppid=rs.getInt("pid");
			String uphone=rs.getString("uphone");
			String text=rs.getString("text");
			info.setPid(ppid);
			info.setUphone(uphone);
			info.setText(text);
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void readreplybyid(int rid,replyInfo info){//读取回复
		conn=DBConnection.get_Connection();
		try{
			String sql="select rid,pid,uphone,text from reply where rid='"+rid+"'";
			Statement st = ( Statement )conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			int rrid=rs.getInt("rid");
			int pid=rs.getInt("pid");
			String uphone=rs.getString("uphone");
			String text=rs.getString("text");
			info.set_pid(pid);
			info.set_rid(rrid);
			info.set_uphone(uphone);
			info.setText(text);
		}
		catch(SQLException ex)
		{
			System.out.printf("%s",ex.toString());
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	//---------------------添加----------------------------
	public void adduser(String uname,String uphone,String upswd){//添加用户
		conn = DBConnection.get_Connection();
		try{
			String sql = "insert into user(uname,uphone,upswd,flag) "
					+ "value('"
					+uname
					+"','"
					+uphone
					+"','"
					+upswd
					+"','"
					+0
					+"')";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);	
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void addpassage(int pid,String uphone,String text){//添加帖子
		conn = DBConnection.get_Connection();
		try{
			String sql = "insert into passage(pid,uphone,text) "
					+ "value('"
					+pid
					+"','"
					+uphone
					+"','"
					+text
					+"')";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);	
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void addreply(int rid,int pid,String uphone,String text){//添加回复
		conn = DBConnection.get_Connection();
		try{
			String sql = "insert into reply(rid,pid,uphone,text) "
					+ "value('"
					+rid
					+"','"
					+pid
					+"','"
					+uphone
					+"','"
					+
					text
					+"')";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);	
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	//------------------------删除----------------------
	public void deletepassage(int x){//删除帖子
		conn = DBConnection.get_Connection();		
		try{
			String sql = "delete from passage "
					+ "where pid = '"
					+x 
					+"'";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);
			
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void deletereply(int x){//删除回复
		conn = DBConnection.get_Connection();		
		try{
			String sql = "delete from reply "
					+ "where rid = '"
					+x 
					+"'";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);
			
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
	
	public void deletereplybyid(int x){//删除回复
		conn = DBConnection.get_Connection();		
		try{
			String sql = "delete from reply "
					+ "where pid = '"
					+x 
					+"'";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);
			
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
    //------------------------更新---------------------------------
	public void updateuser(String uphone,int flag){//更新影厅座位信息
		 conn = DBConnection.get_Connection();
		try{
			String sql = "update user set flag='"+flag+"' where uphone='"+uphone+"'";
			Statement st = ( Statement ) conn.createStatement();
			st.executeUpdate(sql);	
		}
		catch( SQLException ex ){
			System.out.printf("%s\n", ex.toString() );
		}
		finally{
			try{
				conn.close();
			}
			catch( SQLException ex ){
				System.out.println( ex.toString()  );
			}
		}
	}
}