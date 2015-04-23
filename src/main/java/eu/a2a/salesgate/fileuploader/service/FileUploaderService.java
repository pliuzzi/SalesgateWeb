package eu.a2a.salesgate.fileuploader.service;

import java.util.List;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderInstanceItem;

public interface FileUploaderService {
	List<RootNode> estraiElencoFileUploader(String... groupBy);
	List<RootNode> estraiElencoFileUploaderVenditore(String... groupBy);
	List<FileUploaderInstanceItem> estraiElencoFileUploaderInstances(String eventCode);
	FileUploaderInstanceItem estraiFileUploaderInstance(String eventCode, String objectId);
	GenericResponse startFileUploader(byte[] fileContent, String fileName, String eventCode, String user);
	
}
