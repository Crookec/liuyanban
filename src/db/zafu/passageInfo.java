package db.zafu;

public class passageInfo {
	public passageInfo(){
		
	}
	
	public passageInfo(int pid,String uphone,String text){
		this.setPid(pid);
		this.setUphone(uphone);
		this.setText(text);
	}
	
	private int pid;
	private String uphone;
	private String text;
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
