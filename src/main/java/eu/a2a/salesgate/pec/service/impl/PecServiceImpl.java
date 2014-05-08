package eu.a2a.salesgate.pec.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.tika.detect.Detector;
import org.apache.tika.metadata.Metadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.a2a.salesgate.cutoff.bean.CutOffItem;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.pec.dao.PecDAO;
import eu.a2a.salesgate.pec.helper.PecHelper;
import eu.a2a.salesgate.pec.service.PecService;

@Service("pecServiceSalesgate")
public class PecServiceImpl implements PecService {

  @Autowired
  PecDAO pecDaoSalesgate;

  @Autowired
  DistributoreDAO distributoreDaoSalesgate;

  @Autowired
  private Detector defaultDetector;

  @Override
  public String sendPec(CutOffItem cutOffItem, byte[] fileContent) throws IOException {

    String codiceServizio = cutOffItem.getServizio().getCode();
    String codiceFlusso = cutOffItem.getFiles().getCodiceFlusso();
    String utility = cutOffItem.getUtility();
    String mercato = pecDaoSalesgate.getMercatoEle(cutOffItem.getFiles().getId());
    String podPdr = pecDaoSalesgate.getCodPodPdr(cutOffItem.getFiles().getId());
    String codicePraticaUtente = pecDaoSalesgate.getCodicePraticaUtente(cutOffItem.getFiles().getId());

    ServizioPEC confPec = distributoreDaoSalesgate.getPEC(cutOffItem.getDistributore().getId(), codiceServizio);

    String subject = decode(confPec.getSubject(), codiceServizio, codiceFlusso, utility, mercato, podPdr, codicePraticaUtente);
    String mailContent = decode(getMailContent(codiceServizio, codiceFlusso, utility), codiceServizio, codiceFlusso, utility, mercato, podPdr, codicePraticaUtente);
    Metadata metadata = new Metadata();
    metadata.add(Metadata.RESOURCE_NAME_KEY, cutOffItem.getFiles().getNomeFile());

    String mimeType = defaultDetector.detect(null, metadata).toString();
    PecHelper.send("smtps.pec.aruba.it", 465, confPec.getPecUsername(), confPec.getPecPassword(), confPec.getPecFrom(), confPec.getPecTo(), subject, mailContent, fileContent, cutOffItem.getFiles().getNomeFile(), mimeType);

    return null;
  }

  private String decode(String stringToDecode, String codiceServizio, String codiceFlusso, String utility, String mercato, String podPdr, String codicePraticaUtente) {

    return stringToDecode.replace("{today}", new SimpleDateFormat("dd/MM/yyyy").format(new Date()) + "").replace("{cod_servizio}", codiceServizio + "").replace("{cod_flusso}", codiceFlusso + "").replace("{utility}", utility + "")
        .replace("{mercato}", mercato + "").replace("{podpdr}", podPdr + "").replace("{cod_prat_utente}", codicePraticaUtente + "");
  }

  private String getMailContent(String codServizio, String codFlusso, String utility) {

    if (codServizio.equals("TEM") && codFlusso.equals("E050") && utility.equals("ELE")) {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Buongiorno,<br>in allegato il file per la richiesta di attivazione di una fornitura temporanea.</p><p class=&apos;normale&apos;>Con i migliori saluti.</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2acommerciale/resources/a2aenergia/logo.gif&apos;/><br/>A2A Energia Spa<br/>Back Office<br/><small>Tel. 02.7720.3169<br/>Tel. 02.7720.3712<br/>Fax  02.7601.6206</small></p></body></html>";
    } else if (codServizio.equals("DM1") && codFlusso.equals("0050") && utility.equals("GAS")) {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Buongiorno,<br>in allegato il file per la richiesta prestazione.</p><p class=&apos;normale&apos;>Con i migliori saluti.</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2acommerciale/resources/a2aenergia/logo.gif&apos;/><br/>A2A Energia Spa<br/>Servizio Clienti<br/><small>Tel. 02.7720.3151<br/>Tel. 02.7720.4291<br/>Fax  02.7720.3159</small></p></body></html>";
    } else if ((codServizio.equals("IM1") || codServizio.equals("CA1")) && codFlusso.equals("0050") && utility.equals("GAS")) {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Buongiorno,<br>si allega alla presente l&apos;elenco dei punti su cui effettuare la prestazione in oggetto.</p><p class=&apos;normale&apos;>Cordiali saluti.</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2acommerciale/resources/a2aenergia/logo.gif&apos;/><br/>A2A Energia Spa<br/>Servizio Clienti<br/><small>Tel. 02.7720.3151<br/>Tel. 02.7720.4291<br/>Fax  02.7720.3159</small></p></body></html>";
    } else if (codServizio.equals("SWVL") && codFlusso.equals("E050") && utility.equals("ELE")) {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Spettabile Distributore,<br>con la presente si comunicano in allegato le richieste di prestazione Switch con voltura Elettricit&agrave; per conto dei nostri clienti finali in mercato libero.</p><p class=&apos;normale&apos;>Vi comunichiamo che rinunciamo alla richiesta nel caso in cui il misuratore non fosse attivo.</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2aenergia/resources/images/header-logo.png&apos;/><small><br/>A2A Energia S.p.A.-Gruppo A2A<br/>P.za Trento, 13 - 20135 Milano<br/><b>PEC:</b> prestazioni.switchconvoltura.aen@pec.a2a.eu<br/><b>Web:</b> www.a2aenergia.eu</small></p></body></html>";
    } else if (codServizio.equals("SWVT") && codFlusso.equals("E050") && utility.equals("ELE")) {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Spettabile Distributore,<br>con la presente si comunicano in allegato le richieste di prestazione Switch con voltura Elettricit&agrave; per conto dei nostri clienti finali in mercato di maggior tutela.</p><p class=&apos;normale&apos;>Vi comunichiamo che rinunciamo alla richiesta nel caso in cui il misuratore non fosse attivo.</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2aenergia/resources/images/header-logo.png&apos;/><small><br/>A2A Energia S.p.A.-Gruppo A2A<br/>P.za Trento, 13 - 20135 Milano<br/><b>PEC:</b> prestazioni.switchconvoltura.aen@pec.a2a.eu<br/><b>Web:</b> www.a2aenergia.eu</small></p></body></html>";
    } else if (codServizio.equals("SWV") && codFlusso.equals("0050") && utility.equals("GAS")) {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Spettabile Distributore,<br>con la presente si comunicano in allegato le richieste di prestazione Switch con voltura GAS per conto dei nostri clienti finali</p><p class=&apos;normale&apos;>Il cliente finale autocertifica ai sensi dell’articolo 47 d.P.R. 445/00 di essere l’unico soggetto titolato all’utilizzo del punto di riconsegna e quindi a sottoscrivere un contratto di fornitura;</p><p class=&apos;normale&apos;>Attestazione del mantenimento delle condizioni tecniche di cui all’articolo 13, deliberazione 138/04 caratterizzanti il punto di riconsegna.</p><p class=&apos;normale&apos;>Vi comunichiamo che rinunciamo alla richiesta nel caso in cui il misuratore non fosse attivo.</p><p class=&apos;normale&apos;>Attendo un Vostro gentile riscontro</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2aenergia/resources/images/header-logo.png&apos;/><small><br/>A2A Energia S.p.A.-Gruppo A2A<br/>P.za Trento, 13 - 20135 Milano<br/><b>PEC:</b> prestazioni.switchconvoltura.aen@pec.a2a.eu<br/><b>Web:</b> www.a2aenergia.eu</small></p></body></html>";
    } else {
      return "<!DOCTYPE html><html><head><meta charset=&apos;ISO-8859-1&apos;><style type=&apos;text/css&apos;>body, html{margin: 0px;padding: 0px;}p{font-family: Calibri, Verdana, Sans-Serif;}p.normale{font-size: 12px;}p.grande {font-size: 14px;}</style></head><body><p class=&apos;normale&apos;>Buongiorno,<br>in allegato il file per la richiesta prestazione.</p><p class=&apos;normale&apos;>Con i migliori saluti.</p><p class=&apos;grande&apos;><img src=&apos;http://www.a2aenergia.eu/home/export/system/modules/it.eutile.a2acommerciale/resources/a2aenergia/logo.gif&apos;/><br/>A2A Energia Spa<br/>Back Office<br/><small>Tel. 02.7720.3169<br/>Tel. 02.7720.3712<br/>Fax  02.7601.6206</small></p></body></html>";
    }

  }
}
