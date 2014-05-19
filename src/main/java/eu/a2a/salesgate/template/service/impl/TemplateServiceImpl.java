package eu.a2a.salesgate.template.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.service.base.AbstractService;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.dao.TemplateDAO;
import eu.a2a.salesgate.template.service.TemplateService;

@Service(value = "templateServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class TemplateServiceImpl extends AbstractService implements TemplateService {

  @Autowired
  private TemplateDAO templateDaoSalesgate;

  @Override
  public List<TemplateInstance> getTemplates(String idDistr, String direzione) {
    List<TemplateInstance> listTemplateInstance = templateDaoSalesgate.getAllTemplate(idDistr, direzione);
    return listTemplateInstance;
  }

  @Override
  public int updateFileTemplate(String id, byte[] file, String fileName, String fileType) {
    return templateDaoSalesgate.updateFileTemplate(id, file, fileName, fileType);
  }

  @Override
  public TemplateInstance getFileTemplate(String id) {
    return templateDaoSalesgate.getFileTemplate(id);
  }

  @Override
  public List<Campo> getCampiTemplateOutbound(String idTemplate) {
    return templateDaoSalesgate.getCampiTemplateOutbound(idTemplate);
  }

  @Override
  public List<Campo> getCampiTemplateInbound(String idTemplate) {
    return templateDaoSalesgate.getCampiTemplateInbound(idTemplate);
  }

  @Override
  public TemplateInstance getTemplate(String idTemplate) {
    return templateDaoSalesgate.getTemplate(idTemplate);
  }

  @Override
  public List<Campo> getCampiOutbound(String utility) {
    return templateDaoSalesgate.getCampiOutbound(utility);
  }

  @Override
  public List<Campo> getCampiInbound(String utility) {
    return templateDaoSalesgate.getCampiInbound(utility);
  }

  @Override
  public int updateTemplate(TemplateInstance templateInstance) {

    int nTot = 0;
    // Update Template
    nTot += templateDaoSalesgate.updateTemplate(templateInstance);

    if ((templateInstance.getMappingNew() != null) && (templateInstance.getMappingNew().size() > 0)) {
      // Mapping
      nTot += templateDaoSalesgate.deleteMapping(templateInstance.getId(), templateInstance.getAnagTemplate().getInOut());
      nTot += templateDaoSalesgate.insertMapping(templateInstance.getMappingNew(), templateInstance.getId(), templateInstance.getAnagTemplate().getInOut());
    }

    return nTot;
  }

  @Override
  public int insertTemplate(TemplateInstance templateInstance) {
    return templateDaoSalesgate.insertTemplate(templateInstance);
  }

  @Override
  public int verifiyEventCode(TemplateInstance templateInstance) {
    return templateDaoSalesgate.verifyEventCode(templateInstance);
  }

}
