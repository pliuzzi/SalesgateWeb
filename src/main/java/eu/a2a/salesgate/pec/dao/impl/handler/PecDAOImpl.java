package eu.a2a.salesgate.pec.dao.impl.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.dao.handler.StringJdbcHandler;
import eu.a2a.salesgate.pec.dao.PecDAO;

@Repository("pecDaoSalesgate")
public class PecDAOImpl extends AbstractDAO implements PecDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public String getMercatoEle(String cutOffId) {
    String sql = "SELECT MERCATO as ret_mercato FROM LAVORI_ELE le, LAVORI_ELE_EXTENSION lx WHERE le.ID    = lx.FK_LAVORI_ELE AND FK_FILES = ? ";
    return jdbcTemplateSalesgate.query(sql, new StringJdbcHandler().getResultSetExtractor(), cutOffId);
  }

  @Override
  public String getCodicePraticaUtente(String cutOffId) {
    String sql = "SELECT ID_SISTEMA_SORGENTE as ret_utente FROM (SELECT ID_SISTEMA_SORGENTE FROM LAVORI_ELE le , LAVORI_ELE_EXTENSION lx " + " WHERE le.ID    = lx.FK_LAVORI_ELE " + "   AND FK_FILES = ? " + " UNION"
        + " SELECT ID_SISTEMA_SORGENTE" + "  FROM LAVORI_GAS lg" + "    , LAVORI_GaS_EXTENSION lgx" + " WHERE lg.ID    = lgx.FK_LAVORI_GAS" + "  AND FK_FILES = ?)  ";
    return jdbcTemplateSalesgate.query(sql, new StringJdbcHandler().getResultSetExtractor(), cutOffId, cutOffId);
  }

  @Override
  public String getCodPodPdr(String cutOffId) {
    String sql = "SELECT pod_pdr as ret_utente FROM (SELECT pod pod_pdr FROM LAVORI_ELE le , LAVORI_ELE_EXTENSION lx " + " WHERE le.ID    = lx.FK_LAVORI_ELE " + "   AND FK_FILES = ? " + " UNION" + " SELECT pdr" + "  FROM LAVORI_GAS lg"
        + "    , LAVORI_GaS_EXTENSION lgx" + " WHERE lg.ID    = lgx.FK_LAVORI_GAS" + "  AND FK_FILES = ?)  ";
    return jdbcTemplateSalesgate.query(sql, new StringJdbcHandler().getResultSetExtractor(), cutOffId, cutOffId);
  }

}
