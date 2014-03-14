package eu.a2a.salesgate.template.bean.matcher;

import org.hamcrest.BaseMatcher;
import org.hamcrest.Description;

import eu.a2a.salesgate.template.bean.Campo;

public class CampoMatcher extends BaseMatcher<Campo> {

  private final boolean ifCampoVuoto;

  public CampoMatcher(boolean ifCampoVuoto) {
    this.ifCampoVuoto = ifCampoVuoto;
  }

  @Override
  public boolean matches(Object item) {
    Campo c = (Campo) item;
    return ifCampoVuoto ? c.isCampoVuoto() : !c.isCampoVuoto();
  }

  @Override
  public void describeTo(Description description) {
    // TODO Auto-generated method stub

  }

}
