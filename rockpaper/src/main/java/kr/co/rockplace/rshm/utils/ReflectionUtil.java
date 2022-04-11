package kr.co.rockplace.rshm.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import kr.co.rockplace.rshm.db.entity.MenuIconEnum;

/**
 * Reflection Utility
 * 
 * @author wonsunlee
 */
public class ReflectionUtil {

	/**
	 * 
	 * @param object
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static Map<String, Object> convertToMap(Object object) throws IllegalArgumentException, IllegalAccessException {

		if(object == null) {
			return Collections.emptyMap();
		}

		Map<String, Object> convertMap = new HashMap<>();

		// Super Class
		Field[] superFields = object.getClass().getSuperclass().getDeclaredFields();
		for (Field superField : superFields) {
			superField.setAccessible(true);
			convertMap.put(superField.getName(), superField.get(object));
		}

		// This Class
		Field[] fields = object.getClass().getDeclaredFields();
		for (Field field : fields) {
			field.setAccessible(true);
			convertMap.put(field.getName(), field.get(object));
		}

		return convertMap;
	}

	/**
	 * 
	 * @param <T>
	 * @param map
	 * @param type
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 */
	public static <T> T convertToValueObject(
			Map<String, Object> map,
			Class<T> type) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		if(type == null) {
			throw new NullPointerException("Class cannot be null");
		}

		T instance = type.getConstructor().newInstance();

		if(map == null || map.isEmpty()) {
			return instance;
		}

		// 등록 시간, 등록자 설정 
		if(!(map.containsKey("createDate") || map.containsKey("createEmpId"))) {

			map.put("createDate", LocalDateTime.now());
			map.put("createEmpId", AuthUtil.getCurrentUserId());
		}

		for (Map.Entry<String, Object> entrySet : map.entrySet()) {

			// Super Class
			Field[] superFields = type.getSuperclass().getDeclaredFields();
			for (Field superField : superFields) {

				if(Modifier.isFinal(superField.getModifiers())) {
					continue;
				}

				superField.setAccessible(true);

				String fieldName = superField.getName();
				boolean isSameName = entrySet.getKey().equals(fieldName);
				boolean isSameType = entrySet.getValue().getClass().equals(superField.getType());

				if(isSameName) {

					if(superField.getType().isPrimitive()) {

						Class<?> typeClazz = null;
						if(superField.getType() == boolean.class) {
							typeClazz = Boolean.class;
						} else if(superField.getType() == byte.class) {
							typeClazz = Byte.class;
						} else if(superField.getType() == char.class) {
							typeClazz = java.lang.Character.class;
						} else if(superField.getType() == short.class) {
							typeClazz = Short.class;
						} else if(superField.getType() == int.class) {
							typeClazz = Integer.class;
						} else if(superField.getType() == long.class) {
							typeClazz = Long.class;
						} else if(superField.getType() == float.class) {
							typeClazz = Float.class;
						} else if(superField.getType() == double.class) {
							typeClazz = Double.class;
						} else if(superField.getType() == void.class) {
							typeClazz = Void.class;
						}

						isSameType = entrySet.getValue().getClass().equals(typeClazz);
					}

					if(isSameType) {

						if(map.get(fieldName).equals("null")) {
							superField.set(instance, null);
						} else {
							superField.set(instance, map.get(fieldName));
						}
					} else {

						if(superField.getType() == boolean.class || superField.getType() == Boolean.class) {
							superField.setBoolean(instance, Boolean.parseBoolean(map.get(fieldName).toString()));
						} else if(superField.getType() == byte.class || superField.getType() == Byte.class) {
							superField.setByte(instance, Byte.valueOf(map.get(fieldName).toString()));
						} else if(superField.getType() == char.class || superField.getType() == Character.class) {
							superField.setChar(instance, Character.valueOf((char) map.get(fieldName)));
						} else if(superField.getType() == double.class || superField.getType() == Double.class) {
							superField.setDouble(instance, Double.parseDouble(map.get(fieldName).toString()));
						} else if(superField.getType() == float.class || superField.getType() == Float.class) {
							superField.setFloat(instance, Float.parseFloat(map.get(fieldName).toString()));
						} else if(superField.getType() == int.class || superField.getType() == Integer.class) {
							superField.setInt(instance, Integer.parseInt(map.get(fieldName).toString()));
						} else if(superField.getType() == long.class || superField.getType() == Long.class) {
							superField.setLong(instance, Long.parseLong(map.get(fieldName).toString()));
						} else if(superField.getType() == short.class || superField.getType() == Short.class) {
							superField.setShort(instance, Short.parseShort(map.get(fieldName).toString()));
						} else {
							superField.set(instance, map.get(fieldName));
						}
					}
				}
			}

			// This Class
			Field[] fields = type.getDeclaredFields();
			for (Field field : fields) {

				if(Modifier.isFinal(field.getModifiers())) {
					continue;
				}

				field.setAccessible(true);

				String fieldName = field.getName();
				boolean isSameName = entrySet.getKey().equals(fieldName);
				boolean isSameType = entrySet.getValue().getClass().equals(field.getType());

				if(isSameName) {

					if(field.getType().isPrimitive()) {

						Class<?> typeClazz = null;
						if(field.getType() == boolean.class) {
							typeClazz = Boolean.class;
						} else if(field.getType() == byte.class) {
							typeClazz = Byte.class;
						} else if(field.getType() == char.class) {
							typeClazz = java.lang.Character.class;
						} else if(field.getType() == short.class) {
							typeClazz = Short.class;
						} else if(field.getType() == int.class) {
							typeClazz = Integer.class;
						} else if(field.getType() == long.class) {
							typeClazz = Long.class;
						} else if(field.getType() == float.class) {
							typeClazz = Float.class;
						} else if(field.getType() == double.class) {
							typeClazz = Double.class;
						} else if(field.getType() == void.class) {
							typeClazz = Void.class;
						}

						isSameType = entrySet.getValue().getClass().equals(typeClazz);
					}

					if(isSameType) {

						if(map.get(fieldName).equals("null")) {
							field.set(instance, null);
						} else {
							field.set(instance, map.get(fieldName));
						}
					} else {

						if(field.getType() == boolean.class || field.getType() == Boolean.class) {
							field.setBoolean(instance, Boolean.parseBoolean(map.get(fieldName).toString()));
						} else if(field.getType() == byte.class || field.getType() == Byte.class) {
							field.setByte(instance, Byte.valueOf(map.get(fieldName).toString()));
						} else if(field.getType() == char.class || field.getType() == Character.class) {
							field.setChar(instance, Character.valueOf((char) map.get(fieldName)));
						} else if(field.getType() == double.class || field.getType() == Double.class) {
							field.setDouble(instance, Double.parseDouble(map.get(fieldName).toString()));
						} else if(field.getType() == float.class || field.getType() == Float.class) {
							field.setFloat(instance, Float.parseFloat(map.get(fieldName).toString()));
						} else if(field.getType() == int.class || field.getType() == Integer.class) {
							field.setInt(instance, Integer.parseInt(map.get(fieldName).toString()));
						} else if(field.getType() == long.class || field.getType() == Long.class) {
							field.setLong(instance, Long.parseLong(map.get(fieldName).toString()));
						} else if(field.getType() == short.class || field.getType() == Short.class) {
							field.setShort(instance, Short.parseShort(map.get(fieldName).toString()));
						} else if(field.getType() == MenuIconEnum.class) {
							field.set(instance, MenuIconEnum.valueOf(Integer.parseInt(map.get(fieldName).toString())));
						} else {
							field.set(instance, map.get(fieldName));
						}
					}
				}
			}
		}

		return instance;
	}

	/**
	 * 
	 * @param object
	 * @param map
	 * @return
	 */
	public static Map<String, Object> diffEntityAndMap(
			Object object,
			Map<String, Object> map) {

		// 수정 시간, 수정자 설정 
		map.put("updateDate", LocalDateTime.now());
		map.put("updateEmpId", AuthUtil.getCurrentUserId());

		Map<String, Object> resultMap = new HashMap<>();

		try {

			Map<String, Object> converMap = ReflectionUtil.convertToMap(object);
			for (Map.Entry<String, Object> entrySet : converMap.entrySet()) {

				if(entrySet.getValue() == null) {

					if(map.containsKey(entrySet.getKey())) {
						resultMap.put(entrySet.getKey(), map.get(entrySet.getKey()));
					}
				} else {

					if(map.containsKey(entrySet.getKey())) {

						if(entrySet.getValue() == map.get(entrySet.getKey())) {
							resultMap.put(entrySet.getKey(), entrySet.getValue());
						} else {
							resultMap.put(entrySet.getKey(), map.get(entrySet.getKey()));
						}
					} else {
						resultMap.put(entrySet.getKey(), entrySet.getValue());
					}
					
				}
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}

		return resultMap;
	}
}