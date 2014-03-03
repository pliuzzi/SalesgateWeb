package eu.a2a.salesgate.distributori.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.distributori.service.DistributoreService;

@Service("distributoriServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class DistributoreServiceImpl implements DistributoreService {

  @Autowired
  private DistributoreDAO distributoreDaoSalesgate;

  @Override
  public List<Distributore> getDistributori(Distributore distributore) {
    return distributoreDaoSalesgate.getAllDistributori(distributore);
  }

  @Override
  public Distributore getDistributore(String id) {
    return distributoreDaoSalesgate.getDistributore(id);
  }

  @Override
  public void updateDistributore(Distributore distributore) {
    distributoreDaoSalesgate.updateDistributore(distributore);
  }

  @Override
  public void updateCanali(Distributore distributore) {
    distributoreDaoSalesgate.updateCanali(distributore);
  }

  @Override
  public void updatePEC(ServizioPEC pec) {
    distributoreDaoSalesgate.updatePEC(pec);
  }

  @Override
  public ServizioPEC getPEC(String id_pec) {
    return distributoreDaoSalesgate.getPEC(id_pec);
  }

  @Override
  public int verifyIdDistributore(String id) {
    return distributoreDaoSalesgate.verifyIdDistributore(id);
  }

  @Override
  public int verifyPivaDistributore(String piva) {
    return distributoreDaoSalesgate.verifyPivaDistributore(piva);
  }

  @Override
  public int insertNewDistributore(Distributore distributore) {
    int nRowsDistributore = distributoreDaoSalesgate.insertNewDistributore(distributore);
    return nRowsDistributore;
  }

}
