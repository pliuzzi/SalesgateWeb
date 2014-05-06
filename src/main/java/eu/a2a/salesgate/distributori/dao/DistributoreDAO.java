package eu.a2a.salesgate.distributori.dao;

import java.util.List;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;

public interface DistributoreDAO {

  List<Distributore> getAllDistributori(Distributore distributore);

  Distributore getDistributore(String codiceAutority);

  int updateDistributore(Distributore distributore);

  int updateCanali(Distributore distributore);

  int updatePEC(ServizioPEC pec);

  ServizioPEC getPEC(String id_pec);

  ServizioPEC getPEC(String codiceAutority, String codServizio);

  int verifyIdDistributore(String id);

  int verifyPivaDistributore(String piva);

  int insertNewDistributore(Distributore distributore);

}