package eu.a2a.salesgate.distributori.service;


import java.util.List;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;

public interface DistributoreService {

	List<Distributore> getDistributori(Distributore distributore);
	Distributore getDistributore(String id);
	void updateDistributore(Distributore distributore);
	void updateCanali(Distributore distributore);
	void updatePEC(ServizioPEC pec);
	ServizioPEC getPEC(String id_pec);
	int verifyIdDistributore(String id);
	int verifyPivaDistributore(String piva);
	int insertNewDistributore(Distributore distributore);
}
