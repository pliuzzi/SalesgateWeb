package eu.a2a.salesgate.pratiche.gas.service;

import java.util.List;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.pratiche.gas.bean.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;

public interface LavoriGasService {

  public List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro);

  public LavoriGas cercaPraticaPerCodiceSG(String codicePraticaSG);

  public GenericResponse savePratica(LavoriGas pratica);

  public GenericResponse savePratica(LavoriGas pratica, boolean inviaMittente);
}
