package eu.a2a.salesgate.distributori.bean.factory;

import eu.a2a.salesgate.base.Loggable;
import eu.a2a.salesgate.distributori.bean.Distributore;

public class DistributoreFactory extends Loggable {

  public static Distributore newEmtpyDistributore() {
    return new Distributore();
  }

  public static Distributore newDistributore(String id, String name, String piva) {
    Distributore d = new Distributore();
    d.setId(id);
    d.setPiva(piva);
    d.setName(name);
    return d;
  }

}
