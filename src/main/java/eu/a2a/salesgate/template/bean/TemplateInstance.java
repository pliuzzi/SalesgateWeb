package eu.a2a.salesgate.template.bean;

import java.util.List;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.venditori.bean.Venditore;

public class TemplateInstance extends CodDescBean {

  private static final long serialVersionUID = 4153012818552096498L;
  private Distributore distributore;
  private AnagRichieste codiceServizio;
  private AnagFlussi codFlusso;
  private String utility;
  private Venditore venditore;

  private Integer colonneTotali;
  private Integer colonneEffettive;
  private boolean flagAttivo;
  private String eventCode;

  private AnagTemplate anagTemplate;

  private List<Campo> mapping;
  private List<String> mappingNew;

  public Distributore getDistributore() {
    return distributore;
  }

  public void setDistributore(Distributore distributore) {
    this.distributore = distributore;
  }

  public AnagRichieste getCodiceServizio() {
    return codiceServizio;
  }

  public void setCodiceServizio(AnagRichieste codiceServizio) {
    this.codiceServizio = codiceServizio;
  }

  public AnagFlussi getCodFlusso() {
    return codFlusso;
  }

  public void setCodFlusso(AnagFlussi codFlusso) {
    this.codFlusso = codFlusso;
  }

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }
  
  public Venditore getVenditore() {
	  return venditore;
  }
  
  public void setVenditore(Venditore venditore) {
	  this.venditore = venditore;
  }

  public Integer getColonneTotali() {
    return colonneTotali;
  }

  public void setColonneTotali(Integer colonneTotali) {
    this.colonneTotali = colonneTotali;
  }

  public Integer getColonneEffettive() {
    return colonneEffettive;
  }

  public void setColonneEffettive(Integer colonneEffettive) {
    this.colonneEffettive = colonneEffettive;
  }

  public boolean getFlagAttivo() {
    return flagAttivo;
  }

  public void setFlagAttivo(boolean flagAttivo) {
    this.flagAttivo = flagAttivo;
  }

  public String getEventCode() {
    return eventCode;
  }

  public void setEventCode(String eventCode) {
    this.eventCode = eventCode;
  }

  public AnagTemplate getAnagTemplate() {
    return anagTemplate;
  }

  public void setAnagTemplate(AnagTemplate anagTemplate) {
    this.anagTemplate = anagTemplate;
  }

  public List<Campo> getMapping() {
    return mapping;
  }

  public void setMapping(List<Campo> mapping) {
    this.mapping = mapping;
  }

  public List<String> getMappingNew() {
    return mappingNew;
  }

  public void setMappingNew(List<String> mappingNew) {
    this.mappingNew = mappingNew;
  }

}
