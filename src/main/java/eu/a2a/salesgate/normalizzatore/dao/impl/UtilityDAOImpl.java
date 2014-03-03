package eu.a2a.salesgate.normalizzatore.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.dao.handler.IntegerJdbcHandler;
import eu.a2a.salesgate.normalizzatore.dao.UtilityDAO;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.utility.dao.impl.handler.AnagAmmissibilitaJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.AnagFlussiJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.AnagRichiesteJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.AvanzamentoFlussiJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.CampiObbligatoriJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.FileTypeJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.FlussiSalvabiliJdbcHandler;
import eu.a2a.salesgate.utility.dao.impl.handler.ParamsJdbcHandler;

@Repository("utilityDaoSdm")
public class UtilityDAOImpl implements UtilityDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSdm;

  @Override
  public List<AnagAmmissibilita> getAllAnagAmmissibilita(String id) {
    String sql = "select * from anag_ammissibilita ";
    if (id != null)
      sql += " where id = " + id;
    return jdbcTemplateSdm.query(sql, new AnagAmmissibilitaJdbcHandler().getRowMapper());
  }

  @Override
  public AnagAmmissibilita getAnagAmmissibilita(String id) {

    return getAllAnagAmmissibilita(id).size() > 0 ? getAllAnagAmmissibilita(id).get(0) : null;
  }

  @Override
  public List<FlussiSalvabili> getAllFlussiSalvabili(LavoriGas pratica) {
    String sql = "select distinct cod_flusso_acc, AF.DESCRIPTION" + " from CONFIG_STATI_FLUSSI csf, anag_flussi af "
        + " where CSF.COD_FLUSSO_ACC = AF.COD_FLUSSO " + " and CSF.COMMODITY = AF.UTILITY "
        + " and CSF.FLAG_STATO_FINALE = 'Y' " + " and cod_servizio in ('DEFAULT', ?) " + " and cod_flusso_att = ? "
        + " and stato_pratica_att = ? " + " and NVL(commodity, 'DEFAULT') in ('DEFAULT', ?) "
        + " and cod_flusso_acc not in ('XXX', '0200', '0600', '0999', '0210', '8150', '8101', '8102')";
    return jdbcTemplateSdm.query(sql, new FlussiSalvabiliJdbcHandler().getRowMapper(), pratica.getCodServizio(),
        pratica.getCodFlusso(), pratica.getStato(), pratica.getUtility());
  }

  @Override
  public List<CampiObbligatori> getAllCampiObbligatori(LavoriGas pratica) {
    String sql = "SELECT distinct CAMPO, ALERT FROM ANAG_VERIFICA_ESITO ave " + " where 1=1 "
        + " and piva_dl in ('00000000000', '" + pratica.getDistributore().getPiva() + "') " + " and fk_anag_ric_id = '"
        + pratica.getCodServizio() + "' " + " and fk_anag_ric_utl = '" + pratica.getUtility() + "' "
        + " and cod_flusso = '" + pratica.getCodFlusso() + "' " + " and obbligatorio = 'Y'";
    List<CampiObbligatori> list = jdbcTemplateSdm.query(sql, new CampiObbligatoriJdbcHandler().getRowMapper());
    return list;
  }

  @Override
  public AvanzamentoFlussi estraiAvanzamentoFlussi(LavoriGas pratica) {
    String sql = "SELECT FK_PRATICA, FK_LAVORI, COD_SERVIZIO, COMMODITY, COD_FLUSSO, STATO, FLAG_STATO, NUM_REINVIO, CREATED, LAST_UPDATED "
        + " FROM AVANZAMENTO_FLUSSI " + " where fk_pratica = '" + pratica.getId() + "'";

    return jdbcTemplateSdm.query(sql, new AvanzamentoFlussiJdbcHandler().getResultSetExtractor());
  }

  @Override
  public int aggiornaAvanzamentoFlussi(LavoriGas pratica) {
    String sql = "update avanzamento_flussi set cod_flusso = '" + pratica.getAvanzamentoFlussi().getCodFlusso()
        + "', stato = '" + pratica.getAvanzamentoFlussi().getStato() + "', flag_stato = '"
        + pratica.getAvanzamentoFlussi().getFlagStato() + "' " + " where fk_pratica = '" + pratica.getId() + "'";
    return jdbcTemplateSdm.update(sql);
  }

  @Override
  public List<Params> getParams(String category) {
    List<Params> list = jdbcTemplateSdm.query("SELECT ID, NAME, VALUE, CATEGORY FROM PARAMS where category = ?",
        new ParamsJdbcHandler().getRowMapper(), category);

    return list;
  }

  @Override
  public List<FileType> getFileTypes(String isTemplate) {

    String sql = "select id, code, description, mime_type, is_template from anag_filetype where is_template = ?";

    List<FileType> list = jdbcTemplateSdm.query(sql, new FileTypeJdbcHandler().getRowMapper(), isTemplate);

    return list;
  }

  @Override
  public FileType getFileType(String mimeType) {
    String sql = "select id, code, description, mime_type, is_template from anag_filetype where mime_type = ? and is_template = 'SI'";

    FileType ft = jdbcTemplateSdm.query(sql, new FileTypeJdbcHandler().getResultSetExtractor(), mimeType);

    return ft;
  }

  @Override
  public Integer getSeqGenericNextVal() {

    String sql = "select seq_generic.nextval from dual";

    return jdbcTemplateSdm.query(sql, new IntegerJdbcHandler().getResultSetExtractor());
  }

  @Override
  public List<AnagRichieste> getAnagRichieste(String utility) {
    String sql = "select id, description, code, utility, flag_risottomissione, flag_sg, flag_matrice, flag_semaforo, flag_compatibilita "
        + " from anag_richieste " + " where utility = '" + utility + "'" + " and flag_sg = 'Y'";
    return jdbcTemplateSdm.query(sql, new AnagRichiesteJdbcHandler().getRowMapper());
  }

  @Override
  public List<AnagFlussi> getAnagFlussi(String utility, String direzione) {
    String sql = "select cod_flusso, description, utility, gruppo_procedure, nome_action, direzione "
        + " from anag_flussi " + " where direzione = decode('" + direzione + "', 'IN', 'INBOUND', 'OUTBOUND') "
        + " and utility = '" + utility + "'";
    return jdbcTemplateSdm.query(sql, new AnagFlussiJdbcHandler().getRowMapper());
  }

}
