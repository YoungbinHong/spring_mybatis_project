package kr.co.adup.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@SuppressWarnings("rawtypes")
public class CamelMap extends HashMap {

	static final long serialVersionUID = -3144044422514529794L;

	/**
	 * key 에 대하여 Camel Case 변환하여 super.put (ListOrderedMap) 을 호출한다.
	 * 
	 * @param key   - '_' 가 포함된 변수명
	 * @param value - 명시된 key 에 대한 값 (변경 없음)
	 * @return previous value associated with specified key, or null if there was no
	 *         mapping for key
	 */
	@Override
	@SuppressWarnings("unchecked")
	public Object put(Object key, Object value) {
		return super.put(convert2CamelCase((String) key), value);
	}

	/**
	 * @param key
	 * @return
	 */
	private String convert2CamelCase(String key) {
		// '_' 가 나타나지 않으면 이미 camel case 로 가정함.
		// 단 첫째문자가 대문자이면 camel case 변환 (전체를 소문자로) 처리가
		// 필요하다고 가정함. --> 아래 로직을 수행하면 바뀜
		if (key.indexOf('_') < 0 && Character.isLowerCase(key.charAt(0))) {
			return key;
		}
		StringBuilder result = new StringBuilder();
		boolean nextUpper = false;
		int len = key.length();

		for (int i = 0; i < len; i++) {
			char currentChar = key.charAt(i);
			if (currentChar == '_') {
				nextUpper = true;
			} else {
				if (nextUpper) {
					result.append(Character.toUpperCase(currentChar));
					nextUpper = false;
				} else {
					result.append(Character.toLowerCase(currentChar));
				}
			}
		}
		return result.toString();
	}

	public String getString(Object key) {
		Object value = this.get(key);
		if (value == null) {
			return "";
		}
		return value.toString();
	}

	public int getInt(Object key) {
		try {
			String value = this.getString(key);
			if ("".equals(value.trim())) {
				return 0;
			}
			return Integer.valueOf(value);
		} catch (Exception e) {
			return 0;
		}
	}

	/**
	 * @param key
	 * @return
	 */
	public long getLong(String key) {
		String value = this.getString(key);
		if ("".endsWith(value.trim())) {
			return 0;
		}
		return Long.valueOf(value);
	}

	public double getDouble(String key) {
		String value = this.getString(key);
		if ("".equals(value.trim())) {
			return 0.0;
		}
		return Double.valueOf(value);
	}

	public <K, V> void set(Map<K, V> map) {
		if (map != null) {
			for (Iterator<K> iter = map.keySet().iterator(); iter.hasNext();) {
				K key = iter.next();
				this.put(key, map.get(key));
			}
		}
	}

	@SuppressWarnings("unchecked")
	public <K, V> Map<K, V> toMap() {
		Map<K, V> map = new HashMap<K, V>();
		for (Iterator<K> it = this.keySet().iterator(); it.hasNext();) {
			K k = it.next();
			V v = (V) this.get(k);
			map.put(k, v);
		}
		return map;
	}
}
