package eu.a2a.salesgate.fileuploader.dao;

import java.util.List;

import eu.a2a.salesgate.fileuploader.bean.FileUploaderInstanceItem;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderItem;

public interface FileUploaderDAO {
	List<FileUploaderItem> estraiAllFileUploaderItem();
	List<FileUploaderItem> estraiAllFileUploaderItemVenditore();
	List<FileUploaderInstanceItem> estraiAllFileUploaderInstancesItem(String eventCode);
	FileUploaderInstanceItem estraiFileUploaderInstance(String ecentCode, String objectId);
	int startFileUploader(String eventCode, String fileName, String user);
	
}
