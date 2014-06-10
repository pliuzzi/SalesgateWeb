package eu.a2a.salesgate.converter.excel;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFFormulaEvaluator;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

/**
 * @author Paolo Liuzzi
 * 
 */
@Component
public class ExcelConverter {

  private static String separator = ";";
  private static String decimalSeparator = ",";
  private static boolean crlf = true;

  private static final String EXCEL_2010_MIME_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
  private static final String EXCEL_2003_MIME_TYPE = "application/vnd.ms-excel";
  private static final String CSV_MIME_TYPE = "text/csv";

  private ExcelConverter() {
  }

  public static ByteArrayOutputStream convert(InputStream is, String mimeType) throws IOException {

    if (mimeType == null) {
      throw new IllegalArgumentException("Il mimeType non può essere nullo");
    }

    if (mimeType.equalsIgnoreCase(EXCEL_2010_MIME_TYPE)) {
      return convert(is, true);
    } else if (mimeType.equalsIgnoreCase(EXCEL_2003_MIME_TYPE)) {
      return convert(is, false);
    } else if (mimeType.equalsIgnoreCase(CSV_MIME_TYPE)) {
      ByteArrayOutputStream output = new ByteArrayOutputStream();
      IOUtils.copy(is, output);
      return output;
    }

    return null;

  }

  public static ByteArrayOutputStream convert(InputStream is, boolean isXlsx) throws IOException {

    ByteArrayOutputStream output = new ByteArrayOutputStream();

    byte[] costanti = null;

    if (crlf) {
      costanti = new byte[2];
      costanti[0] = 13;
      costanti[1] = 10;
    } else {
      costanti = new byte[1];
      costanti[0] = 10;
    }

    PrintStream ps = new PrintStream(output);

    Workbook workbook = (isXlsx) ? new XSSFWorkbook(is) : new HSSFWorkbook(is);
    FormulaEvaluator fe = (isXlsx) ? new XSSFFormulaEvaluator((XSSFWorkbook) workbook) : new HSSFFormulaEvaluator((HSSFWorkbook) workbook);
    // XSSFWorkbook workbook = new XSSFWorkbook(is);
    Sheet sheet = workbook.getSheetAt(0);

    Iterator<Row> rowIterator = sheet.iterator();

    while (rowIterator.hasNext()) {

      String record = "";

      Row row = rowIterator.next();
      // Iterator<Cell> cellIterator = row.cellIterator();

      if (row.getCell(0) != null) {

        /**
         * debbo usare il for invece che iterator perch� iterator non gestisce
         * le celle null
         **/
        for (int ic = 0; ic < row.getLastCellNum(); ic++) {

          Cell cell = row.getCell(ic, Row.CREATE_NULL_AS_BLANK);
          record += getCellValue(cell, fe, decimalSeparator).trim() + separator;

        }
      }

      record += new String(costanti);

      ps.print(record);

    }

    ps.close();

    return output;

  }

  /**
   * @param cell
   * @param fe
   * @param decimalSeparator
   *          separatore decimale
   * @return
   */
  private static String getCellValue(Cell cell, FormulaEvaluator fe, String decimalSeparator) {

    String cellValue;

    switch (cell.getCellType()) {
    case Cell.CELL_TYPE_NUMERIC:
      if (DateUtil.isCellDateFormatted(cell)) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        cellValue = sdf.format(cell.getDateCellValue());
      } else {

        // Uso double perch� � quello pi� grande per contenere numeri
        Double d = (double) cell.getNumericCellValue();

        /**
         * Per togliere la E della notazione esponenziale uso il number
         * formatter, altrimenti recupero il valore convertendolo in float per
         * salvaguardare l'arrotondamento dei numeri decimali
         * */
        NumberFormat nf = NumberFormat.getInstance();
        nf.setGroupingUsed(false); // serve per togliere le E

        if (d.toString().contains("E")) {
          cellValue = nf.format(d.longValue());
        } else {
          cellValue = d.floatValue() + "";
        }
        if (cellValue.endsWith(".0")) {
          cellValue = cellValue.substring(0, cellValue.length() - 2);
        }
        if ((decimalSeparator != null) && (!decimalSeparator.equals(""))) {
          cellValue = cellValue.replace(",", decimalSeparator).replace(".", decimalSeparator);
        }
      }
      break;

    case Cell.CELL_TYPE_STRING:
      cellValue = cell.toString();
      break;

    case Cell.CELL_TYPE_BLANK:
      cellValue = "";
      break;

    case Cell.CELL_TYPE_FORMULA:
      cellValue = cell.getCellFormula();
      cellValue = getCellValue(fe.evaluateInCell(cell), fe, decimalSeparator);
      break;

    case Cell.CELL_TYPE_BOOLEAN:
      cellValue = new String(new Boolean(cell.getBooleanCellValue()).toString());
      break;

    default:
      cellValue = "";
      break;
    }

    return cellValue;

  }

}
