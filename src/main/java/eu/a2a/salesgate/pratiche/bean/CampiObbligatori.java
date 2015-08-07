package eu.a2a.salesgate.pratiche.bean;

import java.util.HashMap;
import java.util.Map;

import eu.a2a.salesgate.bean.CodDescBean;

public class CampiObbligatori extends CodDescBean {

  private static final long serialVersionUID = 5419963565505974343L;
  private String campo;
  private String alert;

  private final Map<String, String> decode;

  public CampiObbligatori(String utility) {

    utility = utility.substring(0, 1).toUpperCase() + utility.substring(1).toLowerCase();

    decode = new HashMap<String, String>();

    decode.put("ESITO", "lavori" + utility + "Extension.esito");
    decode.put("SOSP_POT_PERICOLO", "lavori" + utility + "Extension.sospPotPericolo");
    decode.put("SOSP_POT_PER", "lavori" + utility + "Extension.sospPotPericolo");
    decode.put("SOST_MIS", "lavori" + utility + "Extension.misuratore.sostituzione");
    decode.put("COD_FLUSSO", "codFlusso");
    decode.put("COD_SERVIZIO", "codServizio");
    decode.put("COD_PDR", "pdr");
    decode.put("DATA_VERIFICA", "lavori" + utility + "Extension.dataVerifica");
    decode.put("PIVA_UTENTE", "pivaUtente");
    decode.put("SOST_CONV", "lavori" + utility + "Extension.convertitore.sostituzione");
    decode.put("PIVA_DISTRIBUTORE", "distributore.piva");
    decode.put("COD_PRAT_DISTR", "codicePraticaDl");
    decode.put("REVOCA_DISATTIVAZIONE", "lavori" + utility + "Extension.revocaDisattivazione");
    decode.put("COD_PRAT_UTENTE", "idSistemaSorgente");
    decode.put("MATR_MIS", "lavori" + utility + "Extension.misuratore.matricola");
    decode.put("ATTI_AUTORIZZATIVI", "lavori" + utility + "Extension.attiAutorizzativi");
    decode.put("ANNO_FABB_MIS", "lavori" + utility + "Extension.annoFabbMis");
    decode.put("DATA_INTERVENTO", "lavori" + utility + "Extension.dataIntervento");
    decode.put("ADDEBITO_ONERI", "lavori" + utility + "Extension.addebitoOneri");
    decode.put("COD_FLUSSO", "lavori" + utility + "Extension.codiceFlusso");
    decode.put("CODICEE02", "lavori" + utility + "Extension.codicee02");
    decode.put("COD_INAMM", "lavori" + utility + "Extension.codInamm");
    decode.put("COD_POD", "pod");
    decode.put("COD_PREV_DISTR", "lavori" + utility + "Extension.codicePrevDl");
    decode.put("DATA_LETTURA", "lavori" + utility + "Extension.misuratore.dataLettura");
    decode.put("DATA_RIATT_RIPR", "lavori" + utility + "Extension.dataRiattRipr");
    decode.put("DATA_SOSPENSIONE", "lavori" + utility + "Extension.dataSospensione");
    decode.put("ESITO", "lavori" + utility + "Extension.esito");
    decode.put("ESITO_BASE", "lavori" + utility + "Extension.esitoBase");
    decode.put("FASE", "lavori" + utility + "Extension.fase");
    decode.put("LETT_ATT_3", "lavori" + utility + "Extension.misuratore.letturaAttivaF3");
    decode.put("MATR_MIS_ATTIVA", "lavori" + utility + "Extension.misuratore.matricolaMisAttiva");
    decode.put("MESE_COMP", "lavori" + utility + "Estension.meseComp");
    decode.put("MESE_COMP_1", "lavori" + utility + "Extension.meseComp1");
    decode.put("MISURATORE_ELETTRONICO", "lavori" + utility + "Extension.misuratore.misuratoreElettronico");
    decode.put("MOTIVAZIONE", "lavori" + utility + "Extension.motivazione");
    decode.put("ON_OFF", "lavori" + utility + "Extension.onOff");
    decode.put("OPZIONE_TARIFF", "lavori" + utility + "Extension.opzioneTariffaria");
    decode.put("POTENZA_FRANCHIGIA", "lavori" + utility + "Extension.potFranchigia");
    decode.put("POTENZAFRANCHIGIA", "lavori" + utility + "Extension.potFranchigia");
    decode.put("POTENZAIMPEGNATA", "lavori" + utility + "Extension.potImpegnata");
    decode.put("REVOCA_DISATT", "lavori" + utility + "Extension.revocaDisatt");
    decode.put("SETTORE_MERCEOLOGICO", "lavori" + utility + "Extension.settoreMerceologico");
    decode.put("SOSP_POT_PER", "lavori" + utility + "Extension.sospPotPer");
    decode.put("TENSIONE", "lavori" + utility + "Extension.tensione");
    decode.put("TENSIONE_FASE", "lavori" + utility + "Extension.tensioneFase");
    decode.put("TIPOLOGIA_UTENZA", "lavori" + utility + "Extension.tipologiaUtenza");
  }

  public String getCampo() {
    return campo;
  }

  public void setCampo(String campo) throws IllegalArgumentException {
    // this.campo = campo;
    if ((this.campo = (decode.get(campo))) == null) {
      throw new IllegalArgumentException("Il campo " + campo + " non è stato trovato nel dizionario");
    }
  }

  public String getAlert() {
    return alert;
  }

  public void setAlert(String alert) {
    this.alert = alert;
  }

  public boolean isObbligatorio(String campo) {
    return campo.equals(this.campo);
  }

}
