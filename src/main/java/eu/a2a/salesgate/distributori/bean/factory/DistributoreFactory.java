package eu.a2a.salesgate.distributori.bean.factory;

import eu.a2a.salesgate.distributori.bean.Distributore;

public class DistributoreFactory {

  public static Distributore getEmtpyDistributore() {
    return new Distributore();
  }

  public static Distributore getDistributoreById(String id) {
    Distributore d = new Distributore();
    d.setId(id);
    return d;
  }

  public static Distributore getDistributoreByPiva(String piva) {
    Distributore d = new Distributore();
    d.setPiva(piva);
    return d;
  }

}
