package eu.a2a.salesgate.utility;

import java.util.HashMap;
import java.util.Map;

public class MapUtility {

  @SuppressWarnings("unchecked")
  public static <K, V> Map<K, V> mapOf(K key, V value, Object... alternatingsKeysAndValues) {
    Map<K, V> map = new HashMap<K, V>();
    map.put(key, value);
    for (int i = 0; i < alternatingsKeysAndValues.length; i += 2)
      map.put((K) alternatingsKeysAndValues[i], (V) alternatingsKeysAndValues[i + 1]);
    return map;
  }

}
