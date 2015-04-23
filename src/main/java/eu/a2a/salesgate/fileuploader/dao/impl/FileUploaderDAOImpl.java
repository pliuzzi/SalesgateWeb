package eu.a2a.salesgate.fileuploader.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ch.lambdaj.Lambda;
import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.dao.handler.ListStringJdbcHandler;
import eu.a2a.salesgate.dao.handler.StringJdbcHandler;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderInstanceItem;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderItem;
import eu.a2a.salesgate.fileuploader.dao.FileUploaderDAO;
import eu.a2a.salesgate.fileuploader.dao.impl.handler.FileUploaderInstanceItemJdbcHandler;
import eu.a2a.salesgate.fileuploader.dao.impl.handler.FileUploaderItemJdbcHandler;
import eu.a2a.salesgate.fileuploader.dao.impl.handler.FileUploaderItemVenditoreJdbcHandler;
import eu.a2a.salesgate.normalizzatore.service.TemplateService;
import eu.a2a.salesgate.template.bean.Campo;
//import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.bean.matcher.CampoMatcher;

@Repository("fileUploaderDaoSdm")
public class FileUploaderDAOImpl extends AbstractDAO implements FileUploaderDAO {
	Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	JdbcTemplate jdbcTemplateSdm;
	@Autowired
	TemplateService templateServiceSdm;
	
	@Override
	public List<FileUploaderItem> estraiAllFileUploaderItem() {
		String sql = "SELECT FK_DISTRIBUTORE, AD.NAME, UTILITY, FK_COD_SERVIZIO, FK_COD_FLUSSO, EVENT_CODE FROM TEMPLATE_INSTANCE TI, SCHED_EVENT_SCHEDULE SES, ANAG_DL AD WHERE EVENT_CODE = SES.CD_EVENTO "
				   + "AND TI.FK_DISTRIBUTORE = AD.ID ORDER BY AD.NAME ASC, FK_COD_SERVIZIO ASC";
		List<FileUploaderItem> list = jdbcTemplateSdm.query(sql, new FileUploaderItemJdbcHandler().getRowMapper());
		return list;
	}
	
	@Override
	public List<FileUploaderItem> estraiAllFileUploaderItemVenditore() {
		String sql = "SELECT FK_DISTRIBUTORE, AV.NAME, FK_UTILITY, FK_COD_SERVIZIO, FK_COD_FLUSSO, EVENT_CODE FROM TEMPLATE_INSTANCE TI, SCHED_EVENT_SCHEDULE SES, ANAG_VENDITORI AV WHERE EVENT_CODE = SES.CD_EVENTO "
				   + "AND TI.FK_DISTRIBUTORE = AV.ID ORDER BY AV.NAME ASC, FK_COD_SERVIZIO ASC";
		List<FileUploaderItem> list = jdbcTemplateSdm.query(sql, new FileUploaderItemVenditoreJdbcHandler().getRowMapper());
		return list;
	}
	
	@Override
	public List<FileUploaderInstanceItem> estraiAllFileUploaderInstancesItem(String eventCode) {
		String sql = "SELECT SER.OBJ_ID, CD_EVENTO, CD_STATO, SES.STATUS, FILE_NAME, SER.D_POST_TIMESTAMP, SER.D_GET_TIMESTAMP, SER.D_END_TIMESTAMP, SER.RECORD_PROCESSATI, SER.RECORD_SCARTATI, SER.RECORD_TOTALI, SER.LINK_FILE_SCARTI, SER.FILE_SCARTI "
				   + "FROM SCHED_EVENT_RUN SER, SCHED_EVENT_STATUS SES WHERE SER.CD_STATO = SES.OBJ_ID AND CD_EVENTO = '" + eventCode + "' "
				   + "ORDER BY SER.OBJ_ID DESC";
		List<FileUploaderInstanceItem> list = jdbcTemplateSdm.query(sql, new FileUploaderInstanceItemJdbcHandler().getRowMapper());
		return list;
	}
	
	private String createSqlStaging(List<?> listMapping, String objId) {
		String table = "STAGING_GAS_INBOUND";
		String mapping = "";
		String separatoreCampi = ", ";
		for (Object c : listMapping) {
			mapping += ((Campo) c).getNomeFisico() + separatoreCampi;
		}
		String select = "SELECT" + mapping.substring(0, mapping.length() - separatoreCampi.length()) + " FROM" + table;
		select += " WHERE FK_OBJ_ID = " + objId;
		return select;
	}
	
	@Override
	public FileUploaderInstanceItem estraiFileUploaderInstance(String eventCode, String objId) {
		String sql = "SELECT SER.OBJ_ID, CD_EVENTO, CD_STATO, SES.STATUS, FILE_NAME, TO_CHAR(SER.D_POST_TIMESTAMP, 'dd/mm/yyyy hh24:mi:ss') D_POST_TIMESTAMP, TO_CHAR(SER.D_GET_TIMESTAMP, 'dd/mm/yyyy hh24:mi:ss') D_GET_TIMESTAMP, TO_CHAR(SER.D_END_TIMESTAMP, 'dd/mm/yyyy hh24:mi:ss') D_END_TIMESTAMP, "
				   + "SER.RECORD_PROCESSATI, SER.RECORD_SCARTATI, SER.RECORD_TOTALI, SER.LINK_FILE_SCARTI, SER.FILE_SCARTI FROM SCHED_EVENT_RUN SER, SCHED_EVENT_STATUS SES "
				   + "WHERE SER.CD_STATO = SES.OBJ_ID AND SER.OBJ_ID = ? ORDER BY SER.OBJ_ID DESC";
		FileUploaderInstanceItem instance = jdbcTemplateSdm.query(sql, new FileUploaderInstanceItemJdbcHandler().getResultSetExtractor(), objId);
		String idTemplate = jdbcTemplateSdm.query("SELECT ID FROM TEMPLATE_INSTANCE WHERE EVENT_CODE = '" + eventCode + "'", new StringJdbcHandler().getResultSetExtractor());
		//TemplateInstance ti = templateServiceSdm.getTemplate(idTemplate);
		List<Campo> listCampi = templateServiceSdm.getCampiTemplateInbound(idTemplate);
		listCampi = Lambda.filter(new CampoMatcher(false), listCampi);
		instance.setCampi(listCampi);
		String sqlValues = createSqlStaging(Lambda.sort(listCampi, Lambda.on(Campo.class).getPosizione()), instance.getId());
		instance.setValues(jdbcTemplateSdm.query(sqlValues, new ListStringJdbcHandler().getRowMapper()));
		return instance;
	}
	
	@Override
	public int startFileUploader(String eventCode, String fileName, String user) {
		int idRun = 0;
		String sql = "CALL ETL_TRANSFORM.START_ETL(?, ?, ?, ?, ?)";
		jdbcTemplateSdm.update(sql, fileName, eventCode, user, null, idRun);
		return idRun;
	}
}
