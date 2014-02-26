package eu.a2a.salesgate.template.dao;

import java.util.List;
import java.util.Map;

public interface TemplateDAO {

  List<TemplateInstance> getAllTemplate(Map<String, Object> map);

  int updateFileTemplate(Map<String, Object> map);

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