package eu.a2a.salesgate.base;

import org.apache.log4j.Logger;

public abstract class LoggableObject {

  protected Logger logger = Logger.getLogger(this.getClass());

}
