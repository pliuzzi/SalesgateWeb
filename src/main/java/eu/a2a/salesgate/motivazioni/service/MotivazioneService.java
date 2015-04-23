package eu.a2a.salesgate.motivazioni.service;

import java.util.List;

import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;

public interface MotivazioneService {
	List<Motivazione> getMotivazioni(Motivazione motivazione);
	Motivazione getMotivazione(String id);
	void updateMotivazione(Motivazione motivazione);
	int insertNewMotivazione(Motivazione motivazione);
	int getMaxId();
	List<MotivazioneVenditore> getMotivazioniVenditore(MotivazioneVenditore motivazioneVenditore);
	MotivazioneVenditore getMotivazioneVenditore(String id);
	void updateMotivazioneVenditore(MotivazioneVenditore motivazioneVendita);
	int insertNewMotivazioneVenditore(MotivazioneVenditore motivazioneVendita);
	int getMaxIdVenditore();
	int verifyCdCausale(String codiceCausale);
	boolean verifyUser(String user);
	//List<CodDescBean> getAllCodiciDistributore();
}
