package eu.a2a.salesgate.etl.service.impl;

import static ch.lambdaj.Lambda.by;
import static ch.lambdaj.Lambda.group;
import static ch.lambdaj.Lambda.on;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ch.lambdaj.group.Group;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.bean.tree.TreeNode;
import eu.a2a.salesgate.etl.bean.ETLInstanceItem;
import eu.a2a.salesgate.etl.bean.ETLItem;
import eu.a2a.salesgate.etl.dao.ETLDAO;
import eu.a2a.salesgate.etl.service.ETLService;
import eu.a2a.salesgate.service.base.AbstractService;

@Service("etlServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class ETLServiceImpl extends AbstractService implements ETLService {

  @Autowired
  private ETLDAO etlDaoSalesgate;

  @Override
  public List<RootNode> estraiElencoETL(String... groupBy) {

    List<ETLItem> list = etlDaoSalesgate.estraiAllETLItem();

    List<RootNode> nodes = null;
    Group<ETLItem> groupUtility = group(list, by(on(ETLItem.class).getUtility()));
    nodes = new ArrayList<RootNode>(groupUtility.getSize());
    for (Group<ETLItem> itemUtility : groupUtility.subgroups()) {
      RootNode node = new RootNode((String) itemUtility.key());
      Group<ETLItem> groupFirstLevel = group(itemUtility.findAll(), groupBy[0]);
      List<TreeNode> firstLevels = new ArrayList<TreeNode>(groupFirstLevel.getSize());
      for (Group<ETLItem> itemFirstLevel : groupFirstLevel.subgroups()) {
        TreeNode firstLevelItem = new TreeNode((String) itemFirstLevel.key(), (String) itemFirstLevel.key());
        Group<ETLItem> groupSecondlevel = group(itemFirstLevel.findAll(), groupBy[1]);
        List<TreeNode> secondLevels = new ArrayList<TreeNode>(groupSecondlevel.getSize());
        for (Group<ETLItem> itemSecondLevels : groupSecondlevel.subgroups()) {
          TreeNode secondLevelItem = new TreeNode((String) itemSecondLevels.key(), (String) itemSecondLevels.key());
          Group<ETLItem> groupThirdLevel = group(itemSecondLevels.findAll(), by(on(ETLItem.class).getEventCode()));
          List<TreeNode> thirdLevels = new ArrayList<TreeNode>(itemSecondLevels.getSize());
          for (Group<ETLItem> itemFiles : groupThirdLevel.subgroups()) {
            for (ETLItem item : itemFiles.findAll()) {
              TreeNode thirdLevelItem = new TreeNode(item.getEventCode(), "Flusso " + item.getFlusso().getId());
              thirdLevels.add(thirdLevelItem);
            }
          }
          secondLevelItem.setNodes(thirdLevels);
          secondLevels.add(secondLevelItem);
        }
        firstLevelItem.setNodes(secondLevels);
        firstLevels.add(firstLevelItem);
      }
      node.setNodes(firstLevels);
      nodes.add(node);
    }

    return nodes;
  }

  @Override
  public List<ETLInstanceItem> estraiElencoETLInstances(String eventCode) {

    return etlDaoSalesgate.estraiAllInstances(eventCode);
  }

  @Override
  public ETLInstanceItem estraiETLInstance(String eventCode, String objId) {
    return etlDaoSalesgate.estraiETLInstance(eventCode, objId);
  }

}
