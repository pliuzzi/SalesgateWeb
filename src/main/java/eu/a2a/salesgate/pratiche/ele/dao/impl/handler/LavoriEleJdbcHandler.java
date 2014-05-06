package eu.a2a.salesgate.pratiche.ele.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;

public class LavoriEleJdbcHandler extends JdbcHandler<LavoriEle> {

  @Override
  protected LavoriEle createObjectFromResultSet(ResultSet rs) throws SQLException {
    LavoriEle lavoriEle = new LavoriEle();
    lavoriEle.setId(rs.getString("ID"));
    lavoriEle.setCodServizio(rs.getString("COD_SERVIZIO"));
    lavoriEle.setCodFlusso(rs.getString("COD_FLUSSO"));
    lavoriEle.setSistemaSorgente(rs.getString("SISTEMA_SORGENTE"));
    lavoriEle.setIdSistemaSorgente(rs.getString("ID_SISTEMA_SORGENTE"));
    lavoriEle.setPod(rs.getString("POD"));
    lavoriEle.setPresa(rs.getString("PRESA"));
    lavoriEle.setDataRicezione(rs.getDate("DATA_RICEZIONE"));
    lavoriEle.setDataInserimento(rs.getDate("DATA_INSERIMENTO"));
    lavoriEle.setVerificaFormale(rs.getBigDecimal("VERIFICA_FORMALE"));
    lavoriEle.setVerificaEsito(rs.getBigDecimal("VERIFICA_ESITO"));
    lavoriEle.setCodicePraticaDl(rs.getString("CODICE_PRATICA_DL"));
    lavoriEle.setDataAmmissibilita(rs.getDate("DATA_AMMISSIBILITA"));
    lavoriEle.setStato(rs.getString("STATO"));
    lavoriEle.setCaseNumberException(rs.getString("CASE_NUMBER_EXCEPTION"));
    lavoriEle.setCaseNumber(rs.getString("CASE_NUMBER"));
    lavoriEle.setCanaleSg(rs.getString("CANALE_SG"));
    lavoriEle.setMercato(rs.getString("MERCATO"));
    lavoriEle.setCreated(rs.getDate("CREATED"));
    lavoriEle.setCreatedBy(rs.getString("CREATED_BY"));
    lavoriEle.setLastUpdated(rs.getDate("LAST_UPDATED"));
    lavoriEle.setLastUpdatedBy(rs.getString("LAST_UPDATED_BY"));
    lavoriEle.setFkDistributore(rs.getString("FK_DISTRIBUTORE"));
    lavoriEle.setFkAmmissibilita(rs.getString("FK_AMMISSIBILITA"));
    return lavoriEle;
  }

}
