package eu.a2a.salesgate.etl.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ch.lambdaj.Lambda;
import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.dao.handler.ListStringJdbcHandler;
import eu.a2a.salesgate.dao.handler.StringJdbcHandler;
import eu.a2a.salesgate.etl.bean.ETLInstanceItem;
import eu.a2a.salesgate.etl.bean.ETLItem;
import eu.a2a.salesgate.etl.dao.ETLDAO;
import eu.a2a.salesgate.etl.dao.impl.handler.ETLInstanceItemJdbcHandler;
import eu.a2a.salesgate.etl.dao.impl.handler.ETLItemJdbcHandler;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.bean.matcher.CampoMatcher;
import eu.a2a.salesgate.template.service.TemplateService;

@Repository("etlDaoSalesgate")
public class ETLDAOImpl extends AbstractDAO implements ETLDAO {

  Logger logger = Logger.getLogger(this.getClass());

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Autowired
  TemplateService templateServiceSalesgate;

  @Override
  public List<ETLItem> estraiAllETLItem() {

    String sql = "SELECT fk_distributore, ad.name, FK_UTILITY,FK_COD_SERVIZIO,FK_COD_FLUSSO, event_code " + " FROM TEMPLATE_INSTANCE ti, sched_event_schedule ses, anag_dl ad " + " WHERE EVENT_CODE = SES.CD_EVENTO "
        + " and ti.fk_distributore = ad.id order by fk_utility asc, ad.name asc, fk_cod_servizio asc";

    List<ETLItem> list = jdbcTemplateSalesgate.query(sql, new ETLItemJdbcHandler().getRowMapper());

    return list;
  }

  @Override
  public List<ETLInstanceItem> estraiAllInstances(String eventCode) {

    String sql = "select ser.obj_id, cd_evento, cd_stato, ses.status, file_name, SER.D_POST_TIMESTAMP, SER.D_GET_TIMESTAMP, SER.D_END_TIMESTAMP, "
        + " SER.RECORD_PROCESSATI, SER.RECORD_SCARTATI, SER.RECORD_TOTALI, SER.LINK_FILE_SCARTI, SER.FILE_SCARTI from sched_event_run ser, sched_event_status ses where ser.cd_stato = ses.obj_id  and cd_evento = '" + eventCode + "' "
        + " order by ser.obj_id desc ";

    List<ETLInstanceItem> list = jdbcTemplateSalesgate.query(sql, new ETLInstanceItemJdbcHandler().getRowMapper());

    // list = Lambda.sort(list, Lambda.on(ETLInstanceItem.class).getId());

    /*
     * String idTemplate = jdbcTemplateSalesgate.query(
     * "select id from template_instance where event_code = '" + eventCode +
     * "'", new StringJdbcHandler().getResultSetExtractor());
     * 
     * TemplateInstance ti = templateServiceSalesgate.getTemplate(idTemplate);
     * List<Campo> listCampi =
     * templateServiceSalesgate.getCampiTemplateInbound(idTemplate); listCampi =
     * Lambda.filter(new CampoMatcher(false), listCampi);
     * 
     * for (ETLInstanceItem instance : list) { instance.setCampi(listCampi);
     * String sqlValues = createSqlStaging(Lambda.sort(listCampi,
     * Lambda.on(Campo.class).getPosizione()), ti.getUtility(),
     * instance.getId());
     * instance.setValues(jdbcTemplateSalesgate.query(sqlValues, new
     * ListStringJdbcHandler().getRowMapper())); }
     */
    return list;
  }

  private String createSqlStaging(List<?> listMapping, String utility, String objId) {

    String table = "STAGING_" + utility + "_INBOUND";
    String mapping = "";
    String separatoreCampi = ", ";
    for (Object c : listMapping) {
      mapping += ((Campo) c).getNomeFisico() + separatoreCampi;
    }
    String select = "select " + mapping.substring(0, mapping.length() - separatoreCampi.length()) + " from " + table;
    select += " where fk_obj_id = " + objId;
    return select;
  }

  @Override
  public ETLInstanceItem estraiETLInstance(String eventCode, String objId) {

    String sql = "select ser.obj_id, cd_evento, cd_stato, ses.status, file_name, " + " to_char(SER.D_POST_TIMESTAMP, 'dd/mm/yyyy hh24:mi:ss') D_POST_TIMESTAMP, " + " to_char(SER.D_GET_TIMESTAMP, 'dd/mm/yyyy hh24:mi:ss') D_GET_TIMESTAMP, "
        + " to_char(SER.D_END_TIMESTAMP, 'dd/mm/yyyy hh24:mi:ss') D_END_TIMESTAMP, " + " SER.RECORD_PROCESSATI, SER.RECORD_SCARTATI, SER.RECORD_TOTALI, SER.LINK_FILE_SCARTI, SER.FILE_SCARTI "
        + " from sched_event_run ser, sched_event_status ses" + " where ser.cd_stato = ses.obj_id " + " and ser.obj_id = ? order by ser.obj_id desc ";

    ETLInstanceItem instance = jdbcTemplateSalesgate.query(sql, new ETLInstanceItemJdbcHandler().getResultSetExtractor(), objId);

    String idTemplate = jdbcTemplateSalesgate.query("select id from template_instance where event_code = '" + eventCode + "'", new StringJdbcHandler().getResultSetExtractor());

    TemplateInstance ti = templateServiceSalesgate.getTemplate(idTemplate);
    List<Campo> listCampi = templateServiceSalesgate.getCampiTemplateInbound(idTemplate);
    listCampi = Lambda.filter(new CampoMatcher(false), listCampi);

    instance.setCampi(listCampi);
    String sqlValues = createSqlStaging(Lambda.sort(listCampi, Lambda.on(Campo.class).getPosizione()), ti.getUtility(), instance.getId());
    instance.setValues(jdbcTemplateSalesgate.query(sqlValues, new ListStringJdbcHandler().getRowMapper()));

    return instance;
  }

  @Override
  public int startETL(String eventCode, String fileName, String user) {
    int idRun = 0;
    String sql = "call ETL_INBOUND_MASSIVO.start_etl(?, ?, ?, ?, ?)";
    jdbcTemplateSalesgate.update(sql, fileName, eventCode, user, null, idRun);
    return idRun;
  }
}
