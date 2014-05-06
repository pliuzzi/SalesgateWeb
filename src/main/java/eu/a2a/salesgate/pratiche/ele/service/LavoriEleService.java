package eu.a2a.salesgate.pratiche.ele.service;

import java.util.List;

import eu.a2a.salesgate.pratiche.ele.bean.FiltroPraticheEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;

public interface LavoriEleService {

  public List<LavoriEle> cercaPerFiltro(FiltroPraticheEle filtro);

  public LavoriEle cercaPraticaPerCodiceSG(String codicePraticaSG);

  public boolean savePratica(LavoriEle pratica);

  public boolean savePratica(LavoriEle pratica, boolean inviaMittente);
}
