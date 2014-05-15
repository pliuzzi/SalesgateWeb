package eu.a2a.salesgate.pratiche.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.pratiche.bean.Tracking;
import eu.a2a.salesgate.pratiche.ele.dao.LavoriEleDAO;
import eu.a2a.salesgate.pratiche.gas.dao.LavoriGasDAO;
import eu.a2a.salesgate.pratiche.service.AmmissibilitaService;

@Service("ammissibilitaServiceSalesgate")
public class AmmissibilitaServiceImpl implements AmmissibilitaService {

  @Autowired
  LavoriEleDAO lavoriEleDaoSalesgate;

  @Autowired
  LavoriGasDAO lavoriGasDaoSalesgate;

  @Autowired
  private DistributoreDAO distributoreDaoSalesgate;

  @Override
  public Tracking getTracking(String id) {
    Tracking tracking = lavoriEleDaoSalesgate.cercaPerCodicePraticaSG(id);
    if (tracking == null) {
      tracking = lavoriGasDaoSalesgate.cercaPerCodicePraticaSG(id);
    }
    Distributore distributore = distributoreDaoSalesgate.getDistributore(tracking.getFkDistributore());
    tracking.setDistributore(distributore);
    return tracking;
  }

}
