package eu.a2a.salesgate.pec.service;

import java.io.IOException;

import eu.a2a.salesgate.cutoff.bean.CutOffItem;

public interface PecService {

  /*
   * String decodeMercato(String cutOffId);
   * 
   * String decodeCodicePraticaUtente(String cutOffId);
   * 
   * String decodeCodPodPdr(String cutOffId);
   * 
   * String decodeSubject(String cutOffId);
   * 
   * String decodeContent(String codServizio);
   */

  String sendPec(CutOffItem cutOffItem, byte[] fileContent) throws IOException;

}
