package eu.a2a.salesgate.log.bean;

import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;

public class TibcoAudit extends CodDescBean {

  private static final long serialVersionUID = -2330915184040881291L;
  private String serviceName;
  private String processName;
  private String serviceType;
  private String businessId;
  private String sourceSystem;
  private String destinationSystem;
  private String destination;
  private String podPdr;
  private String appKey1;
  private String appKey2;
  private String appKey3;
  private String esito;
  private String descrizioneEsito;
  private String message;
  private Date messageTimestamp;
  private String messageType;
  private String state;

  public String getServiceName() {
    return serviceName;
  }

  public void setServiceName(String serviceName) {
    this.serviceName = serviceName;
  }

  public String getProcessName() {
    return processName;
  }

  public void setProcessName(String processName) {
    this.processName = processName;
  }

  public String getServiceType() {
    return serviceType;
  }

  public void setServiceType(String serviceType) {
    this.serviceType = serviceType;
  }

  public String getBusinessId() {
    return businessId;
  }

  public void setBusinessId(String businessId) {
    this.businessId = businessId;
  }

  public String getSourceSystem() {
    return sourceSystem;
  }

  public void setSourceSystem(String sourceSystem) {
    this.sourceSystem = sourceSystem;
  }

  public String getDestinationSystem() {
    return destinationSystem;
  }

  public void setDestinationSystem(String destinationSystem) {
    this.destinationSystem = destinationSystem;
  }

  public String getDestination() {
    return destination;
  }

  public void setDestination(String destination) {
    this.destination = destination;
  }

  public String getPodPdr() {
    return podPdr;
  }

  public void setPodPdr(String podPdr) {
    this.podPdr = podPdr;
  }

  public String getAppKey1() {
    return appKey1;
  }

  public void setAppKey1(String appKey1) {
    this.appKey1 = appKey1;
  }

  public String getAppKey2() {
    return appKey2;
  }

  public void setAppKey2(String appKey2) {
    this.appKey2 = appKey2;
  }

  public String getAppKey3() {
    return appKey3;
  }

  public void setAppKey3(String appKey3) {
    this.appKey3 = appKey3;
  }

  public String getEsito() {
    return esito;
  }

  public void setEsito(String esito) {
    this.esito = esito;
  }

  public String getDescrizioneEsito() {
    return descrizioneEsito;
  }

  public void setDescrizioneEsito(String descrizioneEsito) {
    this.descrizioneEsito = descrizioneEsito;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Date getMessageTimestamp() {
    return messageTimestamp;
  }

  public void setMessageTimestamp(Date messageTimestamp) {
    this.messageTimestamp = messageTimestamp;
  }

  public String getMessageType() {
    return messageType;
  }

  public void setMessageType(String messageType) {
    this.messageType = messageType;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

}
