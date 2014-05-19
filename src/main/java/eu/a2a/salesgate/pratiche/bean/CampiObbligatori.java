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
