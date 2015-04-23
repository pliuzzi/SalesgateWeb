package eu.a2a.salesgate.motivazioni.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;
import eu.a2a.salesgate.motivazioni.bean.factory.MotivazioneFactory;
import eu.a2a.salesgate.motivazioni.bean.factory.MotivazioneVenditoreFactory;
import eu.a2a.salesgate.motivazioni.dao.MotivazioneDAO;
import eu.a2a.salesgate.motivazioni.dao.impl.handler.MotivazioneJdbcHandler;
import eu.a2a.salesgate.motivazioni.dao.impl.handler.MotivazioneVenditoreJdbcHandler;

@Repository("motivazioneDaoSalesgate")
public class MotivazioneDAOImpl extends AbstractDAO implements MotivazioneDAO {
	@Autowired
	JdbcTemplate jdbcTemplateSalesgate;
	
	@Override
	public List<Motivazione> getAllMotivazioni(Motivazione motivazione) {
		String sql = "SELECT F.ID, F.MOTIVAZIONE_DISTRIBUTORE, G.CODICE_CAUSALE, F.CODICE_INTERNO, G.ID AS ID_VENDITORE, G.MOTIVAZIONE AS MOTIVAZIONE_VENDITORE, F.ATTIVO FROM TRANSC_MOTIV_INAMM_SWV F, ANAG_CAUSALI_SWV G WHERE F.CODICE_INTERNO = G.CODICE_CAUSALE ";
		if (!StringUtils.isEmpty(motivazione.getId())) {
			sql += " AND F.ID = '" + motivazione.getId() + "'";
		}
		
		if (!StringUtils.isEmpty(motivazione.getCodiceCausale())) {
			sql += " AND F.CODICE_INTERNO = '" + motivazione.getCodiceCausale() + "'";
		}
		
		if(!StringUtils.isEmpty(motivazione.getAttivo())) {
			sql += " AND F.ATTIVO = '" + motivazione.getAttivo() + "'";
		}
		
		if(!StringUtils.isEmpty(motivazione.getMotivazioneDistributore())) {
			sql += " AND UPPER(TRIM(F.MOTIVAZIONE_DISTRIBUTORE)) LIKE ('%' || UPPER(TRIM('" + motivazione.getMotivazioneDistributore() + "')) || '%')";
		}
		
		if(motivazione.getMotivazioneVenditore() != null) {
			if (!StringUtils.isEmpty(motivazione.getMotivazioneVenditore().getMotivazione())) {
				sql += " AND UPPER(TRIM(G.MOTIVAZIONE)) LIKE ('%' || UPPER(TRIM('" + motivazione.getMotivazioneVenditore().getMotivazione() + "')) || '%')";
			}
		}
		sql += " ORDER BY F.ID";
		List<Motivazione> list = jdbcTemplateSalesgate.query(sql, new MotivazioneJdbcHandler().getRowMapper());
		return list;
	}
	
	@Override
	public Motivazione getMotivazione(String id) {
		Motivazione motivazione = getAllMotivazioni(MotivazioneFactory.newMotivazione(id, null, null, null, null, null)).get(0);
		return motivazione;
	}
	
	@Override
	public int updateMotivazione(Motivazione motivazione) {
		int nRows = 0;
		String sql = "UPDATE TRANSC_MOTIV_INAMM_SWV SET MOTIVAZIONE_DISTRIBUTORE = ?, CODICE_INTERNO = ?, ATTIVO = ? WHERE ID = ?";
		nRows = jdbcTemplateSalesgate.update(sql, motivazione.getMotivazioneDistributore(), motivazione.getCodiceCausale(), motivazione.getAttivo(), motivazione.getId());
		return nRows;
	}
	
	@Override
	public int insertNewMotivazione(Motivazione motivazione) {
		int nRows = 0;
		int maxId = getMaxId();
		maxId++;
		//String getMaxId = "SELECT MAX(ID) AS MAX_ID FROM TRANSC_MOTIV_INAMM_SWV";
		String sql = "INSERT INTO TRANSC_MOTIV_INAMM_SWV (ID, MOTIVAZIONE_DISTRIBUTORE, CODICE_INTERNO, ATTIVO) VALUES (?, ?, ?, ?)";
		//maxId = jdbcTemplateSalesgate.queryForInt(getMaxId);
		nRows = jdbcTemplateSalesgate.update(sql,maxId, motivazione.getMotivazioneDistributore(), motivazione.getCodiceCausale(), "Y");
		return nRows;
	}
	
	@Override
	public int getMaxId() {
		int maxId = 0;
		String query = "SELECT MAX(ID) AS MAX_ID FROM TRANSC_MOTIV_INAMM_SWV";
		maxId = jdbcTemplateSalesgate.queryForObject(query, Integer.class);
		return maxId;
	}
	
	@Override
	public List<MotivazioneVenditore> getAllMotivazioniVendita(MotivazioneVenditore motivazioneVendita) {
		String query = "SELECT ID, CODICE_CAUSALE, MOTIVAZIONE FROM ANAG_CAUSALI_SWV WHERE 1 = 1 ";
		if(!StringUtils.isEmpty(motivazioneVendita.getId())) {
			query += " AND ID = '" + motivazioneVendita.getId() + "'";
		}
		
		if(!StringUtils.isEmpty(motivazioneVendita.getCodiceInterno())) {
			query += " AND CODICE_CAUSALE = '" + motivazioneVendita.getCodiceInterno() + "'";
		}
		query += " ORDER BY ID";
		List<MotivazioneVenditore> list = jdbcTemplateSalesgate.query(query, new MotivazioneVenditoreJdbcHandler().getRowMapper());
		return list;
	}
	
	@Override
	public MotivazioneVenditore getMotivazioneVendita(String id) {
		MotivazioneVenditore motivazioneVendita = getAllMotivazioniVendita(MotivazioneVenditoreFactory.newMotivazioneVenditore(id, null, null)).get(0);
		return motivazioneVendita;
	}
	
	@Override
	public int updateMotivazioneVendita(MotivazioneVenditore motivazioneVendita) {
		int nRows = 0;
		String query = "UPDATE ANAG_CAUSALI_SWV SET MOTIVAZIONE = ? WHERE CODICE_CAUSALE = ?";
		String query2 = "UPDATE ANAG_AMMISSIBILITA SET DESCRIPTION = ? WHERE CODICE = ?";
		nRows = jdbcTemplateSalesgate.update(query, motivazioneVendita.getMotivazione(), motivazioneVendita.getCodiceInterno());
		jdbcTemplateSalesgate.update(query2, motivazioneVendita.getMotivazione(), motivazioneVendita.getCodiceInterno());
		return nRows;
	}
	
	@Override
	public int insertNewMotivazioneVendita(MotivazioneVenditore motivazioneVendita) {
		int nRows = 0;
		int maxId = getMaxIdVendita();
		int maxIdAnagAmmissibilita = getMaxIdAnagAmmissibilita();
		String query = "INSERT INTO ANAG_CAUSALI_SWV (ID, CODICE_CAUSALE, MOTIVAZIONE) VALUES (?, ?, ?)";
		String query2 = "INSERT INTO ANAG_AMMISSIBILITA (ID, DESCRIPTION, UTILITY, CODICE, ESITO) VALUES (?, ?, ?, ?, ?)";
		maxId++;
		maxIdAnagAmmissibilita++;
		nRows = jdbcTemplateSalesgate.update(query, maxId, motivazioneVendita.getCodiceInterno(), motivazioneVendita.getMotivazione());
		jdbcTemplateSalesgate.update(query2,maxIdAnagAmmissibilita, motivazioneVendita.getMotivazione(), "GAS", motivazioneVendita.getCodiceInterno(), "0");
		maxIdAnagAmmissibilita++;
		jdbcTemplateSalesgate.update(query2,maxIdAnagAmmissibilita, motivazioneVendita.getMotivazione(), "ELE", motivazioneVendita.getCodiceInterno(), "0");
		return nRows;
	}
	
	@Override
	public int getMaxIdVendita() {
		int maxId = 0;
		String query = "SELECT MAX(ID) AS MAX_ID FROM ANAG_CAUSALI_SWV";
		maxId = jdbcTemplateSalesgate.queryForObject(query, Integer.class);
		return maxId;
	}
	
	public int getMaxIdAnagAmmissibilita() {
		int maxId = 0;
		String query = "SELECT MAX(ID) AS MAX_ID FROM ANAG_AMMISSIBILITA";
		maxId = jdbcTemplateSalesgate.queryForObject(query, Integer.class);
		return maxId;
	}
	
	@Override
	public int verifyCdCausale(String codiceCausale) {
		return getAllMotivazioniVendita(MotivazioneVenditoreFactory.newMotivazioneVenditore(null, codiceCausale, null)).size();
	}
	
	@Override
	public boolean verifyUser(String user) {
		int nRow = 0;
		String query = "SELECT COUNT(*) FROM USER_CAUSALI_INAMMISSIBILITA WHERE LOGIN_NAME = '" + user + "'";
		nRow = jdbcTemplateSalesgate.queryForObject(query, Integer.class);
		if (nRow != 0) {
			return true;
		}
		return false;
	}
	
	/*
	@Override
	public List<CodDescBean> getAllCodiciDistributori() {
		String sql = "SELECT CODICE_CAUSALE ID, MOTIVAZIONE DESCRIPTION  FROM ANAG_CAUSALI_SWV";
		return jdbcTemplateSalesgate.query(sql, new CodDescBeanJdbcHandler().getRowMapper());
	}
	*/
}
