package eu.a2a.salesgate.pratiche.ele.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.pratiche.ele.bean.FiltroPraticheEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleExtension;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXCliente;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXIndirizzo;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXMisuratore;
import eu.a2a.salesgate.pratiche.ele.dao.LavoriEleDAO;
import eu.a2a.salesgate.pratiche.ele.dao.impl.handler.LavoriEleExtensionJdbcHandler;
import eu.a2a.salesgate.pratiche.ele.dao.impl.handler.LavoriEleJdbcHandler;
import eu.a2a.salesgate.pratiche.ele.dao.impl.handler.LavoriEleXClienteJdbcHandler;
import eu.a2a.salesgate.pratiche.ele.dao.impl.handler.LavoriEleXIndirizzoJdbcHandler;
import eu.a2a.salesgate.pratiche.ele.dao.impl.handler.LavoriEleXMisuratoreJdbcHandler;

@Repository("lavoriEleDaoSalesgate")
public class LavoriEleDAOImpl extends AbstractDAO implements LavoriEleDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<LavoriEle> cercaPerFiltro(FiltroPraticheEle filtro) {

    String sql = "select * from lavori_ele where 1=1";
    if (!StringUtils.isEmpty(filtro.getCodicePraticaSG())) {
      sql += " and id = '" + filtro.getCodicePraticaSG() + "'";
    }
    if (!StringUtils.isEmpty(filtro.getCodicePraticaUtente())) {
      sql += " and id_sistema_sorgente = '" + filtro.getCodicePraticaUtente() + "'";
    }
    if (!StringUtils.isEmpty(filtro.getCodicePraticaDistributore())) {
      sql += " and codice_pratica_dl = '" + filtro.getCodicePraticaDistributore() + "'";
    }
    if (!StringUtils.isEmpty(filtro.getCodiceDistributore())) {
      sql += " and fk_distributore = '" + filtro.getCodiceDistributore() + "'";
    }

    if (filtro.isErroreVerificaEsito()) {
      sql += " and verifica_esito = '1'";
    } else {
      sql += " and verifica_esito = '0'";
    }

    if (!StringUtils.isEmpty(filtro.getPod())) {
      sql += " and pod = '" + filtro.getPod() + "'";
    }

    if (!StringUtils.isEmpty(filtro.getStato())) {
      sql += " and stato = '" + filtro.getStato() + "'";
    }

    //jdbcTemplateSalesgate.setMaxRows(1000);
    List<LavoriEle> list = jdbcTemplateSalesgate.query(sql, new LavoriEleJdbcHandler().getRowMapper());
    return list;
  }

  @Override
  public LavoriEle cercaPerCodicePraticaSG(String codicePraticaSG) {
    String sqlLavoriEle = "select * from lavori_ele where id = '" + codicePraticaSG + "'";
    LavoriEle pratica = jdbcTemplateSalesgate.query(sqlLavoriEle, new LavoriEleJdbcHandler().getResultSetExtractor());
    return pratica;
  }

  @Override
  public LavoriEleExtension estraiLavoriEleExtension(String codicePraticaSG) {
    String sql = "select * from lavori_ele_extension where fk_lavori_ele = '" + codicePraticaSG + "'";
    LavoriEleExtension lavoriEleExtension = jdbcTemplateSalesgate.query(sql, new LavoriEleExtensionJdbcHandler().getResultSetExtractor());
    return lavoriEleExtension;
  }

  @Override
  public LavoriEleXMisuratore estraiLavoriEleXMisuratore(String id) {
    String sql = "select * from lavori_ele_x_misuratore where id = " + id;
    LavoriEleXMisuratore lavoriEleXMisuratore = jdbcTemplateSalesgate.query(sql, new LavoriEleXMisuratoreJdbcHandler().getResultSetExtractor());
    return lavoriEleXMisuratore;
  }

  @Override
  public LavoriEleXIndirizzo estraiLavoriEleXIndirizzo(String id) {
    String sql = "select * from lavori_ele_x_indirizzo where id = " + id;
    LavoriEleXIndirizzo lavoriEleXIndirizzo = jdbcTemplateSalesgate.query(sql, new LavoriEleXIndirizzoJdbcHandler().getResultSetExtractor());
    return lavoriEleXIndirizzo;
  }

  @Override
  public LavoriEleXCliente estraiLavoriEleXCliente(String id) {
    String sql = "select * from lavori_ele_x_cliente where id = " + id;
    LavoriEleXCliente lavoriEleXCliente = jdbcTemplateSalesgate.query(sql, new LavoriEleXClienteJdbcHandler().getResultSetExtractor());
    return lavoriEleXCliente;
  }

  @Override
  public void aggiornaLavoriEle(LavoriEle pratica) {

    LavoriEleExtension lavoriEleExtension = pratica.getLavoriEleExtension();

    int nRowsClienteUsc = aggiornaLavoriEleXCliente(pratica.getLavoriEleExtension().getClienteUscente());
    int nRowsFkClienteRef = aggiornaLavoriEleXCliente(pratica.getLavoriEleExtension().getClienteReferente());
    int nRowsClienteFinale = aggiornaLavoriEleXCliente(pratica.getLavoriEleExtension().getClienteFinale());
    int nRowsClienteEsaz = aggiornaLavoriEleXCliente(pratica.getLavoriEleExtension().getClienteEsazione());

    int nRowsIndirizzoRef = aggiornaLavoriEleXIndirizzo(pratica.getLavoriEleExtension().getIndirizzoEsazione());
    int nRowsIndirizzoLegale = aggiornaLavoriEleXIndirizzo(pratica.getLavoriEleExtension().getIndirizzoLegale());
    int nRowsIndirizzoImmob = aggiornaLavoriEleXIndirizzo(pratica.getLavoriEleExtension().getIndirizzoFornitura());

    int nRowsMisuratore = aggiornaLavoriEleXMisuratore(pratica.getLavoriEleExtension().getMisuratore());
    int nRowsMisuratoreCliente = aggiornaLavoriEleXMisuratore(pratica.getLavoriEleExtension().getMisuratoreCliente());
    int nRowsMisuratoreRim = aggiornaLavoriEleXMisuratore(pratica.getLavoriEleExtension().getMisuratoreRimosso());
    int nRowsMisuratoreVen = aggiornaLavoriEleXMisuratore(pratica.getLavoriEleExtension().getMisuratoreVendita());

    int nRowsLavoriEleExtension = aggiornaLavoriEleExtension(pratica.getLavoriEleExtension());

    pratica.setVerificaEsito(new BigDecimal(0));
    String sql = "UPDATE LAVORI_ELE " + " SET CODICE_PRATICA_DL = NVL(CODICE_PRATICA_DL, ?), STATO = ?, VERIFICA_ESITO = ?" + " WHERE ID = ?";
    jdbcTemplateSalesgate.update(sql, pratica.getCodicePraticaDl(), pratica.getStato(), pratica.getVerificaEsito(), pratica.getId());

  }

  private int aggiornaLavoriEleExtension(LavoriEleExtension lge) {
    String sql = "";
    int nRows = jdbcTemplateSalesgate.update(sql);
    return nRows;
  }

  private int aggiornaLavoriEleXCliente(LavoriEleXCliente c) {
    // if (lavoriEleXCliente.getId().intValue() == 0)
    // return 0; // se ? quello di default significa che non deve essere
    // modificato
    String sql = "UPDATE LAVORI_ELE_X_CLIENTE SET NOME = ?, COGNOME  = ?, RAGIONE_SOCIALE = ?, PIVA = ?, COD_FIS = ?, TELEFONO = ?, " + " CELLULARE = ?, EMAIL = ?, FAX  = ? WHERE  ID = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, c.getNome(), c.getCognome(), c.getRagioneSociale(), c.getPiva(), c.getCodFis(), c.getTelefono(), c.getCellulare(), c.getEmail(), c.getFax(), c.getId());
    return nRows;

  }

  private int aggiornaLavoriEleXIndirizzo(LavoriEleXIndirizzo i) {
    if (i.getId().equals("0")) {
      return 0; // se ? quello di default significa che non deve essere
    }
    // modificato
    String sql = "UPDATE LAVORI_ELE_X_INDIRIZZO SET TOPONIMO = ?, VIA = ?, CIVICO= ?, SCALA = ?, PIANO = ?, INTERNO  = ?, " + "CAP = ?, ISTAT = ?, COMUNE = ?, PROVINCIA = ?, NAZIONE = ?, PRESSO = ? WHERE ID = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, i.getToponimo(), i.getVia(), i.getCivico(), i.getScala(), i.getPiano(), i.getInterno(), i.getCap(), i.getIstat(), i.getComune(), i.getProvincia(), i.getNazione(), i.getPresso(), i.getId());
    return nRows;
  }

  private int aggiornaLavoriEleXMisuratore(LavoriEleXMisuratore m) {
    if (m.getId().equals("0")) {
      return 0; // se ? quello di default significa che non deve essere
    }
    // modificato
    String sql = "";
    int nRows = jdbcTemplateSalesgate.update(sql);
    return nRows;
  }

}