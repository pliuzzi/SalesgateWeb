package eu.a2a.salesgate.pratiche.gas.service;

import java.util.List;

import eu.a2a.salesgate.pratiche.gas.beans.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGas;

public interface LavoriGasService {

	public List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro);

	public LavoriGas cercaPraticaPerCodiceSG(String codicePraticaSG);

	public boolean savePratica(LavoriGas pratica);

	public boolean savePratica(LavoriGas pratica, boolean inviaMittente);
}