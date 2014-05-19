package eu.a2a.salesgate.files.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.files.bean.Files;
import eu.a2a.salesgate.files.dao.FilesDAO;
import eu.a2a.salesgate.files.dao.impl.handler.FilesJdbcHandler;

@Repository("filesDaoSalesgate")
public class FilesDAOImpl extends AbstractDAO implements FilesDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public Files estraiFiles(String id) {

    String sql = "SELECT NOME_FILE, STATO_FILE, FILE_DATA, CONTA_RIGHE, CLOSED_DATE, CLOSED_BY, CREATED " + " from files " + " where id = ?";

    return jdbcTemplateSalesgate.query(sql, new FilesJdbcHandler().getResultSetExtractor(), id);
  }

}
