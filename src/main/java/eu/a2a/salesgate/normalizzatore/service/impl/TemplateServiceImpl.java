package eu.a2a.salesgate.normalizzatore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.normalizzatore.dao.TemplateDAO;
import eu.a2a.salesgate.normalizzatore.service.TemplateService;
import eu.a2a.salesgate.service.base.AbstractService;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;

@Service("templateServiceSdm")
@Transactional("transactionManagerSdm")
public class TemplateServiceImpl extends AbstractService implements TemplateService {

  @Autowired
  private TemplateDAO templateDaoSdm;

  @Override
  public List<TemplateInstance> getTemplates(String idDistr, String direzione) {
    List<TemplateInstance> listTemplateInstance = templateDaoSdm.getAllTemplate(idDistr, direzione);
    return listTemplateInstance;
  }
  
  @Override
  public List<TemplateInstance> getTemplatesVenditori(String idVend, String direzione) {
	  List<TemplateInstance> listTemplateInstanceVenditori = templateDaoSdm.getAllTemplateVenditori(idVend, direzione);
	  return listTemplateInstanceVenditori;
  }

  @Override
  public int updateFileTemplate(String id, byte[] file, String fileName, String fileType) {
    return templateDaoSdm.updateFileTemplate(id, file, fileName, fileType);
  }

  @Override
  public TemplateInstance getFileTemplate(String id) {
    return templateDaoSdm.getFileTemplate(id);
  }

  @Override
  public List<Campo> getCampiTemplateOutbound(String idTemplate) {
    return templateDaoSdm.getCampiTemplateOutbound(idTemplate);
  }

  @Override
  public List<Campo> getCampiTemplateInbound(String idTemplate) {
    return templateDaoSdm.getCampiTemplateInbound(idTemplate);
  }

  @Override
  public TemplateInstance getTemplate(String idTemplate) {
    return templateDaoSdm.getTemplate(idTemplate);
  }
  
  @Override
  public TemplateInstance getTemplateVenditore(String idTemplate) {
	  return templateDaoSdm.getTemplateVenditore(idTemplate);
  }

  @Override
  public List<Campo> getCampiOutbound(String utility) {
    return templateDaoSdm.getCampiOutbound(utility);
  }

  @Override
  public List<Campo> getCampiInbound(String utility) {
    return templateDaoSdm.getCampiInbound(utility);
  }

  @Override
  public int updateTemplate(TemplateInstance templateInstance) {

    int nTot = 0;
    // Update Template
    nTot += templateDaoSdm.updateTemplate(templateInstance);

    if ((templateInstance.getMappingNew() != null) && (templateInstance.getMappingNew().size() > 0)) {
      // Mapping
      nTot += templateDaoSdm.deleteMapping(templateInstance.getId(), templateInstance.getAnagTemplate().getInOut());
      nTot += templateDaoSdm.insertMapping(templateInstance.getMappingNew(), templateInstance.getId(), templateInstance.getAnagTemplate().getInOut());
    }

    return nTot;
  }

  @Override
  public int insertTemplate(TemplateInstance templateInstance) {
    return templateDaoSdm.insertTemplate(templateInstance);
  }

  @Override
  public int verifiyEventCode(TemplateInstance templateInstance) {
    return templateDaoSdm.verifyEventCode(templateInstance);
  }

}
