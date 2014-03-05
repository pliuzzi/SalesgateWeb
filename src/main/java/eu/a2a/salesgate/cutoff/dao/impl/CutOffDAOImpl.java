package eu.a2a.salesgate.cutoff.dao.impl;

import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.cutoff.bean.CutOffItem;
import eu.a2a.salesgate.cutoff.dao.CutOffDAO;
import eu.a2a.salesgate.cutoff.dao.impl.handler.CutOffItemJdbcHandler;
import eu.a2a.salesgate.dao.handler.StringJdbcHandler;

@Repository("cutOffDaoSalesgate")
public class CutOffDAOImpl implements CutOffDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<CutOffItem> estraiAllCutOff(String stato) {

    String sql = "select distinct ad.id as id_distributore, ad.name as name_distributore, f.id, f.cod_servizio, "
        + " f.cod_flusso, f.utility, f.nome_file, f.stato_file, conta_righe, created, closed_by, closed_date"
        + " from files f, anag_dl ad " + " where ad.id = f.fk_distributore ";
    String sqlStato = " and f.stato_file = '" + stato + "'";
    if ((stato != null) && (!stato.equalsIgnoreCase("TUTTI"))) {
      sql += sqlStato;
    }
    List<CutOffItem> list = jdbcTemplateSalesgate.query(sql, new CutOffItemJdbcHandler().getRowMapper());
    return list;
    /*
     * String sqlStato = " and f.stato_file = '" + stato + "'"; String sqlUtility =
     * "select distinct utility from files f where 1=1 ";
     * 
     * 
     * if ((stato != null) && (!stato.equalsIgnoreCase("TUTTI"))) { sqlUtility += sqlStato; }
     * 
     * List<CutOffNode> list = jdbcTemplateSalesgate.query(sqlUtility, new CutOffNodeJdbcHandler().getRowMapper());
     * 
     * for (CutOffNode coNode : list) { String sqlDistributore = "select distinct ad.id, ad.name" +
     * " from files f, anag_dl ad " + " where ad.id = f.fk_distributore " + " and f.utility = '" + coNode.getUtility() +
     * "'"; if ((stato != null) && (!stato.equalsIgnoreCase("TUTTI"))) { sqlDistributore += sqlStato; } sqlDistributore
     * += " order by ad.name asc"; coNode.setListDistributore(jdbcTemplateSalesgate.query(sqlDistributore, new
     * DistributoreJdbcHandler().getRowMapper()));
     * 
     * for (Distributore distributore : coNode.getListDistributore()) { String sqlCodServizio =
     * "select distinct ar.code, ar.description" + " from files f, anag_richieste ar " +
     * " where f.cod_servizio = ar.code " + " and f.utility = '" + coNode.getUtility() + "' and fk_distributore = '" +
     * distributore.getId() + "'"; if ((stato != null) && (!stato.equalsIgnoreCase("TUTTI"))) { sqlCodServizio +=
     * sqlStato; } sqlCodServizio += " order by ar.code asc";
     * 
     * distributore.setListCodiceServizio(jdbcTemplateSalesgate.query(sqlCodServizio, new
     * CodiceServizioJdbcHandler().getRowMapper()));
     * 
     * for (CodiceServizio cs : distributore.getListCodiceServizio()) {
     * 
     * String sqlFiles =
     * "select f.id, f.cod_servizio, f.cod_flusso, f.utility, f.nome_file, f.stato_file, conta_righe, created, closed_by, closed_date"
     * + " from files f where fk_distributore = '" + distributore.getId() + "'" + " and f.cod_servizio = '" +
     * cs.getCode() + "'"; if ((stato != null) && (!stato.equalsIgnoreCase("TUTTI"))) { sqlFiles += sqlStato; } sqlFiles
     * += " order by f.created asc";
     * 
     * cs.setFiles(jdbcTemplateSalesgate.query(sqlFiles, new FilesJdbcHandler().getRowMapper())); }
     * 
     * }
     * 
     * }
     * 
     * return list;
     */

  }

  @Override
  public CutOffItem estraiCutOff(String id) {

    String sql = "select ad.id as id_distributore, ad.name as name_distributore, f.id, f.file_type, f.fk_template_ins, "
        + " f.cod_servizio, f.cod_flusso, f.utility, f.nome_file, f.stato_file, f.file_data, conta_righe, "
        + " created, closed_by, closed_date "
        + " from files f, anag_dl ad "
        + " where fk_distributore = ad.id "
        + " and f.id = ?";

    CutOffItem coi = jdbcTemplateSalesgate.query(sql, new CutOffItemJdbcHandler().getResultSetExtractor(), id);

    return coi;
  }

  @Override
  public int updateStato(String id, String statoFile) {

    String sql = "update files set stato_file = ? where id = ?";

    return jdbcTemplateSalesgate.update(sql, statoFile, id);
  }

  @Override
  public int updateFile(String id, byte[] fileData) {

    String sql = "update files set file_data = ? where id = ?";

    int nTot = jdbcTemplateSalesgate.update(sql, new Object[] { new SqlLobValue(fileData), id }, new int[] {
        Types.BLOB, Types.VARCHAR });

    return nTot;
  }

  @Override
  public List<String> estraiRequestContent(String id, String utility) {

    String sql = "select * from table(cast(EXTRACT_REQUEST_CURSOR(?, ?) as cutoff_varchar_array))";

    return jdbcTemplateSalesgate.query(sql, new StringJdbcHandler().getRowMapper(), id, utility);
  }

  @Override
  public int chiudiCutOff(String id, String closedBy) {

    String sql = "call close_cutoff_from_web(?, ?)";

    return jdbcTemplateSalesgate.update(sql, id, closedBy);
  }
}
