package Pojo;

import java.util.Date;

public class FixedData {
	
	private int id;				//主键
	private String topic;		//标题
	private String context;		//内容
	private String url;			//链接
	private String newsType;	//类型
	private String path;		//本地路径
	private Date   savedate;	//存库时间
	
	public Date getSavedate() {
		return savedate;
	}
	public void setSavedate(Date savedate) {
		this.savedate = savedate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getContext() {
		return context;
	}
	public String getNewsType() {
		return newsType;
	}
	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
