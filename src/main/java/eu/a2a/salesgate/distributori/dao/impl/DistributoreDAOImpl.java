package eu.a2a.salesgate.distributori.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.dao.type.impl.BooleanType;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.bean.ServizioCanale;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;
import eu.a2a.salesgate.distributori.bean.factory.DistributoreFactory;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.distributori.dao.impl.handler.DistributoreJdbcHandler;
import eu.a2a.salesgate.distributori.dao.impl.handler.ServizioCanaleJdbcHandler;
import eu.a2a.salesgate.distributori.dao.impl.handler.ServizioPECJdbcHandler;

@Repository("distributoreDaoSalesgate")
public class DistributoreDAOImpl implements DistributoreDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<Distributore> getAllDistributori(Distributore distributore) {

    String sql = "SELECT ID, NAME, PIVA, UTILITY, REFERENTE, TEL_REFERENTE, EMAIL_REFERENTE, PEC, SITO_WEB, FLAG_ADEMPIENTE_147, " + " DATA_ADEMPIENTE, FLAG_ATTIVO,  FLAG_NOTIFICA_SWO, FLAG_RUC, FLAG_ATTIVO, LAST_UPDATED_FLG_SWO, "
        + " LAST_UPDATED_FLG_RUC FROM ANAG_DL" + " WHERE 1=1 ";
    if (!StringUtils.isEmpty(distributore.getId())) {
      sql += " AND id = '" + distributore.getId() + "'";
    }
    if (!StringUtils.isEmpty(distributore.getName())) {
      sql += " AND lower(name) like '%" + distributore.getName() + "%'";
    }
    if (!StringUtils.isEmpty(distributore.getPiva())) {
      sql += " AND piva = '" + distributore.getPiva() + "'";
    }
    if (!StringUtils.isEmpty(distributore.getUtility())) {
      sql += " AND utility = '" + distributore.getUtility() + "'";
    }
    sql += " order by name asc, id asc";

    List<Distributore> list = jdbcTemplateSalesgate.query(sql, new DistributoreJdbcHandler().getRowMapper());

    return list;

  }

  @Override
  public Distributore getDistributore(String codiceAutority) {

    Distributore distributore = getAllDistributori(DistributoreFactory.newDistributore(codiceAutority, null, null)).get(0);
    String sqlPec = "SELECT csp.fk_distr, csp.id, csp.cod_servizio, csp.ora_inizio, csp.pec_from_mail, csp.pec_from_password, csp.pec_from_username, csp.pec_to_mail, csp.subject, csp.tempo_reinvio, ar.description "
        + " FROM config_servizio_pec csp, anag_richieste ar " + " WHERE ar.code = csp.cod_servizio and ar.utility = csp.utility and csp.fk_distr = ?";
    distributore.setListServizioPEC(jdbcTemplateSalesgate.query(sqlPec, new ServizioPECJdbcHandler().getRowMapper(), codiceAutority));

    String sqlCanali = "SELECT arc.id, arc.flag_canale, p.name desc_canale, arc.cod_servizio, ar.description desc_servizio " + " FROM anag_richieste_canale arc, params p, anag_richieste ar "
        + " WHERE arc.flag_canale = p.VALUE AND arc.cod_servizio = ar.code AND arc.utility = ar.utility AND p.category = 'CHANNELS' AND arc.fk_anag_dl = ?";
    distributore.setListServizioCanale(jdbcTemplateSalesgate.query(sqlCanali, new ServizioCanaleJdbcHandler().getRowMapper(), codiceAutority));

    return distributore;
  }

  @Override
  public int updateDistributore(Distributore distributore) {
    int nRows = 0;

    String sql = "UPDATE ANAG_DL " + " SET NAME = ?, PIVA = ?, REFERENTE = ?, TEL_REFERENTE = ?, EMAIL_REFERENTE = ?, PEC = ?, SITO_WEB = ?, FLAG_NOTIFICA_SWO = ?, FLAG_RUC = ? " + " WHERE ID = ? ";
    nRows = jdbcTemplateSalesgate.update(sql, distributore.getName(), distributore.getPiva(), distributore.getReferente(), distributore.getTelReferente(), distributore.getEmailReferente(), distributore.getPec(), distributore.getSitoWeb(),
        new BooleanType(distributore.getFlagNotificaSwo()).toSQL(), new BooleanType(distributore.getFlagRuc()).toSQL(), distributore.getId());

    return nRows;
  }

  @Override
  public int updateCanali(Distributore distributore) {
    Iterator<ServizioCanale> iterator = distributore.getListServizioCanale().iterator();
    int nRows = 0;
    String sql = "UPDATE ANAG_RICHIESTE_CANALE SET FLAG_CANALE  = ? WHERE ID = ?";
    while (iterator.hasNext()) {
      ServizioCanale canale = iterator.next();
      nRows += jdbcTemplateSalesgate.update(sql, canale.getCanale().getId(), canale.getId());
    }
    return nRows;
  }

  @Override
  public int updatePEC(ServizioPEC pec) {
    int nRows = 0;// sqlSessionSGUSR.update(UPDATE_PEC, pec);
    String sql = "UPDATE CONFIG_SERVIZIO_PEC " + " SET PEC_FROM_MAIL = ?, PEC_FROM_USERNAME = ?, PEC_FROM_PASSWORD = ?, PEC_TO_MAIL = ?, SUBJECT = ?, ORA_INIZIO = ?, TEMPO_REINVIO = ? " + " WHERE ID = ?";
    nRows = jdbcTemplateSalesgate.update(sql, pec.getPecFrom(), pec.getPecUsername(), pec.getPecPassword(), pec.getPecTo(), pec.getSubject(), pec.getOraInizio(), pec.getTempoReinvio(), pec.getId());
    return nRows;
  }

  @Override
  public ServizioPEC getPEC(String id_pec) {

    String sql = "SELECT ID, null description, FK_DISTR, COD_SERVIZIO, PEC_FROM_MAIL, PEC_FROM_USERNAME, PEC_FROM_PASSWORD, PEC_TO_MAIL, SUBJECT, UTILITY, LAST_UPDATED, ORA_INIZIO, TEMPO_REINVIO, ATTIVO, ULTIMO_INVIO FROM CONFIG_SERVIZIO_PEC where id = ?";

    return jdbcTemplateSalesgate.query(sql, new ServizioPECJdbcHandler().getResultSetExtractor(), id_pec);// sqlSessionSGUSR.selectOne(SELECT_PEC,
    // id_pec);

  }

  @Override
  public ServizioPEC getPEC(String codiceAutority, String codServizio) {

    String sql = "SELECT ID, null description, FK_DISTR, COD_SERVIZIO, PEC_FROM_MAIL, PEC_FROM_USERNAME, PEC_FROM_PASSWORD, PEC_TO_MAIL, SUBJECT, UTILITY, LAST_UPDATED, ORA_INIZIO, TEMPO_REINVIO, ATTIVO, ULTIMO_INVIO FROM CONFIG_SERVIZIO_PEC where fk_distr = ? and cod_servizio = ?";

    return jdbcTemplateSalesgate.query(sql, new ServizioPECJdbcHandler().getResultSetExtractor(), codiceAutority, codServizio);// sqlSessionSGUSR.selectOne(SELECT_PEC,
    // id_pec);

  }

  @Override
  public int verifyIdDistributore(String id) {
    return getAllDistributori(DistributoreFactory.newDistributore(id, null, null)).size();
  }

  @Override
  public int verifyPivaDistributore(String piva) {
    return getAllDistributori(DistributoreFactory.newDistributore(null, null, piva)).size();
  }

  @Override
  public int insertNewDistributore(Distributore distributore) {
    int nRowsDistributore = 0;// sqlSessionSGUSR.insert(INSERT_DISTRIBUTORE,
                              // distributore);
    int nRowsCanali = 0;// sqlSessionSGUSR.insert(INSERT_CANALI, distributore);
    int nRowsPec = 0;// sqlSessionSGUSR.insert(INSERT_PEC, distributore);

    String sqlInsertDistributore = "INSERT INTO ANAG_DL " + " (ID, NAME, PIVA, UTILITY, REFERENTE, TEL_REFERENTE, EMAIL_REFERENTE, PEC, SITO_WEB, FLAG_ATTIVO, FLAG_NOTIFICA_SWO, FLAG_RUC, LAST_UPDATED_FLG_SWO, LAST_UPDATED_FLG_RUC) "
        + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Y', ?, ?, sysdate, sysdate )";
    nRowsDistributore = jdbcTemplateSalesgate.update(sqlInsertDistributore, distributore.getId(), distributore.getName(), distributore.getPiva(), distributore.getUtility(), distributore.getReferente(), distributore.getTelReferente(),
        distributore.getEmailReferente(), distributore.getPec(), distributore.getSitoWeb(), new BooleanType(distributore.getFlagNotificaSwo()).toSQL(), new BooleanType(distributore.getFlagRuc()).toSQL());

    String sqlInsertCanali = "INSERT INTO ANAG_RICHIESTE_CANALE (ID, UTILITY, FK_ANAG_DL, FLAG_CANALE, COD_SERVIZIO)" + " (select seq_generic.nextval, ?, ?, '-1', code from anag_richieste where utility = ? and flag_sg = 'Y')";
    nRowsCanali = jdbcTemplateSalesgate.update(sqlInsertCanali, distributore.getUtility(), distributore.getId(), distributore.getUtility());

    String sqlInsertPEC = "INSERT INTO CONFIG_SERVIZIO_PEC (ID, FK_DISTR, COD_SERVIZIO, UTILITY, ATTIVO)" + " (select seq_generic.nextval, ?, code, ?, 'Y' from anag_richieste where utility = ? and flag_sg = 'Y')";
    nRowsPec = jdbcTemplateSalesgate.update(sqlInsertPEC, distributore.getId(), distributore.getUtility(), distributore.getUtility());

    return nRowsDistributore + nRowsCanali + nRowsPec;
  }

}
