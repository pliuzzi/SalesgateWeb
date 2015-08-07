package eu.a2a.salesgate.dao.base;

import java.text.SimpleDateFormat;

import eu.a2a.salesgate.base.Loggable;

public abstract class AbstractDAO extends Loggable {

  private final SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");

  protected SimpleDateFormat getDateFormatter() {
    dateFormatter.setLenient(false);
    return dateFormatter;
  }

}
