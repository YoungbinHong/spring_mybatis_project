/**
 * 
 */
package kr.co.adup.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author ADUP
 *
 */
public class Obj {
	public static final Class<?>[] CLASS0 = new Class[0];
	public static final Object[] OBJECT0 = new Object[0];

	/**
	 * Constructor
	 */
	private Obj() {
	}

	public static <K, V> String toString(Map<K,V> map) {
		StringBuilder sb = new StringBuilder();
		if(map!=null && map.size()>0) {
			for(Iterator<K> iter=map.keySet().iterator(); iter.hasNext(); ) {
				K key = iter.next();
				sb.append("\n").append(key).append("=").append(map.get(key));
			}
			return sb.substring(1);
		}
		return "";
	}
	public static <V> String toString(List<V> list) {
		return toString(list, ",");
	}
	public static <V> String toString(List<V> list, String seperator) {
		if(isEmpty(list)) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		for(V v : list) {
			sb.append(seperator).append(v);
		}
		return sb.toString().substring(seperator.length());
	}
	/**
	 * @param object
	 * @param parameterTypes
	 * @param paramArray
	 * @return
	 * @throws Exception
	 */
	public static Object newObjectConstructor(Object object, Class<?>[] parameterTypes, Object[] paramArray) throws Exception {
		Constructor<?> constructor = object.getClass().getConstructor(parameterTypes);
		return constructor.newInstance(paramArray);
	}
	/**
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public static Object newObjectConstructor(Object object) throws Exception {
		return newObjectConstructor(object, CLASS0, OBJECT0);
	}
	/**
	 * @param className
	 * @return
	 * @throws Exception
	 */
	public static Object newObjectForName(String className) throws Exception {
		Class<?> clazz = Class.forName(className);
		return clazz.newInstance();
	}
	/**
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public static Object newObjectForName(Object object) throws Exception{
		return newObjectForName(object.getClass().getName());
	}
	/**
	 * run main()
	 * @param args
	 * @throws Exception
	 */
	public static void runMain(String...args) throws Exception{
		Class<?> clazz = Class.forName(args[0]);
		Class<?>[] paramTypes = new Class[]{String[].class};
		String[] paramArgs = Arrays.copyOfRange(args, 1, args.length);

		Method method = clazz.getDeclaredMethod("main", paramTypes);
		method.invoke(null, (Object)paramArgs);
	}
	/**
	 * @param object
	 * @param methodName
	 * @param argTypes
	 * @param argValues
	 * @throws Exception
	 */
	public static void runMethod(Object object, String methodName, Class<?>[] argTypes, Object[] argValues) throws Exception {
		Class<?> clazz = object.getClass();
		Method method = clazz.getMethod(methodName, argTypes);
		method.invoke(object, argValues);
	}
	/**
	 * @param object
	 * @param methodName
	 * @param argTypes
	 * @param argValues
	 * @return
	 * @throws Exception
	 */
	public static Object getValue(Object object, String methodName, Class<?>[] argTypes, Object[] argValues) throws Exception {
		Class<?> clazz = object.getClass();
		Method method = clazz.getMethod(methodName, argTypes);
		return method.invoke(object, argValues);
	}
	/**
	 * @param object
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	public static Object getValue(Object object, String methodName) throws Exception {
		return getValue(object, methodName, CLASS0, OBJECT0);
	}
	/**
	 * @param object
	 * @param methodName
	 * @param value
	 * @throws Exception
	 */
	public static <V> void setValue(Object object, String methodName, V value) throws Exception{
		runMethod( object, methodName, new Class[]{value.getClass()}, new Object[]{value} );
	}

	/**
	 * @param timerList
	 * @return
	 */
	public static boolean isEmpty(List<?> list) {
		return (list==null || list.size()==0);
	}

	/**
	 * @param memList
	 * @return
	 */
	public static boolean isNotEmpty(List<?> list) {
		return !isEmpty(list);
	}
}
