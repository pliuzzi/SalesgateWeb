package eu.a2a.salesgate.template.dao.impl;

import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.dao.handler.IntegerJdbcHandler;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.dao.TemplateDAO;
import eu.a2a.salesgate.template.dao.impl.handler.CampoJdbcHandler;
import eu.a2a.salesgate.template.dao.impl.handler.TemplateInstanceJdbcHandler;

@Repository("templateDaoSalesgate")
public class TemplateDAOImpl implements TemplateDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<TemplateInstance> getAllTemplate(String idDistr, String direzione) {

    String sql = "SELECT ti.id, fk_distributore, fk_cod_servizio, fk_cod_flusso, fk_utility, fk_template, colonne_totali, colonne_effettive, flag_attivo, "
        + " event_code, nome, file_content, first_row, file_type, separatore, n_max_righe, in_out, created, last_updated, af.code, af.description, "
        + " is_template, mime_type, ar.description cod_servizio_desc, afl.description cod_flusso_desc " + " FROM template_instance ti, anag_template at, anag_filetype af, anag_richieste ar, anag_flussi afl "
        + " WHERE ti.fk_template = at.id AND at.file_type = af.id and ar.code = ti.fk_cod_servizio and ar.utility = ti.fk_utility "
        + " and afl.cod_flusso = ti.fk_cod_flusso and afl.utility = ti.fk_utility and afl.nome_action <> 'INSERT_E01' " + " and ti.fk_distributore = ? and in_out = ? ";

    return jdbcTemplateSalesgate.query(sql, new TemplateInstanceJdbcHandler().getRowMapper(), idDistr, direzione);
  }

  @Override
  public int updateFileTemplate(String id, byte[] file, String fileName, String fileType) {
    String sql = "update anag_template set file_content = ?, nome = ?, file_type = ? where id = ?";

    int nTot = jdbcTemplateSalesgate.update(sql, new Object[] { new SqlLobValue(file), fileName, fileType, id }, new int[] { Types.BLOB, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR });
    return nTot;
  }

  @Override
  public TemplateInstance getFileTemplate(String id) {
    String sql = "select file_content, nome from anag_template where id = ?";
    return jdbcTemplateSalesgate.query(sql, new TemplateInstanceJdbcHandler().getResultSetExtractor(), id);
  }

  @Override
  public List<Campo> getCampiTemplateOutbound(String idTemplate) {
    String sql = "select aot.id, nome_logico, nome_fisico, categoria, posizione" + " from anag_out_type aot, template_spool_config " + " where aot.id = fk_type_outbound " + " and fk_template_instance = ? " + " order by posizione asc";
    List<Campo> list = jdbcTemplateSalesgate.query(sql, new CampoJdbcHandler().getRowMapper(), idTemplate);
    return list;
  }

  @Override
  public List<Campo> getCampiTemplateInbound(String idTemplate) {
    String sql = "select aot.id, nome_logico, nome_fisico, categoria, posizione" + " from anag_inb_type aot, template_load_config " + " where aot.id = fk_type_inbound " + " and fk_template_instance = ? " + " order by posizione asc";
    List<Campo> list = jdbcTemplateSalesgate.query(sql, new CampoJdbcHandler().getRowMapper(), idTemplate);
    return list;
  }

  @Override
  public TemplateInstance getTemplate(String idTemplate) {
    String sql = "SELECT ti.id, fk_distributore, fk_cod_servizio, fk_cod_flusso, fk_utility, fk_template, colonne_totali, colonne_effettive, flag_attivo, "
        + " event_code, nome, file_content, first_row, file_type, separatore, n_max_righe, in_out, created, last_updated, af.code, af.description, "
        + " is_template, mime_type, ar.description cod_servizio_desc, afl.description cod_flusso_desc " + " FROM template_instance ti, anag_template at, anag_filetype af, anag_richieste ar, anag_flussi afl "
        + " WHERE ti.fk_template = at.id AND at.file_type = af.id and ar.code = ti.fk_cod_servizio and ar.utility = ti.fk_utility "
        + " and afl.cod_flusso = ti.fk_cod_flusso and afl.utility = ti.fk_utility and afl.nome_action <> 'INSERT_E01' " + " and ti.id = ? ";

    return jdbcTemplateSalesgate.query(sql, new TemplateInstanceJdbcHandler().getResultSetExtractor(), idTemplate);
  }

  @Override
  public List<Campo> getCampiOutbound(String utility) {

    String sql = "select aot.id, nome_logico, nome_fisico, categoria, null posizione from anag_out_type aot where utility = ? " + " order by categoria asc, nome_logico asc";
    List<Campo> list = jdbcTemplateSalesgate.query(sql, new CampoJdbcHandler().getRowMapper(), utility);
    return list;
  }

  @Override
  public List<Campo> getCampiInbound(String utility) {
    String sql = "select aot.id, nome_logico, nome_fisico, categoria, null posizione from anag_inb_type aot where utility = ? " + " order by categoria asc, nome_logico asc";
    List<Campo> list = jdbcTemplateSalesgate.query(sql, new CampoJdbcHandler().getRowMapper(), utility);
    return list;
  }

  @Override
  public int updateTemplate(TemplateInstance ti) {
    String sql = "update anag_template set first_row = ?, separatore = ?, file_type = ?, n_max_righe = ?" + " where id = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, ti.getAnagTemplate().getFirstRow(), ti.getAnagTemplate().getSeparatore(), ti.getAnagTemplate().getFileType().getId(), ti.getAnagTemplate().getnMaxRighe(), ti.getAnagTemplate().getId());
    return nRows;
  }

  @Override
  public int deleteMapping(String idTemplate, String direzione) {
    String sql = "";
    if ("IN".equals(direzione)) {
      sql = "delete from template_load_config where fk_template_instance = ?";
    } else {
      sql = "delete from template_spool_config where fk_template_instance = ?";
    }
    int nRows = jdbcTemplateSalesgate.update(sql, idTemplate);
    return nRows;
  }

  @Override
  public int insertMapping(List<String> mapping, String idTemplate, String direzione) {
    String sqlIN = "INSERT INTO template_load_config (id, fk_template_instance, fk_type_inbound, posizione) VALUES (seq_generic.nextval, ?, ?, ?)";
    String sqlOUT = "INSERT INTO template_spool_config (id, fk_template_instance, fk_type_outbound, posizione) VALUES (seq_generic.nextval, ?, ?, ?)";
    String insert = ("IN".equals(direzione)) ? sqlIN : sqlOUT;
    int nTot = 0;
    for (int i = 0; i < mapping.size(); i++) {
      nTot += jdbcTemplateSalesgate.update(insert, idTemplate, mapping.get(i), (i + 1));
    }

    return nTot;

  }

  @Override
  public int insertTemplate(TemplateInstance ti) {
    int idAnagTemplate = jdbcTemplateSalesgate.query("select seq_template.nextval from dual", new IntegerJdbcHandler().getResultSetExtractor());
    try {
      Thread.sleep(500);
    } catch (InterruptedException e) {
    }
    int idTemplateInstance = jdbcTemplateSalesgate.query("select seq_template.nextval from dual", new IntegerJdbcHandler().getResultSetExtractor());
    ti.getAnagTemplate().setId(idAnagTemplate + "");
    ti.setId(idTemplateInstance + "");

    // sqlSessionSGUSR.insert(INSERT_ANAG_TEMPLATE, templateInstance);
    String sqlInsertAnagTemplate = "INSERT INTO ANAG_TEMPLATE (ID, FIRST_ROW, FILE_TYPE, SEPARATORE, N_MAX_RIGHE, IN_OUT, CREATED, NOME, FILE_CONTENT)" + " VALUES ( ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
    jdbcTemplateSalesgate.update(sqlInsertAnagTemplate, ti.getAnagTemplate().getId(), ti.getAnagTemplate().getFirstRow(), ti.getAnagTemplate().getFileType().getId(), ti.getAnagTemplate().getSeparatore(),
        ti.getAnagTemplate().getnMaxRighe(), ti.getAnagTemplate().getInOut(), ti.getAnagTemplate().getNomeFile(), ti.getAnagTemplate().getFileContent());
    // sqlSessionSGUSR.insert(INSERT_TEMPLATE_INSTANCE, templateInstance);
    String sqlInsertTemplateInstance = "INSERT INTO TEMPLATE_INSTANCE (ID, FK_DISTRIBUTORE, FK_COD_SERVIZIO, FK_COD_FLUSSO, FK_UTILITY, FK_TEMPLATE, " + " FLAG_ATTIVO, EVENT_CODE) VALUES (?, ?, ?, ?, ?, ?, 'Y', ?)";
    jdbcTemplateSalesgate.update(sqlInsertTemplateInstance, ti.getId(), ti.getDistributore().getId(), ti.getCodiceServizio().getCode(), ti.getCodFlusso().getId(), ti.getUtility(), ti.getAnagTemplate().getId(), ti.getEventCode());
    if ("IN".equals(ti.getAnagTemplate().getInOut())) {
      // sqlSessionSGUSR.insert(INSERT_SCHED_EVENT_SCHEDULE, templateInstance);
      String sqlInsertSchedEventSchedule = "INSERT INTO SCHED_EVENT_SCHEDULE (CD_EVENTO, PKG_NAME, TIME_POLLING, FLAG_ONOFF, PRIORITY) " + " VALUES ( '" + ti.getEventCode() + "', 'ETL_INBOUND_MASSIVO.MAIN', 1, 1, 1)";
      jdbcTemplateSalesgate.update(sqlInsertSchedEventSchedule);
      String sqlInsertEventParameters = "INSERT INTO SCHED_EVENT_PARAMETERS (CD_EVENTO, PARAM_NAME, PARAM_VALUE, DESC_EVENTO, CODICE_AUTORITY) " + " VALUES ( ?, 'TABLE', 'LAVORI', ?, ? )";
      // sqlSessionSGUSR.insert(INSERT_SCHED_EVENT_PARAMETERS,
      // templateInstance);
      jdbcTemplateSalesgate.update(sqlInsertEventParameters, ti.getEventCode(), ti.getDistributore().getName(), ti.getDistributore().getId());
    }
    return idTemplateInstance;
  }

  @Override
  public int verifyEventCode(TemplateInstance templateInstance) {
    int n = jdbcTemplateSalesgate.query("select * from template_instance where event_code = ?", new TemplateInstanceJdbcHandler().getRowMapper(), templateInstance.getEventCode()).size();
    return n;
  }

}
