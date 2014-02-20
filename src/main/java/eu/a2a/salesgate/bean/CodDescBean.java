package eu.a2a.salesgate.bean;

import java.io.Serializable;

import eu.a2a.salesgate.bean.base.BaseBean;

public class CodDescBean extends BaseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1409986044269443798L;
	private String id;
	private String description;

	public CodDescBean() {
		this("", "");
	}

	public CodDescBean(String id) {
		this(id, "");
	}

	public CodDescBean(String id, String description) {
		this.id = id;
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public String getId() {
		return id;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setId(String id) {
		this.id = id;
	}

}
