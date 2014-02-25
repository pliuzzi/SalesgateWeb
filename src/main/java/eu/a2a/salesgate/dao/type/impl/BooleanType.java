package eu.a2a.salesgate.dao.type.impl;

import eu.a2a.salesgate.dao.type.Type;

public class BooleanType implements Type<Boolean> {

  public static final String YES = "Y";
  public static final String NO = "N";

  private final Object cacheValue;

  public BooleanType(Object in) {
    this.cacheValue = in;
  }

  @Override
  public Boolean fromSQL() {
    if (cacheValue == null)
      return false;
    return ((String) cacheValue).equals(YES);
  }

  @Override
  public String toSQL() {
    if (cacheValue == null)
      return NO;
    return ((Boolean) cacheValue) ? YES : NO;
  }

}
