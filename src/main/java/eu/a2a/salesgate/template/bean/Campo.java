package eu.a2a.salesgate.template.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class Campo extends CodDescBean {

  private static final long serialVersionUID = -1387841101059210374L;
  public static final String CAMPO_VUOTO = "COTICHE";
  public static final String CAMPO_VUOTO_SQL = "null";
  private String nomeLogico;
  private String nomeFisico;
  private String categoria;
  private int posizione;

  public String getNomeLogico() {
    return nomeLogico;
  }

  public void setNomeLogico(String nomeLogico) {
    this.nomeLogico = nomeLogico;
  }

  public String getCategoria() {
    return categoria;
  }

  public void setCategoria(String categoria) {
    this.categoria = categoria;
  }

  public int getPosizione() {
    return posizione;
  }

  public void setPosizione(int posizione) {
    this.posizione = posizione;
  }

  public String getNomeFisico() {
    return nomeFisico;
  }

  public void setNomeFisico(String nomeFisico) {
    this.nomeFisico = nomeFisico;
  }

  public boolean isCampoVuoto() {

    return nomeFisico.equalsIgnoreCase(CAMPO_VUOTO);
  }

}
