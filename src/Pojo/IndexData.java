package Pojo;

public class IndexData {

	int id;				//����
	String topic;		//����
	String context;		//����
	String url;			//����
	String newsType;	//����     1�ֲ�ͼƬ      2�ֲ�ͼƬ�Ҳ�     3ʵʱ����     4ʵʱ�����Ҳ�����ͼƬ
	String path;		//����·��
	
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
