package eu.a2a.salesgate.dao.type.impl;

import eu.a2a.salesgate.dao.type.Type;

public class BooleanType implements Type<Boolean> {

	public static final String YES = "Y";
	public static final String NO = "N";

	@Override
	public Boolean fromSQL(Object o) {

		return ((String) o).equals(YES);
	}

	@Override
	public Object toSQL(Boolean t) {

		return t ? YES : NO;
	}

}
