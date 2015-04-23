package eu.a2a.salesgate.venditori.service;

import java.util.List;

import eu.a2a.salesgate.venditori.bean.Venditore;


public interface VenditoriService {
	List<Venditore> getAllVenditori(Venditore venditore);
	Venditore getVenditore(String id);
	void updateVenditore(Venditore venditore, String user);
	int insertNewVenditore(Venditore venditore, String user);
	int verifyIdVenditore(String id);
	int verifyPtIvaVenditore(String ptIva);
}
