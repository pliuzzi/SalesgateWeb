package eu.a2a.salesgate.venditori.dao;

import java.util.List;

import eu.a2a.salesgate.venditori.bean.Venditore;

public interface VenditoriDAO {
	List<Venditore> getAllVenditori(Venditore venditore);
	Venditore getVenditore(String id);
	int updateVenditore(Venditore venditore, String user);
	int insertVenditore(Venditore venditore, String user);
	int verifyIdVenditore(String id);
	int verifyPtIvaVenditore(String ptIva);
}
