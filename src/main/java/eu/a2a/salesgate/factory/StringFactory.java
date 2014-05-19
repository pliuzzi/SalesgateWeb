package eu.a2a.salesgate.factory;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.Name;
import javax.naming.Reference;
import javax.naming.spi.ObjectFactory;

import eu.a2a.salesgate.base.Loggable;

public class StringFactory extends Loggable implements ObjectFactory {

  @Override
  public Object getObjectInstance(Object obj, Name name, Context nameCtx, Hashtable<?, ?> environment) throws Exception {
    Reference ref = (Reference) obj;
    String urlString = (String) ref.get("url").getContent();
    return urlString;
  }

}
