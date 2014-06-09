package eu.a2a.salesgate.pratiche.ele.bean;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

public class HtmlHelper {

  private final String templateFormItem = "<div class=\"col-lg-4\"> " + "  <div class=\"form-group\"> " + "    <form:label path=\"lavoriEleExtension.{sottogruppo}{0}\" class=\"col-lg-6 control-label\">{0}</form:label> "
      + "      <div class=\"col-lg-6\"> " + "        <spring:bind path=\"lavoriEleExtension.{sottogruppo}{0}\" > "
      + "          <form:input type=\"text\" class=\"form-control input-sm {1} ${status.error ? 'alert-danger' : ''}\" path=\"${status.expression}\" " + "            readonly=\"${lavoriEle.isLavoriEleEditable}\"  "
      + "            data-toggle=\"tooltip\" title=\"${status.errorMessage}\" data-container=\"body\" data-placement=\"right\"/> " + "        </spring:bind> " + "      </div> " + "    </div> " + "  </div>";

  private final String aperturaRiga = "<div class=\"row\">";
  private final String chiusuraRiga = "</div>";

  private final Field[] arrayItems = LavoriEleExtension.class.getDeclaredFields();

  private String getFormItem(Field formItem, String sottogruppo, String prefix) {

    if ((!Modifier.isStatic(formItem.getModifiers())) && (!formItem.getName().startsWith(prefix != null ? prefix : ""))) {
      String ret = templateFormItem.replace("{0}", formItem.getName());
      if (sottogruppo != null) {
        ret = ret.replace("{sottogruppo}", sottogruppo + ".");
      } else {
        ret = ret.replace("{sottogruppo}", "");
      }
      if (formItem.getType().getName().contains("Date")) {
        ret = ret.replace("{1}", "form_date");
      } else {
        ret = ret.replace("{1}", "");
      }

      return ret;
    }
    return "";

  }

  public String createElements() {

    String ret = "";

    for (int i = 0; i < arrayItems.length; i++) {

      if (i % 3 == 0) {
        if (i > 0) {
          ret += chiusuraRiga;
        }
        ret += aperturaRiga;
      }
      ret += getFormItem(arrayItems[i], null, "data");

    }
    if (arrayItems.length % 3 != 0) {
      ret += chiusuraRiga;
    }

    return ret;

  }

  public static void main(String[] args) {

    HtmlHelper hh = new HtmlHelper();
    System.out.println(hh.createElements());

  }

}