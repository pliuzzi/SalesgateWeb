package eu.a2a.salesgate.utility.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.pratiche.beans.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.beans.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.beans.CampiObbligatori;
import eu.a2a.salesgate.pratiche.beans.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGas;
import eu.a2a.salesgate.utility.dao.UtilityDAO;
import eu.a2a.salesgate.utility.dao.impl.handler.CampiObbligatoriJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.ParamsJdbcHandler;

@Component
public class UtilityDAOImpl implements UtilityDAO {

  private final static String SELECT_ALL_ANAG_AMMISSIBILITA = "selectAllAnagAmmissibilita";
  private final static String SELECT_ANAG_AMMISSIBILITA = "selectAnagAmmissibilita";

  private final static String SELECT_ALL_FLUSSI_SALVABILI = "selectAllFlussiSalvabili";
  private final static String SELECT_ALL_FLUSSI = "selectAllAnagFlussi";
  private final static String SELECT_ALL_RICHIESTE = "selectAllAnagRichieste";

  private final static String SELECT_ALL_CAMPI_OBBLIGATORI = "selectCampiObbligatori";

  private final static String SELECT_AVANZAMENTO_FLUSSI = "selectAvanzamentoFlussi";
  private final static String UPDATE_AVANZAMENTO_FLUSSI = "updateAvanzamentoFlussi";

  private final static String SELECT_PARAMS = "selectParams";
  private final static String SELECT_FILE_TYPES = "selectFileTypes";
  private final static String SELECT_FILE_TYPE = "selectFileType";

  @Autowired
  JdbcTemplate jdbcTemplate;

  @Override
  public List<AnagAmmissibilita> getAllAnagAmmissibilita() {
    return null;// sqlSessionSGUSR.selectList(SELECT_ALL_ANAG_AMMISSIBILITA);
  }

  @Override
  public AnagAmmissibilita geAnagAmmissibilita(String id) {
    return null;// sqlSessionSGUSR.selectOne(SELECT_ANAG_AMMISSIBILITA, id);
  }

  @Override
  public List<FlussiSalvabili> getAllFlussiSalvabili(LavoriGas pratica) {
    return null;// sqlSessionSGUSR.selectList(SELECT_ALL_FLUSSI_SALVABILI,
    // pratica);
  }

  @Override
  public List<CampiObbligatori> getAllCampiObbligatori(LavoriGas pratica) {
    String sql = "SELECT distinct CAMPO, ALERT FROM ANAG_VERIFICA_ESITO ave " + " where 1=1 " + " and piva_dl in ('00000000000', '" + pratica.getDistributore().getPiva() + "') " + " and fk_anag_ric_id = '" + pratica.getCodServizio() + "' "
        + " and fk_anag_ric_utl = '" + pratica.getUtility() + "' " + " and cod_flusso = '" + pratica.getCodFlusso() + "' " + " and obbligatorio = 'Y'";
    List<CampiObbligatori> list = jdbcTemplate.query(sql, new CampiObbligatoriJdbcHandler().getRowMapper());
    return list;
  }

  @Override
  public AvanzamentoFlussi estraiAvanzamentoFlussi(LavoriGas pratica) {
    return null;// sqlSessionSGUSR.selectOne(SELECT_AVANZAMENTO_FLUSSI,
    // pratica);
  }

  @Override
  public int aggiornaAvanzamentoFlussi(LavoriGas pratica) {
    String sql = "update avanzamento_flussi set cod_flusso = '" + pratica.getAvanzamentoFlussi().getCodFlusso() + "', stato = '" + pratica.getAvanzamentoFlussi().getStato() + "', flag_stato = '" + pratica.getAvanzamentoFlussi().getFlagStato() + "' "
        + " where fk_pratica = '" + pratica.getId() + "'";
    return jdbcTemplate.update(sql);
  }

  @Override
  public List<Params> getParams(String category) {
    List<Params> list = jdbcTemplate.query("SELECT ID, NAME, VALUE, CATEGORY FROM PARAMS where category = ?", new ParamsJdbcHandler().getRowMapper(), category);

    return list;// sqlSessionSGUSR.selectList(SELECT_PARAMS, category);
  }

  @Override
  public List<FileType> getFileTypes(String isTemplate) {
    return null;// sqlSessionSGUSR.selectList(SELECT_FILE_TYPES,
    // isTemplate);
  }

  @Override
  public FileType getFileType(String mimeType) {
    return null;// sqlSessionSGUSR.selectOne(SELECT_FILE_TYPE, mimeType);
  }

  @Override
  public BigDecimal getSeqGenericNextVal() {

    String sql = "select seq_generic.nextval from dual";

    return null;// sqlSessionSGUSR.selectOne(SELECT_SEQ_GENERIC);
  }

  @Override
  public List<AnagRichieste> getAnagRichieste(String utility) {
    Map<String, String> map = new HashMap<>();
    map.put("utility", utility);

    return null;// sqlSessionSGUSR.selectList(SELECT_ALL_RICHIESTE, map);
  }

  @Override
  public List<AnagFlussi> getAnagFlussi(String utility, String direzione) {
    Map<String, String> map = new HashMap<>();
    map.put("utility", utility);
    map.put("direzione", direzione);
    return null;// sqlSessionSGUSR.selectList(SELECT_ALL_FLUSSI, map);
  }

}
