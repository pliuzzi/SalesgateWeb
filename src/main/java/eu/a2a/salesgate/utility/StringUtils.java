package eu.a2a.salesgate.utility;

import java.io.PrintWriter;
import java.io.StringWriter;

public class StringUtils {

  public static String getStackTrace(Throwable t) {
    StringWriter stringWritter = new StringWriter();
    PrintWriter printWritter = new PrintWriter(stringWritter, true);
    t.printStackTrace(printWritter);
    printWritter.flush();
    stringWritter.flush();

    return stringWritter.toString();
  }

  public static String spaceIfNull(Object obj) {
    return (obj != null ? obj.toString() : "");
  }

}
