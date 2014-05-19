package eu.a2a.salesgate.cutoff.helper;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
//import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import eu.a2a.salesgate.base.Loggable;

public class CutOffHelper extends Loggable {

  public static ByteArrayOutputStream createCutOff(String fileType, Integer firstRow, String separatore, List<String> records, InputStream templateFile) throws IOException {

    ByteArrayOutputStream result = null;

    // boolean append = fileType.toUpperCase().endsWith("CSV");

    if (fileType.toUpperCase().endsWith("CSV")) {
      result = createCutOffCSV(records, separatore, templateFile);
    } else if (fileType.toUpperCase().endsWith("XLS")) {
      result = createCutOffXLS(records, firstRow.toString(), templateFile);
    } else if (fileType.toUpperCase().endsWith("XLSX")) {
      result = createCutOffXLSX(records, firstRow.toString(), templateFile);
    } else {
      throw new IllegalArgumentException("fileType non riconosciuto --> " + fileType);
    }

    return result;

  }

  private static ByteArrayOutputStream createCutOffCSV(List<String> records, String separatore, InputStream template) throws IOException {

    byte[] b = null;
    int bytesRead = 0;

    ByteArrayOutputStream generatedFile = new ByteArrayOutputStream();

    if (template != null) {
      // fis = new FileInputStream(fileInfo.getString("sourcepath"));
      b = new byte[4096];

      bytesRead = template.read(b);
      // generatedFile = new DataOutputStream(new ByteArrayOutputStream());
      generatedFile.write(b, 0, bytesRead);
      template.close();
    }
    byte[] costanti = new byte[2];
    costanti[0] = 13;
    costanti[1] = 10;

    for (int i = 0; i < records.size(); i++) {
      String queryResult = records.get(i);// .getString("query_result");
      String split = separatore;
      String[] queryFields = queryResult.split(";", -1);

      // System.out.println("Numero campi presenti nel record->"+queryFields.length);
      // System.out.println("Valore attributo campieffettivi->"+fileInfo.getInt("campieffettivi"));

      String out = "";

      for (int j = 0; j < queryFields.length; j++) {
        out += queryFields[j] + split;
      }
      out = out.substring(0, out.length() - split.length());
      if (i < records.size() - 1) {
        out += new String(costanti);
      }
      // generatedFile = new FileOutputStream(generatedFile);
      generatedFile.write(out.getBytes());
    }
    generatedFile.flush();
    generatedFile.close();

    return generatedFile;

  }

  private static ByteArrayOutputStream createCutOffXLS(List<String> records, String firstRow, InputStream template) throws IOException {

    ByteArrayOutputStream generatedFile = new ByteArrayOutputStream();

    HSSFWorkbook doc = null;
    POIFSFileSystem fs = null;
    HSSFSheet sheet = null;
    HSSFRow row = null;
    HSSFCell cell = null;

    int _firstRow = Integer.parseInt(firstRow);

    fs = new POIFSFileSystem(template);

    doc = new HSSFWorkbook(fs, true);
    sheet = doc.getSheet(doc.getSheetName(0));

    for (int i = 0; i < records.size(); i++) {
      String queryResult = records.get(i);

      String[] queryFields = queryResult.split(";");

      row = sheet.getRow(_firstRow + i);

      if (row == null) {
        row = sheet.createRow(_firstRow + i);
      }

      for (int j = 0; j < queryFields.length; j++) {
        cell = row.getCell(j);
        if (cell == null) {
          cell = row.createCell(j);
        }

        // HSSFRichTextString rts = new HSSFRichTextString(queryFields[j]); Non
        // scommentare questa riga altrimenti non va in tibco, non so il perch�

        cell.setCellValue(queryFields[j]);
        // cell.se
      }
    }

    doc.write(generatedFile);
    generatedFile.flush();
    generatedFile.close();

    return generatedFile;
  }

  private static ByteArrayOutputStream createCutOffXLSX(List<String> records, String firstRow, InputStream template) throws IOException {

    ByteArrayOutputStream generatedFile = new ByteArrayOutputStream();

    XSSFWorkbook doc = null;
    // POIFSFileSystem fs=null;
    XSSFSheet sheet = null;
    XSSFRow row = null;
    XSSFCell cell = null;

    int _firstRow = Integer.parseInt(firstRow);

    // fs = new POIFSFileSystem(template);

    doc = new XSSFWorkbook(template);
    sheet = doc.getSheet(doc.getSheetName(0));

    for (int i = 0; i < records.size(); i++) {
      String queryResult = records.get(i);

      String[] queryFields = queryResult.split(";");

      row = sheet.getRow(_firstRow + i);

      if (row == null) {
        row = sheet.createRow(_firstRow + i);
      }

      for (int j = 0; j < queryFields.length; j++) {
        cell = row.getCell(j);
        if (cell == null) {
          cell = row.createCell(j);
        }

        // HSSFRichTextString rts = new HSSFRichTextString(queryFields[j]); Non
        // scommentare questa riga altrimenti non va in tibco, non so il perch�

        cell.setCellValue(queryFields[j]);
        // cell.se
      }
    }

    doc.write(generatedFile);
    generatedFile.flush();
    generatedFile.close();

    return generatedFile;
  }

}
