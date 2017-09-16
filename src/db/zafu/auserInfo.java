package db.zafu;

public class auserInfo {
	public auserInfo(){
		
	}
	
	public auserInfo(String uid,String upswd){
		this.set_uid(uid);
		this.setUpswd(upswd);
	}
	
	private String _uid;
	private String upswd;
	
	public String get_uid() {
		return _uid;
	}

	public void set_uid(String _uid) {
		this._uid = _uid;
	}

	public String getUpswd() {
		return upswd;
	}

	public void setUpswd(String upswd) {
		this.upswd = upswd;
	}
}
