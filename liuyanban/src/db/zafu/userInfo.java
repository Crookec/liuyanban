package db.zafu;

public class userInfo {

	public userInfo(){
		
	}
	
	public userInfo(String name,String phone,String pswd,int flag){
		this.set_uname(name);
		this.set_uphone(phone);
		this.set_upswd(pswd);
		this.set_flag(flag);
	}
	private String _uname;
	private String _uphone;
	private String _upswd;
	private int _flag;
	
	public int get_flag() {
		return _flag;
	}

	public void set_flag(int _flag) {
		this._flag = _flag;
	}

	public String get_uname() {
		return _uname;
	}
	public void set_uname(String _uname) {
		this._uname = _uname;
	}
	public String get_uphone() {
		return _uphone;
	}
	public void set_uphone(String _uphone) {
		this._uphone = _uphone;
	}
	public String get_upswd() {
		return _upswd;
	}
	public void set_upswd(String _upswd) {
		this._upswd = _upswd;
	}
	
	
}
