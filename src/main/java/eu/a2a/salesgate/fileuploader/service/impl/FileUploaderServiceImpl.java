package eu.a2a.salesgate.fileuploader.service.impl;

import static ch.lambdaj.Lambda.by;
import static ch.lambdaj.Lambda.group;
import static ch.lambdaj.Lambda.on;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.integration.Message;
import org.springframework.integration.MessageChannel;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ch.lambdaj.group.Group;
import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.bean.tree.TreeNode;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderInstanceItem;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderItem;
import eu.a2a.salesgate.fileuploader.dao.FileUploaderDAO;
import eu.a2a.salesgate.fileuploader.service.FileUploaderService;
import eu.a2a.salesgate.service.base.AbstractService;

@Service("fileUploaderServiceSdm")
@Transactional("transactionManagerSdm")
public class FileUploaderServiceImpl extends AbstractService implements FileUploaderService {
	@Autowired
	private FileUploaderDAO fileUploaderDaoSdm;
	@Autowired
	private MessageChannel ftpOutputChannel;
	
	@Override
	public List<RootNode> estraiElencoFileUploader(String... groupBy) {
		List<FileUploaderItem> list = fileUploaderDaoSdm.estraiAllFileUploaderItem();
		List<RootNode> nodes = null;
		Group<FileUploaderItem> groupUtility = group(list, by(on(FileUploaderItem.class).getUtility()));
		nodes = new ArrayList<RootNode>(groupUtility.getSize());
		for(Group<FileUploaderItem> itemUtility : groupUtility.subgroups()) {
			RootNode node = new RootNode((String) itemUtility.key());
			Group<FileUploaderItem> groupFirstLevel = group(itemUtility.findAll(), groupBy[0]);
			List<TreeNode> firstLevels = new ArrayList<TreeNode>(groupFirstLevel.getSize());
			for (Group<FileUploaderItem> itemFirstLevel : groupFirstLevel.subgroups()) {
				TreeNode firstLevelItem = new TreeNode((String) itemFirstLevel.key(), (String) itemFirstLevel.key());
				Group<FileUploaderItem> groupSecondLevel = group(itemFirstLevel.findAll(), groupBy[1]);
				List<TreeNode> secondLevels = new ArrayList<TreeNode>(groupSecondLevel.getSize());
				for (Group<FileUploaderItem> itemSecondLevel : groupSecondLevel.subgroups()) {
					TreeNode secondLevelItem = new TreeNode((String) itemSecondLevel.key(), (String) itemSecondLevel.key());
					Group<FileUploaderItem> groupThirdLevel = group(itemSecondLevel.findAll(), by(on(FileUploaderItem.class).getEventCode()));
					List<TreeNode> thirdLevels = new ArrayList<TreeNode>(itemSecondLevel.getSize());
					for(Group<FileUploaderItem> itemFiles : groupThirdLevel.subgroups()) {
						for(FileUploaderItem item : itemFiles.findAll()) {
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
	public List<RootNode> estraiElencoFileUploaderVenditore(String... groupBy) {
		List<FileUploaderItem> list = fileUploaderDaoSdm.estraiAllFileUploaderItemVenditore();
		List<RootNode> nodes = null;
		Group<FileUploaderItem> groupUtility = group(list, by(on(FileUploaderItem.class).getUtility()));
		nodes = new ArrayList<RootNode>(groupUtility.getSize());
		for(Group<FileUploaderItem> itemUtility : groupUtility.subgroups()) {
			RootNode node = new RootNode((String) itemUtility.key());
			Group<FileUploaderItem> groupFirstLevel = group(itemUtility.findAll(), groupBy[0]);
			List<TreeNode> firstLevels = new ArrayList<TreeNode>(groupFirstLevel.getSize());
			for (Group<FileUploaderItem> itemFirstLevel : groupFirstLevel.subgroups()) {
				TreeNode firstLevelItem = new TreeNode((String) itemFirstLevel.key(), (String) itemFirstLevel.key());
				Group<FileUploaderItem> groupSecondLevel = group(itemFirstLevel.findAll(), groupBy[1]);
				List<TreeNode> secondLevels = new ArrayList<TreeNode>(groupSecondLevel.getSize());
				for (Group<FileUploaderItem> itemSecondLevel : groupSecondLevel.subgroups()) {
					TreeNode secondLevelItem = new TreeNode((String) itemSecondLevel.key(), (String) itemSecondLevel.key());
					Group<FileUploaderItem> groupThirdLevel = group(itemSecondLevel.findAll(), by(on(FileUploaderItem.class).getEventCode()));
					List<TreeNode> thirdLevels = new ArrayList<TreeNode>(itemSecondLevel.getSize());
					for(Group<FileUploaderItem> itemFiles : groupThirdLevel.subgroups()) {
						for(FileUploaderItem item : itemFiles.findAll()) {
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
	public List<FileUploaderInstanceItem> estraiElencoFileUploaderInstances(String eventCode) {
		return fileUploaderDaoSdm.estraiAllFileUploaderInstancesItem(eventCode);
	}
	
	@Override
	public FileUploaderInstanceItem estraiFileUploaderInstance(String eventCode, String objectId) {
		return fileUploaderDaoSdm.estraiFileUploaderInstance(eventCode,  objectId);
	}
	
	@Override
	public GenericResponse startFileUploader(byte[] fileContent, String fileName, String eventCode, String user) {
		Message<byte[]> message = MessageBuilder.withPayload(fileContent).setHeader("file_name", fileName).build();
		if(ftpOutputChannel.send(message)) {
			int idRun = fileUploaderDaoSdm.startFileUploader(eventCode, fileName, user);
			return GenericResponse.createOkResponse(idRun + "");
		}
		else {
			return GenericResponse.createKoResponse("Impossibile inviare il file.");
		}
	}

}
