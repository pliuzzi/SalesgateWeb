package eu.a2a.salesgate.distributori.service.impl;

import java.util.List;








import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.distributori.service.DistributoreService;

@Service
public class DistributoreServiceImpl implements DistributoreService{

	@Autowired
	private DistributoreDAO distributoreDao;
	
	@Override
	public List<Distributore> getDistributori(Distributore distributore) {
		return distributoreDao.getAllDistributori(distributore);
	}

	@Override
	public Distributore getDistributore(String id) {
		return distributoreDao.getDistributore(id);
	}

	@Override
	@Transactional
	public void updateDistributore(Distributore distributore) {
		distributoreDao.updateDistributore(distributore);
	}

	@Override
	@Transactional
	public void updateCanali(Distributore distributore) {
		distributoreDao.updateCanali(distributore);
	}

	@Override
	@Transactional
	public void updatePEC(ServizioPEC pec) {
		distributoreDao.updatePEC(pec);
	}

	@Override
	public ServizioPEC getPEC(String id_pec) {
		return distributoreDao.getPEC(id_pec);
	}

	@Override
	public int verifyIdDistributore(String id) {
		return distributoreDao.verifyIdDistributore(id);
	}

	@Override
	public int verifyPivaDistributore(String piva) {
		return distributoreDao.verifyPivaDistributore(piva);
	}
	
	@Override
	@Transactional
	public int insertNewDistributore(Distributore distributore){
		int nRowsDistributore = distributoreDao.insertNewDistributore(distributore);
		return nRowsDistributore;
	}
	
}
