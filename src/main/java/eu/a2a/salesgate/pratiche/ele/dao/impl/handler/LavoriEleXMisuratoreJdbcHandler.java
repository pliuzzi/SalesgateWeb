package eu.a2a.salesgate.pratiche.ele.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXMisuratore;

public class LavoriEleXMisuratoreJdbcHandler extends JdbcHandler<LavoriEleXMisuratore> {

  @Override
  protected LavoriEleXMisuratore createObjectFromResultSet(ResultSet rs) throws SQLException {
    LavoriEleXMisuratore lavoriEleXMisuratore = new LavoriEleXMisuratore();
    lavoriEleXMisuratore.setId(rs.getString("ID"));
    lavoriEleXMisuratore.setMisuratoreElettronico(rs.getString("MISURATORE_ELETTRONICO"));
    lavoriEleXMisuratore.setMatricolaMisAttiva(rs.getString("MATRICOLA_MIS_ATTIVA"));
    lavoriEleXMisuratore.setMatricolaMisReattiva(rs.getString("MATRICOLA_MIS_REATTIVA"));
    lavoriEleXMisuratore.setMatricolaMisPotenza(rs.getString("MATRICOLA_MIS_POTENZA"));
    lavoriEleXMisuratore.setTipologiaMisuratore(rs.getString("TIPOLOGIA_MISURATORE"));
    lavoriEleXMisuratore.setCostanteTrasfAttiva(rs.getString("COSTANTE_TRASF_ATTIVA"));
    lavoriEleXMisuratore.setCostanteTrasfReattiva(rs.getString("COSTANTE_TRASF_REATTIVA"));
    lavoriEleXMisuratore.setCostanteTrasfPotenza(rs.getString("COSTANTE_TRASF_POTENZA"));
    lavoriEleXMisuratore.setLetturaAttivaF1(rs.getString("LETTURA_ATTIVAF1"));
    lavoriEleXMisuratore.setLetturaAttivaF2(rs.getString("LETTURA_ATTIVAF2"));
    lavoriEleXMisuratore.setLetturaAttivaF3(rs.getString("LETTURA_ATTIVAF3"));
    lavoriEleXMisuratore.setLetturaReattivaF1(rs.getString("LETTURA_REATTIVAF1"));
    lavoriEleXMisuratore.setLetturaReattivaF2(rs.getString("LETTURA_REATTIVAF2"));
    lavoriEleXMisuratore.setLetturaReattivaF3(rs.getString("LETTURA_REATTIVAF3"));
    lavoriEleXMisuratore.setLetturaPotenzaF1(rs.getString("LETTURA_POTENZAF1"));
    lavoriEleXMisuratore.setLetturaPotenzaF2(rs.getString("LETTURA_POTENZAF2"));
    lavoriEleXMisuratore.setLetturaPotenzaF3(rs.getString("LETTURA_POTENZAF3"));
    lavoriEleXMisuratore.setDataLettura(rs.getDate("DATA_LETTURA"));
    lavoriEleXMisuratore.setTipologiaLettura(rs.getString("TIPOLOGIA_LETTURA"));
    lavoriEleXMisuratore.setCreated(rs.getDate("CREATED"));
    lavoriEleXMisuratore.setLastUpdated(rs.getDate("LAST_UPDATED"));
    lavoriEleXMisuratore.setDataDisattivazione(rs.getDate("DATA_DISATTIVAZIONE"));
    return lavoriEleXMisuratore;
  }

}
