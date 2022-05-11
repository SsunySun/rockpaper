package kr.co.rockplace.rshm.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Common Utility
 * @author wonsunlee
 */
public class CommonUtils {

	/**
	 * 
	 * @param boolean
	 * @param stmt
	 * @param replacement
	 * @param type
	 * @param map
	 * @return
	 */
	public static String replaceFilter(
			boolean require,
			String stmt,
			String replacement,
			String type,
			Map<String, Object> map) {

		String oriStmt = stmt;
		String[] replacements = replacement.split(",");
		for (String replace : replacements) {

			if(map.containsKey(replace)) {

				String value = (String) map.get(replace);
//				value = value.replaceAll("%", "--");
				value = value.replaceAll("[^\uAC00-\uD7A30-9a-zA-Z@.\\-_:+]", "/");
				if(StringUtils.equals(type, "text")) {
					value = "\"" + value + "\"";
				} else if(StringUtils.equals(type, "boolean")) {
					// value = value;
				} else if(StringUtils.equals(type, "number")) {
					// value = value;
				} else if(StringUtils.equals(type, "range-date")) {
					value = "\"" + value + "\"";
				} else {
					value = "\"" + value + "\"";
				}

				stmt = stmt.replaceFirst("\\?", value);
			} else {
				stmt = "";
			}
		}

		if(StringUtils.isEmpty(stmt)) {

			if(require) {
				stmt = replaceRequireFilter(oriStmt, replacement, type, map);
			}
		}

		return stmt;
	}

	/**
	 * 
	 * @param stmt
	 * @param replacement
	 * @param type
	 * @param map
	 * @return
	 */
	public static String replaceRequireFilter(
			String stmt,
			String replacement,
			String type,
			Map<String, Object> map) {

		String[] replacements = replacement.split(",");
		for (String replace : replacements) {

			String value = (String) map.get(replace);
			if(StringUtils.equals(type, "text")) {
				value = "\"\"";
			} else if(StringUtils.equals(type, "boolean")) {
				value = "true";
			} else if(StringUtils.equals(type, "number")) {
				value = "0";
			} else if(StringUtils.equals(type, "range-date")) {
				value = "\"\"";
			} else {
				value = "\"\"";
			}
			stmt = stmt.replaceFirst("\\?", value);
		}

		return stmt;
	}

	/**
	 * 
	 * @param paramMap
	 * @param sqlMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static MapperParseVo parseSqlParam(
			Map<String, Object> paramMap,
			Map<String, Object> sqlConfigMap) {

		try {

			Map<String, Object> userMap = AuthUtil.getCurrentUser();
			userMap.forEach((paramKey, paramValue) -> {
				paramMap.put("user." + paramKey, paramValue);
			});
		} catch (Exception e) {}

		List<Map<String, Object>> stmtList = (List<Map<String, Object>>) sqlConfigMap.get("stmts");

		MapperParseVo mapperParseVo = new MapperParseVo();

		if((boolean) sqlConfigMap.get("where")) {
			mapperParseVo.setWhere("AND");
		} else {
			mapperParseVo.setWhere("WHERE");
		}

		if(sqlConfigMap.containsKey("orderBy") && StringUtils.isNotEmpty(sqlConfigMap.get("orderBy").toString())) {
			mapperParseVo.setOrderBy(sqlConfigMap.get("orderBy").toString());
		}

		stmtList.forEach(cond -> {

			boolean isRequire = (boolean) cond.getOrDefault("require", false);

			if(paramMap.containsKey(cond.get("id").toString())) {

				String condition = CommonUtils.replaceFilter(isRequire, cond.get("stmt").toString(), cond.get("param").toString(), cond.get("type").toString(), paramMap);
				if(StringUtils.isNotEmpty(condition)) {
					mapperParseVo.getFilterList().add(condition);
				}
			} else {

				if(isRequire) {

					String condition = CommonUtils.replaceRequireFilter(cond.get("stmt").toString(), cond.get("param").toString(), cond.get("type").toString(), paramMap);
					if(StringUtils.isNotEmpty(condition)) {
						mapperParseVo.getFilterList().add(condition);
					}
				}
			}
		});

		return mapperParseVo;
	}

	/**
	 * 
	 * @param str
	 * @param map
	 * @return
	 */
	public static String transVars(String str, Map<String, Object> map) {

		String result = str;

		int cidx = 0;
		while(true) {

			int idx = str.indexOf("#{", cidx);
			if(idx < 0) {
				break;
			}

			int midx = str.indexOf(".", idx + 2);
			cidx = str.indexOf("}", midx);

			String fstr = str.substring(idx, cidx + 1);
			String type = str.substring(idx + 2, midx);
			String key = str.substring(midx + 1, cidx);

			if(StringUtils.equals(type, "box")) {

				String value = "";
				if(map.containsKey(key)) {

					value = map.get(key).toString();
					value = CommonUtils.replaceString(value);
				}
				result = StringUtils.replace(result, fstr, value);
			} else if(StringUtils.equals(type, "user")) {

				Map<String, Object> userMap = AuthUtil.getCurrentUser();

				// id, name, dept 정보 
				String value = "";
				if(userMap.containsKey(key)) {
					value = userMap.get(key).toString();
				}
				result = StringUtils.replace(result, fstr, value);
			} else if(StringUtils.equals(type, "date")) {

				if(StringUtils.equals(key, "curDTTM")) {

					String value = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
					result = StringUtils.replace(result, fstr, value);
				} else if(StringUtils.equals(key, "curDT")) {

					String value = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
					result = StringUtils.replace(result, fstr, value);
				}
			}
		}

		return result;
	}

	/**
	 * 
	 * @param str
	 * @param boxMap
	 * @param rowMap
	 * @return
	 */
	public static String transVars(String str, Map<String, Object> boxMap, Map<String, Object> rowMap) {

		String result = str;

		int cidx = 0;
		while(true) {

			int idx = str.indexOf("#{", cidx);
			if(idx < 0) {
				break;
			}

			int midx = str.indexOf(".", idx + 2);
			cidx = str.indexOf("}", midx);

			String fstr = str.substring(idx, cidx + 1);
			String type = str.substring(idx + 2, midx);
			String key = str.substring(midx + 1, cidx);

			if(StringUtils.equals(type, "box")) {

				String value = "";
				if(boxMap.containsKey(key)) {

					value = boxMap.get(key).toString();
					value = CommonUtils.replaceString(value);
				}
				result = StringUtils.replace(result, fstr, value);
			} else if(StringUtils.equals(type, "row")) {

				String value = "";
				if(rowMap.containsKey(key)) {

					value = rowMap.get(key).toString();
					value = CommonUtils.replaceString(value);
				}
				result = StringUtils.replace(result, fstr, value);
			} else if(StringUtils.equals(type, "user")) {

				try {

					Map<String, Object> userMap = AuthUtil.getCurrentUser();

					// id, name, dept 정보 
					String value = "";
					if(userMap.containsKey(key)) {
						value = userMap.get(key).toString();
					}
					result = StringUtils.replace(result, fstr, value);
				} catch (Exception e) {}
			} else if(StringUtils.equals(type, "date")) {

				if(StringUtils.equals(key, "curDTTM")) {

					String value = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
					result = StringUtils.replace(result, fstr, value);
				} else if(StringUtils.equals(key, "curDT")) {

					String value = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
					result = StringUtils.replace(result, fstr, value);
				}
			}
		}

		return result;
	}

	/**
	 * 
	 * @param str
	 * @param map
	 * @return
	 */
	public static String transVarsByData(String str, Map<String, Object> map) {

		if(StringUtils.isEmpty(str)) {
			return "";
		}

		if(CommonUtils.isNull(map)) {
			return "";
		}

		String result = str;

		int cidx = 0;
		while(true) {

			int idx = str.indexOf("#{", cidx);
			if(idx < 0) {
				break;
			}

			cidx = str.indexOf("}", idx);
			String fstr = str.substring(idx, cidx + 1);
			String key = str.substring(idx + 2, cidx);

			String value = "";
			if(map.containsKey(key)) {
				value = map.get(key).toString();
			}
			result = StringUtils.replace(result, fstr, value);
		}

		return result;
	}

	/**
	 * 해당 Object가 Null인지 확인 
	 * @param object
	 * @return
	 */
	public static boolean isNull(Object object) {

		if (object == null) {
			return true;
		}

		return false;
	}

	/**
	 * 해당 Object가 Null이 아닌지 확인 
	 * @param object
	 * @return
	 */
	public static boolean isNotNull(Object object) {

		if (object == null) {
			return false;
		}

		return true;
	}

	public static String convertMapToDefaultString(Map<?, ?> map, String key) {

		String resultStr = StringUtils.defaultIfBlank((String)map.get(key), "");
		return resultStr;
	}

	public static double roundValue(double value, int digit) {
		return Math.round(value * Math.pow(10, digit)) / Math.pow(10, digit);
	}

	public static double ceilValue(double value, int digit) {
		return Math.ceil(value * Math.pow(10, digit)) / Math.pow(10, digit);
	}

	public static double floorValue(double value, int digit) {
		return Math.floor(value * Math.pow(10, digit)) / Math.pow(10, digit);
	}

	public static String replaceString(String str) {

		str = str.replaceAll("\"", "\\\\\"");
		return str;
	}
}