package eu.a2a.salesgate.bean;


public class Params extends CodDescBean {

	private static final long serialVersionUID = 3813999332901683264L;
	private String value;
	private String category;
	
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
