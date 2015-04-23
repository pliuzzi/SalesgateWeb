package eu.a2a.salesgate.venditori.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.venditori.bean.Venditore;
import eu.a2a.salesgate.venditori.dao.VenditoriDAO;
import eu.a2a.salesgate.venditori.service.VenditoriService;

@Service("venditoriServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class VenditoriServiceImpl implements VenditoriService {
	@Autowired
	private VenditoriDAO venditoreDAOSalesgate;
	
	@Override
	public List<Venditore> getAllVenditori(Venditore venditore) {
		return venditoreDAOSalesgate.getAllVenditori(venditore);
	}
	
	@Override
	public Venditore getVenditore(String id) {
		return venditoreDAOSalesgate.getVenditore(id);
	}
	
	@Override
	public void updateVenditore(Venditore venditore, String user) {
		venditoreDAOSalesgate.updateVenditore(venditore, user);
	}
	
	@Override
	public int insertNewVenditore(Venditore venditore, String user) {
		int nRowsVenditore = venditoreDAOSalesgate.insertVenditore(venditore, user);
		return nRowsVenditore;
	}
	
	@Override
	public int verifyIdVenditore(String id) {
		return venditoreDAOSalesgate.verifyIdVenditore(id);
	}
	
	@Override
	public int verifyPtIvaVenditore(String ptIva) {
		return venditoreDAOSalesgate.verifyPtIvaVenditore(ptIva);
	}
}
