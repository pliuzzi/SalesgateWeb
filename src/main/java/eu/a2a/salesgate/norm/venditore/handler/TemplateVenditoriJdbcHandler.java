package eu.a2a.salesgate.norm.venditore.handler;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.io.IOUtils;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.dao.type.impl.BooleanType;
import eu.a2a.salesgate.template.bean.AnagTemplate;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.venditori.bean.factory.VenditoriFactory;

public class TemplateVenditoriJdbcHandler extends JdbcHandler<TemplateInstance> {
	protected TemplateInstance createObjectFromResultSet(ResultSet rs) throws SQLException {
		TemplateInstance ti = new TemplateInstance();
	    if (contains("id")) {
	      ti.setId(rs.getString("id"));
	    }
	    if (contains("fk_cod_servizio") && contains("cod_servizio_desc")) {
	      ti.setCodiceServizio(new AnagRichieste(rs.getString("fk_cod_servizio"), rs.getString("cod_servizio_desc")));
	    }
	    if (contains("fk_cod_flusso") && contains("fk_cod_flusso")) {
	      ti.setCodFlusso(new AnagFlussi(rs.getString("fk_cod_flusso"), rs.getString("fk_cod_flusso")));
	    }
	    if (contains("fk_distributore")) {
	      ti.setVenditore(VenditoriFactory.newVenditore(rs.getString("fk_distributore"), null, null));
	    }
	    if (contains("fk_utility")) {
	      ti.setUtility(rs.getString("fk_utility"));
	    }
	    if (contains("colonne_totali")) {
	      ti.setColonneTotali(rs.getInt("colonne_totali"));
	    }
	    if (contains("colonne_effettive")) {
	      ti.setColonneEffettive(rs.getInt("colonne_effettive"));
	    }
	    if (contains("flag_attivo")) {
	      ti.setFlagAttivo(new BooleanType(rs.getString("flag_attivo")).fromSQL());
	    }
	    if (contains("event_code")) {
	      ti.setEventCode(rs.getString("event_code"));
	    }

	    AnagTemplate at = new AnagTemplate();
	    if (contains("fk_template")) {
	      at.setId(rs.getString("fk_template"));
	    }
	    if (contains("nome")) {
	      at.setNomeFile(rs.getString("nome"));
	    }
	    if (contains("file_content")) {
	      try {
	        InputStream is = rs.getBinaryStream("file_content");
	        if (is != null) {
	          at.setFileContent(IOUtils.toByteArray(is));
	        }
	      } catch (IOException e) {
	        at.setFileContent(null);
	        e.printStackTrace();
	      }
	    }
	    if (contains("first_row")) {
	      at.setFirstRow(rs.getInt("first_row"));
	    }
	    if (contains("separatore")) {
	      at.setSeparatore(rs.getString("separatore"));
	    }
	    if (contains("n_max_righe")) {
	      at.setnMaxRighe(rs.getInt("n_max_righe"));
	    }
	    if (contains("in_out")) {
	      at.setInOut(rs.getString("in_out"));
	    }
	    if (contains("created")) {
	      at.setCreated(rs.getDate("created"));
	    }
	    if (contains("last_updated")) {
	      at.setLastUpdated(rs.getDate("last_updated"));
	    }

	    FileType ft = new FileType();
	    if (contains("file_type")) {
	      ft.setId(rs.getString("file_type"));
	    }
	    if (contains("code")) {
	      ft.setCode(rs.getString("code"));
	    }
	    if (contains("description")) {
	      ft.setDescription(rs.getString("description"));
	    }
	    if (contains("mime_type")) {
	      ft.setMimeType(rs.getString("mime_type"));
	    }
	    if (contains("is_template")) {
	      ft.setIsTemplate(rs.getString("is_template"));
	    }

	    at.setFileType(ft);
	    ti.setAnagTemplate(at);

	    return ti;
	}
}
