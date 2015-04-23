package eu.a2a.salesgate.motivazioni.dao;

import java.util.List;

import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;

public interface MotivazioneDAO {
	List<Motivazione> getAllMotivazioni(Motivazione motivazione);
	Motivazione getMotivazione(String id);
	int updateMotivazione(Motivazione motivazione);
	int insertNewMotivazione(Motivazione motivazione);
	int getMaxId();
	List<MotivazioneVenditore> getAllMotivazioniVendita(MotivazioneVenditore motivazioneVendita);
	MotivazioneVenditore getMotivazioneVendita(String id);
	int updateMotivazioneVendita(MotivazioneVenditore motivazioneVendita);
	int insertNewMotivazioneVendita(MotivazioneVenditore motivazioneVendita);
	int getMaxIdVendita();
	int verifyCdCausale(String codiceCausale);
	boolean verifyUser(String user);
	//List<CodDescBean> getAllCodiciDistributori();
}
