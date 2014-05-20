package eu.a2a.salesgate.base;

import javax.servlet.ServletContext;

import org.apache.tiles.factory.AbstractTilesContainerFactory;
import org.apache.tiles.request.ApplicationContext;
import org.apache.tiles.request.servlet.wildcard.WildcardServletApplicationContext;
import org.apache.tiles.startup.AbstractTilesInitializer;

public class CustomTilesInitializer extends AbstractTilesInitializer {

  /** {@inheritDoc} */
  @Override
  protected ApplicationContext createTilesApplicationContext(ApplicationContext preliminaryContext) {
    return new WildcardServletApplicationContext((ServletContext) preliminaryContext.getContext());
  }

  /** {@inheritDoc} */
  @Override
  protected AbstractTilesContainerFactory createContainerFactory(ApplicationContext context) {
    return new CustomTilesContainerFactory();
  }

}
