package eu.a2a.salesgate.dao.type;

public interface Type<T> {

	T fromSQL(Object o);
	Object toSQL(T t);
	
}
