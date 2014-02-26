package eu.a2a.salesgate.template.dao.impl;

import it.a2a.salesgate.beans.Campo;
import it.a2a.salesgate.beans.Distributore;
import it.a2a.salesgate.beans.ServizioCanale;
import it.a2a.salesgate.beans.ServizioPEC;
import it.a2a.salesgate.beans.TemplateInstance;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.template.dao.TemplateDAO;

@Component
public class TemplateDAOImpl implements TemplateDAO{

	private final static String SELECT_ALL_TEMPLATE = "selectAllTemplate";
	private final static String UPDATE_FILE_TEMPLATE = "updateFileTemplate";
	private final static String SELECT_FILE_TEMPLATE = "selectFileTemplate";
	private final static String SELECT_CAMPI_TEMPLATE_OUTBOUND = "selectCampiTemplateOutbound";
	private final static String SELECT_CAMPI_TEMPLATE_INBOUND = "selectCampiTemplateInbound";
	private final static String SELECT_TEMPLATE = "selectTemplate";
	private final static String SELECT_CAMPI_OUTBOUND = "selectCampiOutbound";
	private final static String SELECT_CAMPI_INBOUND = "selectCampiInbound";
	private final static String SELECT_EVENT_CODE = "selectEventCode";
	private final static String DELETE_CAMPI_INBOUND = "deleteCampiInbound";
	private final static String DELETE_CAMPI_OUTBOUND = "deleteCampiOutbound";
	private final static String INSERT_CAMPI_INBOUND = "insertCampiInbound";
	private final static String INSERT_CAMPI_OUTBOUND = "insertCampiOutbound";
	private final static String UPDATE_ANAG_TEMPLATE = "updateAnagTemplate";
	private final static String INSERT_ANAG_TEMPLATE = "insertAnagTemplate";
	private final static String INSERT_TEMPLATE_INSTANCE = "insertTemplateInstance";
	private final static String INSERT_SCHED_EVENT_PARAMETERS = "insertSchedEventParameters";
	private final static String INSERT_SCHED_EVENT_SCHEDULE = "insertSchedEventSchedule";
	
	@Autowired
	SqlSession sqlSessionSGUSR;
	
	@Override
  public List<TemplateInstance> getAllTemplate(Map<String, Object> map){
		return sqlSessionSGUSR.selectList(SELECT_ALL_TEMPLATE, map);
	}
	
	@Override
  public int updateFileTemplate(Map<String, Object> map){
		return sqlSessionSGUSR.update(UPDATE_FILE_TEMPLATE, map);
	}

	@Override
  public TemplateInstance getFileTemplate(String id) {
		return sqlSessionSGUSR.selectOne(SELECT_FILE_TEMPLATE, id);
	}
	
	@Override
  public List<Campo> getCampiTemplateOutbound(String idTemplate){
		return sqlSessionSGUSR.selectList(SELECT_CAMPI_TEMPLATE_OUTBOUND, idTemplate);
	}
	
	@Override
  public List<Campo> getCampiTemplateInbound(String idTemplate){
		return sqlSessionSGUSR.selectList(SELECT_CAMPI_TEMPLATE_INBOUND, idTemplate);
	}
	
	@Override
  public TemplateInstance getTemplate(String idTemplate){
		return sqlSessionSGUSR.selectOne(SELECT_TEMPLATE, idTemplate);
	}
	
	@Override
  public List<Campo> getCampiOutbound(String utility){
		return sqlSessionSGUSR.selectList(SELECT_CAMPI_OUTBOUND, utility);
	}
	
	@Override
  public List<Campo> getCampiInbound(String utility){
		return sqlSessionSGUSR.selectList(SELECT_CAMPI_INBOUND, utility);
	}
	
	@Override
  public int updateTemplate(TemplateInstance templateInstance){
		int nTot = sqlSessionSGUSR.update(UPDATE_ANAG_TEMPLATE, templateInstance);
		//aggiungere update instance ??
		return nTot;
	}

	@Override
  public int deleteMapping(String idTemplate, String direzione) {
		if("IN".equals(direzione)){
			return sqlSessionSGUSR.delete(DELETE_CAMPI_INBOUND, idTemplate);
		}else
			return sqlSessionSGUSR.delete(DELETE_CAMPI_OUTBOUND, idTemplate);
	}

	@Override
  public int insertMapping(List<String> mapping, String idTemplate, String direzione) {
		Map<String, Object> param = null;
		String insert = ("IN".equals(direzione)) ? INSERT_CAMPI_INBOUND : INSERT_CAMPI_OUTBOUND;
		int nTot = 0;
		for(int i = 0; i < mapping.size(); i++){
			param = new HashMap<String, Object>();
			param.put("idTemplate", idTemplate);
			param.put("idCampo", mapping.get(i));
			param.put("posizione", (i+1));
			nTot += sqlSessionSGUSR.insert(insert, param);
		}
		
		return nTot;
		
	}

	@Override
  public int insertTemplate(TemplateInstance templateInstance) {
		int idAnagTemplate = sqlSessionSGUSR.selectOne("selectIdAnagTemplate");
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
		}
		int idTemplateInstance = sqlSessionSGUSR.selectOne("selectIdAnagTemplate");
		templateInstance.getAnagTemplate().setId(idAnagTemplate + "");
		templateInstance.setId(idTemplateInstance + "");
		
		sqlSessionSGUSR.insert(INSERT_ANAG_TEMPLATE, templateInstance);
		sqlSessionSGUSR.insert(INSERT_TEMPLATE_INSTANCE, templateInstance);
		if("IN".equals(templateInstance.getAnagTemplate().getInOut())){
			sqlSessionSGUSR.insert(INSERT_SCHED_EVENT_SCHEDULE, templateInstance);
			sqlSessionSGUSR.insert(INSERT_SCHED_EVENT_PARAMETERS, templateInstance);
		}
		return idTemplateInstance;
	}

	@Override
  public int verifyEventCode(TemplateInstance templateInstance) {
		return ((List<?>) sqlSessionSGUSR.selectList(SELECT_EVENT_CODE, templateInstance)).size();
	}
	
}
