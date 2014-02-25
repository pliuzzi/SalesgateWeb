package eu.a2a.salesgate.bean;


public class FileType extends CodDescBean {

	private static final long serialVersionUID = -2245996935250511678L;
	private String code;
	private String isTemplate;
	private String mimeType;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getIsTemplate() {
		return isTemplate;
	}
	public void setIsTemplate(String isTemplate) {
		this.isTemplate = isTemplate;
	}
	public String getMimeType() {
		return mimeType;
	}
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

}
