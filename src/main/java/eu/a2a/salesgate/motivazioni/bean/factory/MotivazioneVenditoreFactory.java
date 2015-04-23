package eu.a2a.salesgate.motivazioni.bean.factory;

import eu.a2a.salesgate.base.Loggable;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;

public class MotivazioneVenditoreFactory extends Loggable {
	public static MotivazioneVenditore newEmptyMotivazioneVendita() {
		return new MotivazioneVenditore();
	}
	
	public static MotivazioneVenditore newMotivazioneVenditore(String id, String codiceCausale, String motivazione) {
		MotivazioneVenditore mv = new MotivazioneVenditore();
		mv.setId(id);
		mv.setCodiceInterno(codiceCausale);
		mv.setMotivazione(motivazione);
		return mv;
	}
}
