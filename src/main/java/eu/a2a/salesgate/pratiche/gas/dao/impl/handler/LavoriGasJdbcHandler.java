package eu.a2a.salesgate.pratiche.gas.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;

public class LavoriGasJdbcHandler extends JdbcHandler<LavoriGas> {

  @Override
  protected LavoriGas createObjectFromResultSet(ResultSet rs) throws SQLException {
    LavoriGas lavoriGas = new LavoriGas();
    lavoriGas.setId(rs.getString("ID"));
    lavoriGas.setCodServizio(rs.getString("COD_SERVIZIO"));
    lavoriGas.setCodFlusso(rs.getString("COD_FLUSSO"));
    lavoriGas.setSistemaSorgente(rs.getString("SISTEMA_SORGENTE"));
    lavoriGas.setIdSistemaSorgente(rs.getString("ID_SISTEMA_SORGENTE"));
    lavoriGas.setPdr(rs.getString("PDR"));
    lavoriGas.setPresa(rs.getString("PRESA"));
    lavoriGas.setDataRicezione(rs.getDate("DATA_RICEZIONE"));
    lavoriGas.setDataInserimento(rs.getDate("DATA_INSERIMENTO"));
    lavoriGas.setVerificaFormale(rs.getBigDecimal("VERIFICA_FORMALE"));
    lavoriGas.setVerificaEsito(rs.getBigDecimal("VERIFICA_ESITO"));
    lavoriGas.setCodicePraticaDl(rs.getString("CODICE_PRATICA_DL"));
    lavoriGas.setCodicePraticaDlPrec(rs.getString("CODICE_PRATICA_DL_PREC"));
    lavoriGas.setDataAmmissibilita(rs.getDate("DATA_AMMISSIBILITA"));
    lavoriGas.setStato(rs.getString("STATO"));
    lavoriGas.setCaseNumberException(rs.getString("CASE_NUMBER_EXCEPTION"));
    lavoriGas.setCaseNumber(rs.getString("CASE_NUMBER"));
    lavoriGas.setCanaleSg(rs.getString("CANALE_SG"));
    lavoriGas.setMercato(rs.getString("MERCATO"));
    lavoriGas.setCreated(rs.getDate("CREATED"));
    lavoriGas.setCreatedBy(rs.getString("CREATED_BY"));
    lavoriGas.setLastUpdated(rs.getDate("LAST_UPDATED"));
    lavoriGas.setLastUpdatedBy(rs.getString("LAST_UPDATED_BY"));
    lavoriGas.setFkDistributore(rs.getString("FK_DISTRIBUTORE"));
    lavoriGas.setFkAmmissibilita(rs.getString("FK_AMMISSIBILITA"));
    return lavoriGas;
  }

}
