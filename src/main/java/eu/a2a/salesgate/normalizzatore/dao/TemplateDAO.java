package eu.a2a.salesgate.normalizzatore.dao;

import java.util.List;

import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;

public interface TemplateDAO {

  List<TemplateInstance> getAllTemplate(String idDistr, String direzione);

  int updateFileTemplate(String id, byte[] file, String fileName, String fileType);

  TemplateInstance getFileTemplate(String id);

  List<Campo> getCampiTemplateOutbound(String idTemplate);

  List<Campo> getCampiTemplateInbound(String idTemplate);

  TemplateInstance getTemplate(String idTemplate);

  List<Campo> getCampiOutbound(String utility);

  List<Campo> getCampiInbound(String utility);

  int updateTemplate(TemplateInstance templateInstance);

  int deleteMapping(String idTemplate, String direzione);

  int insertMapping(List<String> mapping, String idTemplate, String direzione);

  int insertTemplate(TemplateInstance templateInstance);

  int verifyEventCode(TemplateInstance templateInstance);

}