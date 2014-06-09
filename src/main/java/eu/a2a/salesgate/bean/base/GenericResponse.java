package eu.a2a.salesgate.bean.base;

import eu.a2a.salesgate.bean.CodDescBean;

public class GenericResponse extends CodDescBean {

  private static final long serialVersionUID = -2001436303130135930L;

  public static final String OK = "OK";
  public static final String KO = "KO";
  public static final String ERROR = "ERROR";

  private String code;
  private String message;
  private Throwable throwable;

  private GenericResponse() {

  }

  private GenericResponse(String code, String message, Throwable throwable) {
    this.code = code;
    this.message = message;
    this.throwable = throwable;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Throwable getThrowable() {
    return throwable;
  }

  public void setThrowable(Throwable throwable) {
    this.throwable = throwable;
  }

  public static GenericResponse createGenericResponse(String code, String message, Throwable throwable) {
    if (code == null) {
      throw new IllegalArgumentException("code is null");
    }
    if (!code.equals(OK) && !code.equals(KO) && !code.equals(ERROR)) {
      throw new IllegalArgumentException("code must be equals \"OK\", \"KO\" or \"ERROR\"");
    }
    return new GenericResponse(code, message, throwable);
  }

  public static GenericResponse createGenericResponse(String code, String message) {
    return createGenericResponse(code, message, null);
  }

  public static GenericResponse createOkResponse(String message) {
    return createGenericResponse(OK, message, null);
  }

  public static GenericResponse createKoResponse(String message) {
    return createGenericResponse(KO, message, null);
  }

  public static GenericResponse createErrorResponse(String message, Throwable throwable) {
    return createGenericResponse(ERROR, message, throwable);
  }

  public static GenericResponse createErrorResponse(String message) {
    return createGenericResponse(ERROR, message, null);
  }

  public boolean isOk() {
    return this.code.equals(OK);
  }

  public boolean isKo() {
    return this.code.equals(KO);
  }

  public boolean isError() {
    return this.code.equals(ERROR);
  }

}
