package eu.a2a.salesgate.pratiche.service;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.pratiche.bean.Tracking;

public interface AmmissibilitaService {

  Tracking getTracking(String id);

  GenericResponse aggiornaAmmissibilita(Tracking tracking);

}
