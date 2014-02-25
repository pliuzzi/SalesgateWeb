package eu.a2a.salesgate.pratiche.gas.dao;

import java.util.List;

import eu.a2a.salesgate.pratiche.gas.beans.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGas;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasExtension;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXCliente;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXIndirizzo;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXMisuratore;

public interface LavoriGasDAO {

	List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro);

	LavoriGas cercaPerCodicePraticaSG(String codicePraticaSG);

	LavoriGasExtension estraiLavoriGasExtension(String codicePraticaSG);

	LavoriGasXMisuratore estraiLavoriGasXMisuratore(String id);

	LavoriGasXIndirizzo estraiLavoriGasXIndirizzo(String id);

	LavoriGasXCliente estraiLavoriGasXCliente(String id);

	void aggiornaLavoriGas(LavoriGas pratica);

}