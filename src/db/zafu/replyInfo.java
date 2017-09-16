package db.zafu;

public class replyInfo {
	public replyInfo(){
		
	}
	
	public replyInfo(int rid,int pid,String uphone,String text){
		this.set_rid(rid);
		this.set_pid(pid);
		this.set_uphone(uphone);
		this.setText(text);
	}
	
	private int _rid;
	private int _pid;
	private String _uphone;
	private String text;
	
	public int get_rid() {
		return _rid;
	}

	public void set_rid(int _rid) {
		this._rid = _rid;
	}

	public int get_pid() {
		return _pid;
	}

	public void set_pid(int _pid) {
		this._pid = _pid;
	}

	public String get_uphone() {
		return _uphone;
	}

	public void set_uphone(String _uphone) {
		this._uphone = _uphone;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
