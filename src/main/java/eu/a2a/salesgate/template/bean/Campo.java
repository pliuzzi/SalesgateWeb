package eu.a2a.salesgate.template.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class Campo extends CodDescBean {

  private static final long serialVersionUID = -1387841101059210374L;
  private String nomeLogico;
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

}
