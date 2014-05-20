package eu.a2a.salesgate.base;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;

import javax.el.ArrayELResolver;
import javax.el.BeanELResolver;
import javax.el.CompositeELResolver;
import javax.el.ELResolver;
import javax.el.ListELResolver;
import javax.el.MapELResolver;
import javax.el.ResourceBundleELResolver;

import ognl.OgnlException;
import ognl.OgnlRuntime;
import ognl.PropertyAccessor;

import org.apache.tiles.TilesContainer;
import org.apache.tiles.compat.definition.digester.CompatibilityDigesterDefinitionsReader;
import org.apache.tiles.context.TilesRequestContextHolder;
import org.apache.tiles.definition.DefinitionsReader;
import org.apache.tiles.definition.pattern.DefinitionPatternMatcherFactory;
import org.apache.tiles.definition.pattern.PatternDefinitionResolver;
import org.apache.tiles.definition.pattern.PrefixedPatternDefinitionResolver;
import org.apache.tiles.definition.pattern.regexp.RegexpDefinitionPatternMatcherFactory;
import org.apache.tiles.definition.pattern.wildcard.WildcardDefinitionPatternMatcherFactory;
import org.apache.tiles.el.ELAttributeEvaluator;
import org.apache.tiles.el.JspExpressionFactoryFactory;
import org.apache.tiles.el.ScopeELResolver;
import org.apache.tiles.el.TilesContextBeanELResolver;
import org.apache.tiles.el.TilesContextELResolver;
import org.apache.tiles.evaluator.AttributeEvaluatorFactory;
import org.apache.tiles.evaluator.BasicAttributeEvaluatorFactory;
import org.apache.tiles.factory.BasicTilesContainerFactory;
import org.apache.tiles.factory.TilesContainerFactoryException;
import org.apache.tiles.impl.mgmt.CachingTilesContainer;
import org.apache.tiles.locale.LocaleResolver;
import org.apache.tiles.mvel.MVELAttributeEvaluator;
import org.apache.tiles.mvel.ScopeVariableResolverFactory;
import org.apache.tiles.mvel.TilesContextBeanVariableResolverFactory;
import org.apache.tiles.mvel.TilesContextVariableResolverFactory;
import org.apache.tiles.ognl.AnyScopePropertyAccessor;
import org.apache.tiles.ognl.DelegatePropertyAccessor;
import org.apache.tiles.ognl.NestedObjectDelegatePropertyAccessor;
import org.apache.tiles.ognl.OGNLAttributeEvaluator;
import org.apache.tiles.ognl.PropertyAccessorDelegateFactory;
import org.apache.tiles.ognl.ScopePropertyAccessor;
import org.apache.tiles.ognl.TilesApplicationContextNestedObjectExtractor;
import org.apache.tiles.ognl.TilesContextPropertyAccessorDelegateFactory;
import org.apache.tiles.request.ApplicationContext;
import org.apache.tiles.request.ApplicationResource;
import org.apache.tiles.request.Request;
import org.apache.tiles.request.render.BasicRendererFactory;
import org.apache.tiles.request.render.ChainedDelegateRenderer;
import org.apache.tiles.request.render.Renderer;
import org.mvel2.integration.VariableResolverFactory;

public class CustomTilesContainerFactory extends BasicTilesContainerFactory {
  /** {@inheritDoc} */
  @Override
  public TilesContainer createDecoratedContainer(TilesContainer originalContainer, ApplicationContext applicationContext) {
    return new CachingTilesContainer(originalContainer);
  }

  /** {@inheritDoc} */
  @Override
  protected void registerAttributeRenderers(final BasicRendererFactory rendererFactory, final ApplicationContext applicationContext, final TilesContainer container, final AttributeEvaluatorFactory attributeEvaluatorFactory) {
    super.registerAttributeRenderers(rendererFactory, applicationContext, container, attributeEvaluatorFactory);

  }

  /** {@inheritDoc} */
  @Override
  protected Renderer createDefaultAttributeRenderer(BasicRendererFactory rendererFactory, ApplicationContext applicationContext, TilesContainer container, AttributeEvaluatorFactory attributeEvaluatorFactory) {

    ChainedDelegateRenderer retValue = new ChainedDelegateRenderer();
    retValue.addAttributeRenderer(rendererFactory.getRenderer(DEFINITION_RENDERER_NAME));
    retValue.addAttributeRenderer(rendererFactory.getRenderer(TEMPLATE_RENDERER_NAME));
    retValue.addAttributeRenderer(rendererFactory.getRenderer(STRING_RENDERER_NAME));
    return retValue;
  }

  /** {@inheritDoc} */
  @Override
  protected AttributeEvaluatorFactory createAttributeEvaluatorFactory(ApplicationContext applicationContext, LocaleResolver resolver) {
    BasicAttributeEvaluatorFactory attributeEvaluatorFactory = new BasicAttributeEvaluatorFactory(createELEvaluator(applicationContext));
    attributeEvaluatorFactory.registerAttributeEvaluator("MVEL", createMVELEvaluator());
    attributeEvaluatorFactory.registerAttributeEvaluator("OGNL", createOGNLEvaluator());

    return attributeEvaluatorFactory;
  }

  /** {@inheritDoc} */
  @Override
  protected <T> PatternDefinitionResolver<T> createPatternDefinitionResolver(Class<T> customizationKeyClass) {
    DefinitionPatternMatcherFactory wildcardFactory = new WildcardDefinitionPatternMatcherFactory();
    DefinitionPatternMatcherFactory regexpFactory = new RegexpDefinitionPatternMatcherFactory();
    PrefixedPatternDefinitionResolver<T> resolver = new PrefixedPatternDefinitionResolver<T>();
    resolver.registerDefinitionPatternMatcherFactory("WILDCARD", wildcardFactory);
    resolver.registerDefinitionPatternMatcherFactory("REGEXP", regexpFactory);
    return resolver;
  }

  /** {@inheritDoc} */
  @Override
  protected List<ApplicationResource> getSources(ApplicationContext applicationContext) {
    Collection<ApplicationResource> webINFSet = applicationContext.getResources("/WEB-INF/**/tiles*.xml");
    Collection<ApplicationResource> metaINFSet = applicationContext.getResources("classpath*:META-INF/**/tiles*.xml");

    Collection<ApplicationResource> rootSet = applicationContext.getResources("/**/tiles.xml");

    Collection<ApplicationResource> layoutSet = applicationContext.getResources("/layout/tiles.xml");

    List<ApplicationResource> filteredResources = new ArrayList<ApplicationResource>();
    if (webINFSet != null) {
      for (ApplicationResource resource : webINFSet) {
        if (Locale.ROOT.equals(resource.getLocale())) {
          filteredResources.add(resource);
        }
      }
    }
    if (metaINFSet != null) {
      for (ApplicationResource resource : metaINFSet) {
        if (Locale.ROOT.equals(resource.getLocale())) {
          filteredResources.add(resource);
        }
      }
    }
    if (rootSet != null) {
      for (ApplicationResource resource : rootSet) {
        if (Locale.ROOT.equals(resource.getLocale())) {
          filteredResources.add(resource);
        }
      }
    }
    if (layoutSet != null) {
      for (ApplicationResource resource : layoutSet) {
        if (Locale.ROOT.equals(resource.getLocale())) {
          filteredResources.add(resource);
        }
      }
    }
    return filteredResources;
  }

  /** {@inheritDoc} */
  @Override
  protected DefinitionsReader createDefinitionsReader(ApplicationContext applicationContext) {
    return new CompatibilityDigesterDefinitionsReader();
  }

  /**
   * Creates the EL evaluator.
   * 
   * @param applicationContext
   *          The Tiles application context.
   * @return The EL evaluator.
   */
  private ELAttributeEvaluator createELEvaluator(ApplicationContext applicationContext) {
    ELAttributeEvaluator evaluator = new ELAttributeEvaluator();
    JspExpressionFactoryFactory efFactory = new JspExpressionFactoryFactory();
    efFactory.setApplicationContext(applicationContext);
    evaluator.setExpressionFactory(efFactory.getExpressionFactory());
    ELResolver elResolver = new CompositeELResolver() {
      {
        BeanELResolver beanElResolver = new BeanELResolver(false);
        add(new ScopeELResolver());
        add(new TilesContextELResolver(beanElResolver));
        add(new TilesContextBeanELResolver());
        add(new ArrayELResolver(false));
        add(new ListELResolver(false));
        add(new MapELResolver(false));
        add(new ResourceBundleELResolver());
        add(beanElResolver);
      }
    };
    evaluator.setResolver(elResolver);
    return evaluator;
  }

  /**
   * Creates the MVEL evaluator.
   * 
   * @return The MVEL evaluator.
   */
  private MVELAttributeEvaluator createMVELEvaluator() {
    TilesRequestContextHolder requestHolder = new TilesRequestContextHolder();
    VariableResolverFactory variableResolverFactory = new ScopeVariableResolverFactory(requestHolder);
    variableResolverFactory.setNextFactory(new TilesContextVariableResolverFactory(requestHolder));
    variableResolverFactory.setNextFactory(new TilesContextBeanVariableResolverFactory(requestHolder));
    MVELAttributeEvaluator mvelEvaluator = new MVELAttributeEvaluator(requestHolder, variableResolverFactory);
    return mvelEvaluator;
  }

  /**
   * Creates the OGNL evaluator.
   * 
   * @return The OGNL evaluator.
   */
  private OGNLAttributeEvaluator createOGNLEvaluator() {
    try {
      PropertyAccessor objectPropertyAccessor = OgnlRuntime.getPropertyAccessor(Object.class);
      PropertyAccessor applicationContextPropertyAccessor = new NestedObjectDelegatePropertyAccessor<Request>(new TilesApplicationContextNestedObjectExtractor(), objectPropertyAccessor);
      PropertyAccessor anyScopePropertyAccessor = new AnyScopePropertyAccessor();
      PropertyAccessor scopePropertyAccessor = new ScopePropertyAccessor();
      PropertyAccessorDelegateFactory<Request> factory = new TilesContextPropertyAccessorDelegateFactory(objectPropertyAccessor, applicationContextPropertyAccessor, anyScopePropertyAccessor, scopePropertyAccessor);
      PropertyAccessor tilesRequestAccessor = new DelegatePropertyAccessor<Request>(factory);
      OgnlRuntime.setPropertyAccessor(Request.class, tilesRequestAccessor);
      return new OGNLAttributeEvaluator();
    } catch (OgnlException e) {
      throw new TilesContainerFactoryException("Cannot initialize OGNL evaluator", e);
    }
  }
}
