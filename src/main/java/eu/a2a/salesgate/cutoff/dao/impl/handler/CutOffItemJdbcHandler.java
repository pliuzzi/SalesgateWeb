package eu.a2a.salesgate.cutoff.dao.impl.handler;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.io.IOUtils;

import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.cutoff.bean.CutOffItem;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.distributori.bean.factory.DistributoreFactory;
import eu.a2a.salesgate.files.bean.Files;

public class CutOffItemJdbcHandler extends JdbcHandler<CutOffItem> {

  @Override
  protected CutOffItem createObjectFromResultSet(ResultSet rs) throws SQLException {

    CutOffItem coi = new CutOffItem();
    coi.setDistributore(DistributoreFactory.newDistributore(rs.getString("id_distributore"), rs.getString("name_distributore"), null));
    coi.setServizio(new AnagRichieste(rs.getString("cod_servizio"), null));
    coi.setUtility(rs.getString("utility"));
    Files file = new Files();
    file.setId(rs.getString("id"));
    file.setNomeFile(rs.getString("NOME_FILE"));
    file.setStatoFile(rs.getString("STATO_FILE"));
    if (contains("fk_template_ins")) {
      file.setFkTemplateInstance(rs.getString("fk_template_ins"));
    }
    file.setUtility(rs.getString("utility"));
    if (contains("file_type")) {
      file.setTipoFile(rs.getString("file_type"));
    }
    if (contains("cod_flusso")) {
      file.setCodiceFlusso(rs.getString("cod_flusso"));
    }
    if (contains("FILE_DATA")) {
      try {
        InputStream is = rs.getBinaryStream("FILE_DATA");
        if (is != null) {
          file.setFileData(IOUtils.toByteArray(is));
        }
      } catch (IOException e) {
        file.setFileData(null);
        e.printStackTrace();
      }
    }
    file.setContaRighe(rs.getInt("CONTA_RIGHE"));
    file.setClosedDate(rs.getDate("CLOSED_DATE"));
    file.setClosedBy(rs.getString("CLOSED_BY"));
    file.setCreated(rs.getDate("CREATED"));

    coi.setFiles(file);

    return coi;
  }

}
