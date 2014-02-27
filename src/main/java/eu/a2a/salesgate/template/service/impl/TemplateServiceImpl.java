package eu.a2a.salesgate.template.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.dao.TemplateDAO;
import eu.a2a.salesgate.template.service.TemplateService;

@Service(value = "templateService")
public class TemplateServiceImpl implements TemplateService {

  @Autowired
  private TemplateDAO templateDao;

  @Override
  public List<TemplateInstance> getTemplates(String idDistr, String direzione) {
    List<TemplateInstance> listTemplateInstance = templateDao.getAllTemplate(idDistr, direzione);
    return listTemplateInstance;
  }

  @Override
  @Transactional
  public int updateFileTemplate(String id, byte[] file, String fileName, String fileType) {
    return templateDao.updateFileTemplate(id, file, fileName, fileType);
  }

  @Override
  public TemplateInstance getFileTemplate(String id) {
    return templateDao.getFileTemplate(id);
  }

  @Override
  public List<Campo> getCampiTemplateOutbound(String idTemplate) {
    return templateDao.getCampiTemplateOutbound(idTemplate);
  }

  @Override
  public List<Campo> getCampiTemplateInbound(String idTemplate) {
    return templateDao.getCampiTemplateInbound(idTemplate);
  }

  @Override
  public TemplateInstance getTemplate(String idTemplate) {
    return templateDao.getTemplate(idTemplate);
  }

  @Override
  public List<Campo> getCampiOutbound(String utility) {
    return templateDao.getCampiOutbound(utility);
  }

  @Override
  public List<Campo> getCampiInbound(String utility) {
    return templateDao.getCampiInbound(utility);
  }

  @Override
  @Transactional
  public int updateTemplate(TemplateInstance templateInstance) {

    int nTot = 0;
    // Update Template
    nTot += templateDao.updateTemplate(templateInstance);

    if ((templateInstance.getMappingNew() != null) && (templateInstance.getMappingNew().size() > 0)) {
      // Mapping
      nTot += templateDao.deleteMapping(templateInstance.getId(), templateInstance.getAnagTemplate().getInOut());
      nTot += templateDao.insertMapping(templateInstance.getMappingNew(), templateInstance.getId(), templateInstance
          .getAnagTemplate().getInOut());
    }

    return nTot;
  }

  @Override
  @Transactional
  public int insertTemplate(TemplateInstance templateInstance) {
    return templateDao.insertTemplate(templateInstance);
  }

  @Override
  public int verifiyEventCode(TemplateInstance templateInstance) {
    return templateDao.verifyEventCode(templateInstance);
  }

}
