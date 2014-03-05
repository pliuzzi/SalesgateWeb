package eu.a2a.salesgate.cutoff.bean;

import java.util.List;

import eu.a2a.salesgate.bean.CodDescBean;

public class TreeNode extends CodDescBean {

  /**
   * 
   */
  private static final long serialVersionUID = 4730863840238543244L;
  private List<TreeNode> nodes;
  private String stato;

  public TreeNode(String id, String label) {
    super(id, label);
  }

  public List<TreeNode> getNodes() {
    return nodes;
  }

  public void setNodes(List<TreeNode> nodes) {
    this.nodes = nodes;
  }

  public String getStato() {
    return stato;
  }

  public void setStato(String stato) {
    this.stato = stato;
  }
}
