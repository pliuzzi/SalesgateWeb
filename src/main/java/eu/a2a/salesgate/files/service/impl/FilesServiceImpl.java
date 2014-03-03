package eu.a2a.salesgate.files.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.a2a.salesgate.files.bean.Files;
import eu.a2a.salesgate.files.dao.FilesDAO;
import eu.a2a.salesgate.files.service.FilesService;

@Service
public class FilesServiceImpl implements FilesService {

  @Autowired
  private FilesDAO filesDao;

  @Override
  public Files estraiFiles(String id) {

    Files file = filesDao.estraiFiles(id);

    return file;
  }

}
