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
import eu.a2a.salesgate.cutoff.dao.impl.handler.PraticaCutOffJdbcHandler;
import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.dao.handler.StringJdbcHandler;

@Repository("cutOffDaoSalesgate")
public class CutOffDAOImpl extends AbstractDAO implements CutOffDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<CutOffItem> estraiAllCutOff(String stato, String canale) {

    String sql = "select distinct ad.id as id_distributore, ad.name as name_distributore, f.id, f.cod_servizio, "
        + " f.cod_flusso, f.utility, f.nome_file, f.stato_file, conta_righe, created, closed_by, closed_date, arc.flag_canale cod_canale, p.name desc_canale " + " from files f, anag_dl ad, anag_richieste_canale arc, params p "
        + " where ad.id = f.fk_distributore " + " and fk_distributore = arc.fk_anag_dl" + " and f.cod_servizio = arc.cod_servizio" + " and f.utility = arc.utility" + " and p.value = arc.flag_canale " + " and p.category = 'CHANNELS' ";
    String sqlStato = " and f.stato_file = '" + stato + "'";
    String sqlCanale = " and upper(p.name) = '" + canale.toUpperCase() + "'";
    if ((stato != null) && (!stato.equalsIgnoreCase("TUTTI"))) {
      sql += sqlStato;
    }
    if ((canale != null) && (!canale.equalsIgnoreCase("TUTTI"))) {
      sql += sqlCanale;
    }
    sql += "order by f.created desc";
    List<CutOffItem> list = jdbcTemplateSalesgate.query(sql, new CutOffItemJdbcHandler().getRowMapper());
    return list;
  }

  @Override
  public CutOffItem estraiCutOff(String id) {

    String sql = "select ad.id as id_distributore, ad.name as name_distributore, f.id, f.file_type, f.fk_template_ins, " + " f.cod_servizio, f.cod_flusso, f.utility, f.nome_file, f.stato_file, f.file_data, conta_righe, "
        + " created, closed_by, closed_date, arc.flag_canale cod_canale, p.name desc_canale  " + " from files f, anag_dl ad, anag_richieste_canale arc, params p " + " where fk_distributore = ad.id " + " and f.id = ?"
        + " and fk_distributore = arc.fk_anag_dl" + " and f.cod_servizio = arc.cod_servizio" + " and f.utility = arc.utility" + " and p.value = arc.flag_canale " + " and p.category = 'CHANNELS' ";
    ;

    CutOffItem coi = jdbcTemplateSalesgate.query(sql, new CutOffItemJdbcHandler().getResultSetExtractor(), id);

    String sqlPratiche = "select id, id_sistema_sorgente, pod, mercato, stato, le.created ";
    sqlPratiche += " from lavori_ele l, lavori_ele_extension le where l.id = le.fk_lavori_ele ";
    sqlPratiche += " and le.fk_files = " + id;
    sqlPratiche += " union ";
    sqlPratiche += " select id, id_sistema_sorgente, pdr, null, stato, lg.created ";
    sqlPratiche += " from lavori_gas l, lavori_gas_extension lg where l.id = lg.fk_lavori_gas ";
    sqlPratiche += " and lg.fk_files = " + id;

    coi.setPratiche(jdbcTemplateSalesgate.query(sqlPratiche, new PraticaCutOffJdbcHandler().getRowMapper()));

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

    int nTot = jdbcTemplateSalesgate.update(sql, new Object[] { new SqlLobValue(fileData), id }, new int[] { Types.BLOB, Types.VARCHAR });

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
