package eu.a2a.salesgate.files.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.files.bean.Files;
import eu.a2a.salesgate.files.dao.FilesDAO;
import eu.a2a.salesgate.files.service.FilesService;

@Service("filesServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class FilesServiceImpl implements FilesService {

  @Autowired
  private FilesDAO filesDaoSalesgate;

  @Override
  public Files estraiFiles(String id) {

    Files file = filesDaoSalesgate.estraiFiles(id);

    return file;
  }

}
