package eu.a2a.salesgate.normalizzatore.service;

import java.util.List;

import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;

public interface TemplateService {

  public List<TemplateInstance> getTemplates(String idDistr, String direzione);
  
  public List<TemplateInstance> getTemplatesVenditori(String idVend, String direzione);

  public TemplateInstance getTemplate(String idTemplate);
  
  public TemplateInstance getTemplateVenditore(String idTemplate);

  public int updateFileTemplate(String id, byte[] file, String fileName, String fileType);

  public TemplateInstance getFileTemplate(String id);

  public List<Campo> getCampiTemplateOutbound(String idTemplate);

  public List<Campo> getCampiTemplateInbound(String idTemplate);

  public List<Campo> getCampiOutbound(String utility);

  public List<Campo> getCampiInbound(String utility);

  public int updateTemplate(TemplateInstance templateInstance);

  public int insertTemplate(TemplateInstance templateInstance);

  public int verifiyEventCode(TemplateInstance templateInstance);

}
