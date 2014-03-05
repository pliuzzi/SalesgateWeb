package eu.a2a.salesgate.cutoff.bean;

import java.util.List;

import eu.a2a.salesgate.bean.CodDescBean;

public class RootNode extends CodDescBean {

  private static final long serialVersionUID = 8059040530290761431L;
  private String utility;
  private List<TreeNode> nodes;

  public RootNode() {
    this("");
  }

  public RootNode(String utility) {
    super();
    this.utility = utility;
  }

  public List<TreeNode> getNodes() {
    return nodes;
  }

  public void setNodes(List<TreeNode> nodes) {
    this.nodes = nodes;
  }

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

}
