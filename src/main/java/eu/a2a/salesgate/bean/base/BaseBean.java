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
  protected final String ITALIAN_DATETIME = "dd/MM/yyyy hh:mm:ss";
  private final SimpleDateFormat sdfItalianDate;
  private final SimpleDateFormat sdfItalianDateTime;

  public BaseBean() {
    sdfItalianDate = new SimpleDateFormat(ITALIAN_DATE);
    sdfItalianDateTime = new SimpleDateFormat(ITALIAN_DATETIME);
  }

  protected String formatDate(Date date) {
    return (StringUtils.isEmpty(date) ? "" : sdfItalianDate.format(date));
  }

  protected String formatDateTime(Date date) {
    return (StringUtils.isEmpty(date) ? "" : sdfItalianDateTime.format(date));
  }

}