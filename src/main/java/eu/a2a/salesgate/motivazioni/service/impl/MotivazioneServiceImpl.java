package eu.a2a.salesgate.motivazioni.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;
import eu.a2a.salesgate.motivazioni.dao.MotivazioneDAO;
import eu.a2a.salesgate.motivazioni.service.MotivazioneService;
import eu.a2a.salesgate.service.base.AbstractService;

@Service("motivazioniServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class MotivazioneServiceImpl extends AbstractService implements MotivazioneService {
	@Autowired
	private MotivazioneDAO motivazioneDaoSalesgate;
	
	@Override
	public List<Motivazione> getMotivazioni(Motivazione motivazione) {
		return motivazioneDaoSalesgate.getAllMotivazioni(motivazione);
	}
	
	@Override
	public Motivazione getMotivazione(String id) {
		return motivazioneDaoSalesgate.getMotivazione(id);
	}
	
	@Override
	public void updateMotivazione(Motivazione motivazione) {
		motivazioneDaoSalesgate.updateMotivazione(motivazione);
	}
	
	@Override
	public int insertNewMotivazione(Motivazione motivazione) {
		return motivazioneDaoSalesgate.insertNewMotivazione(motivazione);
	}
	
	@Override
	public int getMaxId() {
		return motivazioneDaoSalesgate.getMaxId();
	}
	
	/*
	@Override
	public List<CodDescBean> getAllCodiciDistributore() {
		return motivazioneDaoSalesgate.getAllCodiciDistributori();
	}*/
	
	@Override
	public List<MotivazioneVenditore> getMotivazioniVenditore(MotivazioneVenditore motivazioneVendita) {
		return motivazioneDaoSalesgate.getAllMotivazioniVendita(motivazioneVendita);
	}
	
	@Override
	public MotivazioneVenditore getMotivazioneVenditore(String id) {
		return motivazioneDaoSalesgate.getMotivazioneVendita(id);
	}
	
	@Override
	public void updateMotivazioneVenditore(MotivazioneVenditore motivazioneVendita) {
		motivazioneDaoSalesgate.updateMotivazioneVendita(motivazioneVendita);
	}
	
	@Override
	public int insertNewMotivazioneVenditore(MotivazioneVenditore motivazioneVendita) {
		return motivazioneDaoSalesgate.insertNewMotivazioneVendita(motivazioneVendita);
	}
	
	@Override
	public int getMaxIdVenditore() {
		return motivazioneDaoSalesgate.getMaxIdVendita();
	}
	
	@Override
	public int verifyCdCausale(String codiceCausale) {
		return motivazioneDaoSalesgate.verifyCdCausale(codiceCausale);
	}
	
	@Override
	public boolean verifyUser(String user) {
		return motivazioneDaoSalesgate.verifyUser(user);
	}
}
