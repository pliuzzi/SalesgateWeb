package eu.a2a.salesgate.cutoff.service.impl;

import static ch.lambdaj.Lambda.by;
import static ch.lambdaj.Lambda.group;
import static ch.lambdaj.Lambda.on;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ch.lambdaj.group.Group;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.bean.tree.TreeNode;
import eu.a2a.salesgate.cutoff.bean.CutOffItem;
import eu.a2a.salesgate.cutoff.dao.CutOffDAO;
import eu.a2a.salesgate.cutoff.helper.CutOffHelper;
import eu.a2a.salesgate.cutoff.service.CutOffService;
import eu.a2a.salesgate.files.bean.Files;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.service.TemplateService;

@Service("cutOffServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class CutOffServiceImpl implements CutOffService {

  @Autowired
  private CutOffDAO cutOffDaoSalesgate;

  @Autowired
  private TemplateService templateServiceSalesgate;

  @Override
  public List<RootNode> estraiElencoCutoff(String stato, String... groupBy) {

    List<CutOffItem> list = cutOffDaoSalesgate.estraiAllCutOff(stato);

    List<RootNode> nodes = null;
    Group<CutOffItem> groupUtility = group(list, by(on(CutOffItem.class).getUtility()));
    nodes = new ArrayList<RootNode>(groupUtility.getSize());
    for (Group<CutOffItem> itemUtility : groupUtility.subgroups()) {
      RootNode node = new RootNode((String) itemUtility.key());
      Group<CutOffItem> groupFirstLevel = group(itemUtility.findAll(), groupBy[0]);
      List<TreeNode> firstLevels = new ArrayList<TreeNode>(groupFirstLevel.getSize());
      for (Group<CutOffItem> itemFirstLevel : groupFirstLevel.subgroups()) {
        TreeNode firstLevelItem = new TreeNode((String) itemFirstLevel.key(), (String) itemFirstLevel.key());
        Group<CutOffItem> groupSecondlevel = group(itemFirstLevel.findAll(), groupBy[1]);
        List<TreeNode> secondLevels = new ArrayList<TreeNode>(groupSecondlevel.getSize());
        for (Group<CutOffItem> itemSecondLevels : groupSecondlevel.subgroups()) {
          TreeNode secondLevelItem = new TreeNode((String) itemSecondLevels.key(), (String) itemSecondLevels.key());
          Group<CutOffItem> groupFiles = group(itemSecondLevels.findAll(), by(on(CutOffItem.class).getFiles()));
          List<TreeNode> files = new ArrayList<TreeNode>(itemSecondLevels.getSize());
          for (Group<CutOffItem> itemFiles : groupFiles.subgroups()) {
            for (CutOffItem item : itemFiles.findAll()) {
              TreeNode file = new TreeNode(item.getFiles().getId(), item.getFiles().getCodiceFlusso() + " - " + item.getFiles().getCreated() + " - " + item.getFiles().getContaRighe() + " Record");
              file.setStato(item.getFiles().getStatoFile());
              files.add(file);
            }
          }
          secondLevelItem.setNodes(files);
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
  public ByteArrayOutputStream eseguiCutOff(String id) {

    try {
      HashMap<String, String> updateStatoParams = new HashMap<>();
      updateStatoParams.put("id", id);
      updateStatoParams.put("stato_file", "IN_ELABORAZIONE");
      cutOffDaoSalesgate.updateStato(id, "IN_ELABORAZIONE");

      Files f = estraiCutoff(id).getFiles();

      TemplateInstance ti = templateServiceSalesgate.getTemplate(f.getFkTemplateInstance());

      List<String> requestContent = cutOffDaoSalesgate.estraiRequestContent(id, ti.getUtility());

      /* esegui cutoff */
      ByteArrayOutputStream file = CutOffHelper.createCutOff(f.getTipoFile(), ti.getAnagTemplate().getFirstRow(), ti.getAnagTemplate().getSeparatore(), requestContent, new ByteArrayInputStream(ti.getAnagTemplate().getFileContent()));

      cutOffDaoSalesgate.updateFile(id, file.toByteArray());

      cutOffDaoSalesgate.updateStato(id, "ELABORATO");

      return file;
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  @Override
  public CutOffItem estraiCutoff(String id) {
    return cutOffDaoSalesgate.estraiCutOff(id);
  }

  @Override
  public void chiudiCutOff(String id, String closedBy) {
    cutOffDaoSalesgate.chiudiCutOff(id, closedBy);
  }

}
