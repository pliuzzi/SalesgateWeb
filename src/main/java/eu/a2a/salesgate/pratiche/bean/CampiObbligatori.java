package eu.a2a.salesgate.pratiche.bean;

import java.util.HashMap;
import java.util.Map;

import eu.a2a.salesgate.bean.CodDescBean;

public class CampiObbligatori extends CodDescBean {

  private static final long serialVersionUID = 5419963565505974343L;
  private String campo;
  private String alert;

  private final Map<String, String> decode;

  public CampiObbligatori() {
    decode = new HashMap<String, String>();

    decode.put("ESITO", "lavoriGasExtension.esito");
    decode.put("SOSP_POT_PERICOLO", "lavoriGasExtension.sospPotPericolo");
    decode.put("SOSP_POT_PER", "lavoriGasExtension.sospPotPericolo");
    decode.put("SOST_MIS", "lavoriGasExtension.misuratore.sostituzione");
    decode.put("COD_FLUSSO", "codFlusso");
    decode.put("COD_SERVIZIO", "codServizio");
    decode.put("COD_PDR", "pdr");
    decode.put("DATA_VERIFICA", "lavoriGasExtension.dataVerifica");
    decode.put("PIVA_UTENTE", "pivaUtente");
    decode.put("SOST_CONV", "lavoriGasExtension.convertitore.sostituzione");
    decode.put("PIVA_DISTRIBUTORE", "distributore.piva");
    decode.put("COD_PRAT_DISTR", "codicePraticaDl");
    decode.put("REVOCA_DISATTIVAZIONE", "lavoriGasExtension.revocaDisattivazione");
    decode.put("COD_PRAT_UTENTE", "idSistemaSorgente");
    decode.put("MATR_MIS", "lavoriGasExtension.misuratore.matricola");
    decode.put("ATTI_AUTORIZZATIVI", "lavoriGasExtension.attiAutorizzativi");
    decode.put("ANNO_FABB_MIS", "lavoriGasExtension.annoFabbMis");
    decode.put("DATA_INTERVENTO", "lavoriGasExtension.dataIntervento");
    decode.put("ADDEBITO_ONERI", "lavoriEleExtension.addebitoOneri");
    decode.put("COD_FLUSSO", "lavoriEleExtension.codiceFlusso");
    decode.put("CODICEE02", "lavoriEleExtension.codicee02");
    decode.put("COD_INAMM", "lavoriEleExtension.codInamm");
    decode.put("COD_POD", "pod");
    decode.put("COD_PREV_DISTR", "lavoriEleExtension.codicePrevDl");
    decode.put("DATA_LETTURA", "lavoriEleExtension.misuratore.dataLettura");
    decode.put("DATA_RIATT_RIPR", "lavoriEleExtension.dataRiattRipr");
    decode.put("DATA_SOSPENSIONE", "lavoriEleExtension.dataSospensione");
    decode.put("ESITO", "lavoriEleExtension.esito");
    decode.put("ESITO_BASE", "lavoriEleExtension.esitoBase");
    decode.put("FASE", "lavoriEleExtension.fase");
    decode.put("LETT_ATT_3", "lavoriEleExtension.misuratore.letturaAttivaF3");
    decode.put("MATR_MIS_ATTIVA", "lavoriEleExtension.misuratore.matricolaMisAttiva");
    decode.put("MESE_COMP", "lavoriEleEstension.meseComp");
    decode.put("MESE_COMP_1", "lavoriEleExtension.meseComp1");
    decode.put("MISURATORE_ELETTRONICO", "lavoriEleExtension.misuratore.misuratoreElettronico");
    decode.put("MOTIVAZIONE", "lavoriEleExtension.motivazione");
    decode.put("ON_OFF", "lavoriEleExtension.onOff");
    decode.put("OPZIONE_TARIFF", "lavoriEleExtension.opzioneTariffaria");
    decode.put("POTENZA_FRANCHIGIA", "lavoriEleExtension.potFranchigia");
    decode.put("POTENZAFRANCHIGIA", "lavoriEleExtension.potFranchigia");
    decode.put("POTENZAIMPEGNATA", "lavoriEleExtension.potImpegnata");
    decode.put("REVOCA_DISATT", "lavoriEleExtension.revocaDisatt");
    decode.put("SETTORE_MERCEOLOGICO", "lavoriEleExtension.settoreMerceologico");
    decode.put("SOSP_POT_PER", "lavoriEleExtension.sospPotPer");
    decode.put("TENSIONE", "lavoriEleExtension.tensione");
    decode.put("TENSIONE_FASE", "lavoriEleExtension.tensioneFase");
    decode.put("TIPOLOGIA_UTENZA", "lavoriEleExtension.tipologiaUtenza");
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
