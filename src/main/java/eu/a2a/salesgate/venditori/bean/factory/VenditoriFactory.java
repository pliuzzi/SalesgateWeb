package eu.a2a.salesgate.venditori.bean.factory;

import eu.a2a.salesgate.base.Loggable;
import eu.a2a.salesgate.venditori.bean.Venditore;

public class VenditoriFactory extends Loggable {
	public static Venditore newEmptyVenditore() {
		return new Venditore();
	}
	
	public static Venditore newVenditore(String id, String nome, String ptIva) {
		Venditore venditore = new Venditore();
		venditore.setId(id);
		venditore.setNome(nome);
		venditore.setPtIva(ptIva);
		return venditore;
	}
}
