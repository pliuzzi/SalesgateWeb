package eu.a2a.salesgate.pratiche.gas.dao;

import java.util.List;

import eu.a2a.salesgate.pratiche.gas.bean.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasExtension;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXCliente;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXIndirizzo;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXMisuratore;

public interface LavoriGasDAO {

	List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro);

	LavoriGas cercaPerCodicePraticaSG(String codicePraticaSG);

	LavoriGasExtension estraiLavoriGasExtension(String codicePraticaSG);

	LavoriGasXMisuratore estraiLavoriGasXMisuratore(String id);

	LavoriGasXIndirizzo estraiLavoriGasXIndirizzo(String id);

	LavoriGasXCliente estraiLavoriGasXCliente(String id);

	void aggiornaLavoriGas(LavoriGas pratica);

}