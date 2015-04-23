package eu.a2a.salesgate.fileuploader.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tika.detect.Detector;
import org.apache.tika.metadata.Metadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.converter.excel.ExcelConverter;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderInstanceItem;
import eu.a2a.salesgate.fileuploader.service.FileUploaderService;
import eu.a2a.salesgate.utility.service.UtilityService;

@Controller
public class FileUploaderController extends AbstractController {
	@Autowired
	FileUploaderService fileUploaderServiceSdm;
	@Autowired
	private Detector defaultDetector;
	@Autowired
	private UtilityService utilityServiceSdm;
	
	@RequestMapping(value = {"/app/fileUploader/elenco"})
	public String getListEtl(Model model, WebRequest request, Principal principal, HttpSession session) {
		return "app/fileUploader/elenco";
	}
	
	@RequestMapping(value = { "/app/fileUploader/tree/{origine}" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String getTreeFileUploader(@PathVariable("origine") String origine, Model model, WebRequest request, Principal principal, HttpSession session) {
		if ("DISTRIBUTORE".equals(origine)) {
			List<RootNode> list1 = fileUploaderServiceSdm.estraiElencoFileUploader("distributore.name", "servizio.code");
			List<RootNode> list2 = fileUploaderServiceSdm.estraiElencoFileUploader("servizio.code", "distributore.name");
			model.addAttribute("fileUploaderNodeDistributore", list1);
			model.addAttribute("fileUploaderNodeServizio", list2);
			model.addAttribute("origineSelezionata", "Distributore");
			return "app/fileUploader/tree";
		}
		else {
			List<RootNode> list1 = fileUploaderServiceSdm.estraiElencoFileUploaderVenditore("venditore.nome", "servizio.code");
			List<RootNode> list2 = fileUploaderServiceSdm.estraiElencoFileUploaderVenditore("servizio.code", "venditore.nome");
			model.addAttribute("fileUploaderNodeDistributore", list1);
			model.addAttribute("fileUploaderNodeServizio", list2);
			model.addAttribute("origineSelezionata", "Venditore");
			return "app/fileUploader/tree";
		}
	}
	
	@RequestMapping(value = "/app/json/fileUploader/upload", method = RequestMethod.POST)
	public @ResponseBody Object uploadTemplateFile(@RequestParam("files[]") MultipartFile file, @RequestParam("eventCode") String eventCode, Model model, WebRequest request, Principal principal, HttpSession session) {
		HashMap<String, Object> res = new HashMap<>();
		try {
			List<HashMap<String, Object>> files = new ArrayList<>();
			HashMap<String, Object> fileItem = new HashMap<>();
			fileItem.put("name", file.getOriginalFilename());
			files.add(fileItem);
			Metadata metadata = new Metadata();
			metadata.add(Metadata.RESOURCE_NAME_KEY, file.getOriginalFilename());
			String mimeType = defaultDetector.detect(null, metadata).toString();
			FileType fileType = utilityServiceSdm.estraiFileType(mimeType);
			ByteArrayOutputStream convertedFile = ExcelConverter.convert(file.getInputStream(), mimeType);
			if (fileType != null) {
				GenericResponse fileUploaderResponse = fileUploaderServiceSdm.startFileUploader(convertedFile.toByteArray(), file.getOriginalFilename(), eventCode, principal.getName());
				if(fileUploaderResponse.isOk()) {
					res.put("files", files);
					res.put("fileTypeId", fileType.getId());
					res.put("fileTypeDesc", fileType.getDescription());
				}
				else {
					res.put("codErrore", "GEN_ERR");
					res.put("descErrore", fileUploaderResponse.getDescription());
				}
			}
			else {
				res.put("codErrore", "INV_FIL");
				res.put("descErrore", "Il tipo file non è supportato");
			}
		}
		catch(IOException e) {
			res.put("codErrore", "GEN_ERR");
			res.put("descErrore", e.getMessage());
		}
		return res;
	}
	
	@RequestMapping(value = { "/app/fileUploader/{eventCode}/istanze" }, method = RequestMethod.GET)
	public String viewFileUploaderInstances(@PathVariable("eventCode") String eventCode, Model model, WebRequest request, Principal principal, HttpSession session) {
		List<FileUploaderInstanceItem> item = fileUploaderServiceSdm.estraiElencoFileUploaderInstances(eventCode);
		model.addAttribute("istanze", item);
		model.addAttribute("eventCode", eventCode);
		return "app/fileUploader/istanze";
	}
	
	@RequestMapping(value = { "/app/fileUploader/{eventCode}/{objId}/staging" }, method = RequestMethod.GET)
	public String viewFileUploaderInstanceStaging(@PathVariable("eventCode") String eventCode, @PathVariable("objId") String objId, Model model, WebRequest request, Principal principal, HttpSession session) {
		FileUploaderInstanceItem item = fileUploaderServiceSdm.estraiFileUploaderInstance(eventCode, objId);
		model.addAttribute("istanza", item);
		return "app/fileUploader/istanza";
	}
	
	@RequestMapping(value = { "/app/fileUploader/{eventCode}/{objId}/scarti" }, method = RequestMethod.GET)
	public @ResponseBody Object eseguiCutOff(@PathVariable("eventCode") String eventCode, @PathVariable("objId") String objId, Model model, WebRequest request, Principal principal, HttpSession session, HttpServletResponse response) throws IOException {
		FileUploaderInstanceItem item = fileUploaderServiceSdm.estraiFileUploaderInstance(eventCode, objId);
		String nome = "Scarti_" + item.getFileName() + ".csv";
		byte[] fileContent = item.getFileScarti();
		response.setHeader("Content-Disposition", "attachment;filename=\"" + nome + "\"");
		OutputStream out = response.getOutputStream();
		Detector detector = getDefaultDetectors();
		Metadata metadata = new Metadata();
		metadata.add(Metadata.RESOURCE_NAME_KEY, nome);
		response.setContentType(detector.detect(null, metadata).getType());
		response.setContentLength(fileContent.length);
		Cookie fileDownloadCookie = new Cookie("fileDownload", "true");
		fileDownloadCookie.setPath("/");
		response.addCookie(fileDownloadCookie);
		FileCopyUtils.copy(fileContent, out);
		out.flush();
		out.close();
		return "eseguiCutOff";
	}
	
}
