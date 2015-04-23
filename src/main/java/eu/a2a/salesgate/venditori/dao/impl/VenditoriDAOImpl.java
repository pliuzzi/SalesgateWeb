package eu.a2a.salesgate.venditori.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.venditori.bean.Venditore;
import eu.a2a.salesgate.venditori.bean.factory.VenditoriFactory;
import eu.a2a.salesgate.venditori.dao.VenditoriDAO;
import eu.a2a.salesgate.venditori.dao.impl.handler.VenditoreJdbcHandler;
@Repository("VenditoriDaoSalesgate")
public class VenditoriDAOImpl implements VenditoriDAO {
	@Autowired
	JdbcTemplate jdbcTemplateSalesgate;
	
	@Override
	public List<Venditore> getAllVenditori(Venditore venditore) {
		String sql = "SELECT ID, NAME, PT_IVA, FLAG_ATTIVO, TO_CHAR(TMS_CREATED, 'DD/MM/YYYY') as TMS_CREATED, USR_CREATED, TO_CHAR(TMS_UPDATED, 'DD/MM/YYYY') as TMS_UPDATED, USR_UPDATED FROM ANAG_VENDITORI WHERE 1 = 1";
		if (!StringUtils.isEmpty(venditore.getId())) {
			sql += " AND ID = '" + venditore.getId() + "'";
		}
		if (!StringUtils.isEmpty(venditore.getNome())) {
			sql += " AND NAME = '" + venditore.getNome() + "'";
		}
		if (!StringUtils.isEmpty(venditore.getPtIva())) {
			sql += " AND PT_IVA = '" + venditore.getPtIva() + "'";
		}
		sql += " ORDER BY NAME ASC, ID ASC";
		List<Venditore> list = jdbcTemplateSalesgate.query(sql, new VenditoreJdbcHandler().getRowMapper());
		return list;
	}
	
	@Override
	public Venditore getVenditore(String id) {
		Venditore venditore = getAllVenditori(VenditoriFactory.newVenditore(id, null, null)).get(0);
		return venditore;
	}
	
	@Override
	public int updateVenditore(Venditore venditore, String user) {
		int nrows = 0;
		String sql = "UPDATE ANAG_VENDITORI SET NAME = ?, PT_IVA = ?, TMS_UPDATED = ?, USR_UPDATED = ? WHERE ID = ?";
		nrows = jdbcTemplateSalesgate.update(sql, venditore.getNome(), venditore.getPtIva(), new Date(), user, venditore.getId());
		return nrows;
	}
	
	@Override
	public int insertVenditore(Venditore venditore, String user) {
		int nrows = 0;
		String sql = "INSERT INTO ANAG_VENDITORI (ID, NAME, PT_IVA, FLAG_ATTIVO, TMS_CREATED, USR_CREATED) values (?, ?, ?, 'Y', ?, ?)";
		nrows = jdbcTemplateSalesgate.update(sql, venditore.getId(), venditore.getNome(), venditore.getPtIva(), new Date(), user);
		return nrows;
	}
	
	@Override
	public int verifyIdVenditore(String id) {
		return getAllVenditori(VenditoriFactory.newVenditore(id, null, null)).size();
	}
	
	@Override
	public int verifyPtIvaVenditore(String ptIva) {
		return getAllVenditori(VenditoriFactory.newVenditore(null, null, ptIva)).size();
	}
}
