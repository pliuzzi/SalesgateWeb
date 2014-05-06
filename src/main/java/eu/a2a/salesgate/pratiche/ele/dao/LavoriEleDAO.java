package eu.a2a.salesgate.pratiche.ele.dao;

import java.util.List;

import eu.a2a.salesgate.pratiche.ele.bean.FiltroPraticheEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleExtension;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXCliente;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXIndirizzo;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXMisuratore;

public interface LavoriEleDAO {

  List<LavoriEle> cercaPerFiltro(FiltroPraticheEle filtro);

  LavoriEle cercaPerCodicePraticaSG(String codicePraticaSG);

  LavoriEleExtension estraiLavoriEleExtension(String codicePraticaSG);

  LavoriEleXMisuratore estraiLavoriEleXMisuratore(String id);

  LavoriEleXIndirizzo estraiLavoriEleXIndirizzo(String id);

  LavoriEleXCliente estraiLavoriEleXCliente(String id);

  void aggiornaLavoriEle(LavoriEle pratica);

}