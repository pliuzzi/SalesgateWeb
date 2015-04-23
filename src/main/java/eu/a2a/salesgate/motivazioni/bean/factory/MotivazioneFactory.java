package eu.a2a.salesgate.motivazioni.bean.factory;

import eu.a2a.salesgate.base.Loggable;
import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;

public class MotivazioneFactory extends Loggable {
	public static Motivazione newEmptyMotivazione() {
		return new Motivazione();
	}
	
	public static Motivazione newMotivazione(String id, String motivazioneDistributore, MotivazioneVenditore motivazioneVenditore, String codiceCausale, String codiceInterno, String attivo) {
		Motivazione m = new Motivazione();
		m.setId(id);
		m.setMotivazioneDistributore(motivazioneDistributore);
		m.setMotivazioneVenditore(motivazioneVenditore);
		m.setCodiceCausale(codiceCausale);
		m.setAttivo(attivo);
		return m;
	}
}
