package eu.a2a.salesgate.etl.exception;

public class EtlException extends Exception {

  /**
   * 
   */
  private static final long serialVersionUID = -957782388171398667L;

  private final String code;

  public EtlException(String code, String message) {
    super(message);
    this.code = code;
  }

  public String getCode() {
    return code;
  }

}
