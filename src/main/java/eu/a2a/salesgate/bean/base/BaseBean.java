package eu.a2a.salesgate.bean.base;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.util.StringUtils;

public class BaseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3800205139249846275L;
	protected final String ITALIAN_DATE = "dd/MM/yyyy";
	protected final SimpleDateFormat sdf;

	public BaseBean() {
		sdf = new SimpleDateFormat(ITALIAN_DATE);
	}

	protected String formatDate(Date date) {
		return (StringUtils.isEmpty(date) ? "" : sdf.format(date));
	}

}
