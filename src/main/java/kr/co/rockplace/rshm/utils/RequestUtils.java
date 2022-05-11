package kr.co.rockplace.rshm.utils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Request Utility
 * @author wonsunlee
 */
public class RequestUtils {

	/**
	 * 
	 * @param request
	 * @param index
	 * @return
	 */
	public static String getServletPath(
			HttpServletRequest request,
			int index) {

		String servletPath = request.getServletPath();
		List<String> list = Arrays.asList(StringUtils.split(servletPath, "/"));
		if(list.size() > index) {
			return list.get(index);
		}
		return "";
	}

	/**
	 * 
	 * @param request
	 * @param columnSize
	 * @return
	 */
	@Deprecated
	public static MapperParseVo parseRequestParam(
			HttpServletRequest request,
			int columnSize) {

		MapperParseVo mapperParseVo = new MapperParseVo();

		mapperParseVo.getMap().put("start", Integer.parseInt(StringUtils.trim(request.getParameter("start"))));
		mapperParseVo.getMap().put("length", Integer.parseInt(StringUtils.trim(request.getParameter("length"))));

		for (int i = 0; i < columnSize; i++) {

			MapperParseVo.ColumnData columnVo = MapperParseVo.ColumnData.builder()
					.index(i)
					.data(StringUtils.trim(request.getParameter("columns[" + i + "][data]")))
					.name(StringUtils.trim(request.getParameter("columns[" + i + "][name]")))
					.searchable(Boolean.parseBoolean(StringUtils.trim(request.getParameter("columns[" + i + "][searchable]"))))
					.orderable(Boolean.parseBoolean(StringUtils.trim(request.getParameter("columns[" + i + "][orderable]"))))
					.searchValue(StringUtils.trim(request.getParameter("columns[" + i + "][search][value]")))
					.searchRegex(Boolean.parseBoolean(StringUtils.trim(request.getParameter("columns[" + i + "][search][regex]"))))
					.build();

			if(StringUtils.isNoneBlank(columnVo.getSearchValue())) {

				if(StringUtils.contains(columnVo.getSearchValue(), "|")) {

					String[] arr = StringUtils.split(columnVo.getSearchValue(), "|");
					switch (arr.length) {
					case 2:
						mapperParseVo.getMap().put(columnVo.getData(), columnVo.getSearchValue());
						mapperParseVo.getMap().put("start_" + columnVo.getData(), arr[0]);
						mapperParseVo.getMap().put("end_" + columnVo.getData(), arr[1]);
						break;
					default:
						mapperParseVo.getMap().put(columnVo.getData(), columnVo.getSearchValue());
						break;
					}
				} else {
					mapperParseVo.getMap().put(columnVo.getData(), columnVo.getSearchValue());
				}
			}

			if(Integer.parseInt(StringUtils.trim(request.getParameter("order[0][column]"))) == i) {
				mapperParseVo.getMap().put("orderBy", StringUtils.trim(request.getParameter("columns[" + i + "][data]")) + " " + StringUtils.trim(request.getParameter("order[0][dir]")));
			}

			mapperParseVo.getColumns().add(columnVo);
		}

		return mapperParseVo;
	}

	/**
	 * 
	 * @param request
	 * @param columnSize
	 * @param configMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static MapperParseVo parseRequestParam(
			HttpServletRequest request,
			int columnSize,
			Map<String, Object> configMap) {

		Map<String, Object> sqlMap = (Map<String, Object>) configMap.get("sql");
		List<Map<String, Object>> stmtList = (List<Map<String, Object>>) sqlMap.get("stmts");

		MapperParseVo mapperParseVo = new MapperParseVo();

		if((boolean) sqlMap.get("where")) {
			mapperParseVo.setWhere("AND");
		} else {
			mapperParseVo.setWhere("WHERE");
		}

		mapperParseVo.getMap().put("start", Integer.parseInt(StringUtils.trim(request.getParameter("start"))));
		mapperParseVo.getMap().put("length", Integer.parseInt(StringUtils.trim(request.getParameter("length"))));

		for (int i = 0; i < columnSize; i++) {

			MapperParseVo.ColumnData columnVo = MapperParseVo.ColumnData.builder()
					.index(i)
					.data(StringUtils.trim(request.getParameter("columns[" + i + "][data]")))
					.name(StringUtils.trim(request.getParameter("columns[" + i + "][name]")))
					.searchable(Boolean.parseBoolean(StringUtils.trim(request.getParameter("columns[" + i + "][searchable]"))))
					.orderable(Boolean.parseBoolean(StringUtils.trim(request.getParameter("columns[" + i + "][orderable]"))))
					.searchValue(StringUtils.trim(request.getParameter("columns[" + i + "][search][value]")))
					.searchRegex(Boolean.parseBoolean(StringUtils.trim(request.getParameter("columns[" + i + "][search][regex]"))))
					.build();

			if(StringUtils.isNoneBlank(columnVo.getSearchValue()) && StringUtils.contains(columnVo.getSearchValue(), "|")) {

				String[] arr = StringUtils.split(columnVo.getSearchValue(), "|");
				switch (arr.length) {
				case 2:
					mapperParseVo.getMap().put(columnVo.getData(), columnVo.getSearchValue());
					mapperParseVo.getMap().put("start_" + columnVo.getData(), arr[0]);
					mapperParseVo.getMap().put("end_" + columnVo.getData(), arr[1]);
					break;
				default:
					mapperParseVo.getMap().put(columnVo.getData(), columnVo.getSearchValue());
					break;
				}
			} else {
				mapperParseVo.getMap().put(columnVo.getData(), columnVo.getSearchValue());
			}

			stmtList.forEach(cond -> {

				String id = (String) cond.get("id");
				String param = "";
				if(cond.containsKey("param")) {
					param = (String) cond.get("param");
				} else {
					param = id;
				}

				String stmt = (String) cond.get("stmt");
				String type = (String) cond.get("type");

				boolean isRequire = (boolean) cond.getOrDefault("require", false);

				if(StringUtils.equals(columnVo.getData(), id)) {

					if(StringUtils.isNotBlank(columnVo.getSearchValue())) {

						String condition = CommonUtils.replaceFilter(isRequire, stmt, param, type, mapperParseVo.getMap());
						if(StringUtils.isNotEmpty(condition)) {
							mapperParseVo.getFilterList().add(condition);
						}
					} else {

						if(isRequire) {

							String condition = CommonUtils.replaceRequireFilter(stmt, param, type, mapperParseVo.getMap());
							if(StringUtils.isNotEmpty(condition)) {
								mapperParseVo.getFilterList().add(condition);
							}
						}
					}
				}
			});

			if(Integer.parseInt(StringUtils.trim(request.getParameter("order[0][column]"))) == i) {
				mapperParseVo.getMap().put("orderBy", StringUtils.trim(request.getParameter("columns[" + i + "][data]")) + " " + StringUtils.trim(request.getParameter("order[0][dir]")));
			}

			mapperParseVo.getColumns().add(columnVo);
		}

		return mapperParseVo;
	}

	/**
	 * 
	 * @param request
	 * @param configMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static MapperParseVo parseRequestParam(
			HttpServletRequest request,
			Map<String, Object> configMap) {

		Map<String, Object> sqlMap = (Map<String, Object>) configMap.get("sql");
		List<Map<String, Object>> stmtList = (List<Map<String, Object>>) sqlMap.get("stmts");

		MapperParseVo mapperParseVo = new MapperParseVo();

		if((boolean) sqlMap.get("where")) {
			mapperParseVo.setWhere("AND");
		} else {
			mapperParseVo.setWhere("WHERE");
		}

		String sortDirect = StringUtils.trim(request.getParameter("sort[sort]"));
		String sortField = StringUtils.trim(request.getParameter("sort[field]"));
		if(StringUtils.isNotBlank(sortField)) {
			mapperParseVo.getMap().put("orderBy", sortField + " " + sortDirect);
		}

		int page = Integer.parseInt(StringUtils.trim(StringUtils.defaultIfBlank(request.getParameter("pagination[page]"), "0")));
		int pages = Integer.parseInt(StringUtils.trim(StringUtils.defaultIfBlank(request.getParameter("pagination[pages]"), "0")));
		int perpage = Integer.parseInt(StringUtils.trim(StringUtils.defaultIfBlank(request.getParameter("pagination[perpage]"), "0")));
		int total = Integer.parseInt(StringUtils.trim(StringUtils.defaultIfBlank(request.getParameter("pagination[total]"), "0")));

		mapperParseVo.setMetadata(
				MapperParseVo.MetaData.builder()
				.page(page)
				.pages(pages)
				.perpage(perpage)
				.total(total)
				.build());

		int start = 0;
		if(page > 1) {
			start = (page * perpage) - perpage;
		}
		mapperParseVo.getMap().put("start", start);
		mapperParseVo.getMap().put("length", perpage);

		Map<String, String> searchFilterMap = new HashMap<String, String>();

		List<List<Map<String, Object>>> filterList = (List<List<Map<String, Object>>>) configMap.get("filter");
		for (List<Map<String, Object>> filter: filterList) {
			for (Map<String, Object> subFilter : filter) {

				String filterId = "query[" + subFilter.get("id") + "]";
				if(request.getParameterMap().containsKey(filterId)) {
					searchFilterMap.put((String) subFilter.get("id"), request.getParameter(filterId));
				}
			}
		}

		searchFilterMap.forEach((searchKey, searchValue) -> {

			if(StringUtils.contains(searchValue, "|")) {

				String[] arr = StringUtils.split(searchValue, "|");
				switch (arr.length) {
				case 2:
					mapperParseVo.getMap().put(searchKey, searchValue);
					mapperParseVo.getMap().put("start_" + searchKey, arr[0]);
					mapperParseVo.getMap().put("end_" + searchKey, arr[1]);
					break;
				default:
					mapperParseVo.getMap().put(searchKey, searchValue);
					break;
				}
			} else {
				mapperParseVo.getMap().put(searchKey, searchValue);
			}

			stmtList.forEach(cond -> {

				String id = (String) cond.get("id");
				String param = "";
				if(cond.containsKey("param")) {
					param = (String) cond.get("param");
				} else {
					param = id;
				}

				String stmt = (String) cond.get("stmt");
				String type = (String) cond.get("type");

				boolean isRequire = (boolean) cond.getOrDefault("require", false);

				if(StringUtils.equals(searchKey, id)) {

					if(StringUtils.isNotBlank(searchValue)) {

						String condition = CommonUtils.replaceFilter(isRequire, stmt, param, type, mapperParseVo.getMap());
						if(StringUtils.isNotEmpty(condition)) {
							mapperParseVo.getFilterList().add(condition);
						}
					} else {

						if(isRequire) {

							String condition = CommonUtils.replaceRequireFilter(stmt, param, type, mapperParseVo.getMap());
							if(StringUtils.isNotEmpty(condition)) {
								mapperParseVo.getFilterList().add(condition);
							}
						}
					}
				}
			});
		});

		return mapperParseVo;
	}

	/**
	 * 
	 * @param request
	 * @param columnSize
	 * @param configMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static MapperParseVo parseExcelRequestParam(
			HttpServletRequest request,
			int columnSize,
			Map<String, Object> configMap) {

		Map<String, Object> sqlMap = (Map<String, Object>) configMap.get("sql");
		List<Map<String, Object>> stmtList = (List<Map<String, Object>>) sqlMap.get("stmts");

		MapperParseVo mapperParseVo = new MapperParseVo();

		if((boolean) sqlMap.get("where")) {
			mapperParseVo.setWhere("AND");
		} else {
			mapperParseVo.setWhere("WHERE");
		}

		Iterator<String> iterator = request.getParameterNames().asIterator();
		while(iterator.hasNext()) {

			String paramKey = iterator.next();
			String paramValue = request.getParameter(paramKey);

			if(StringUtils.contains(paramValue, "|")) {

				String[] arr = StringUtils.split(paramValue, "|");
				switch (arr.length) {
				case 2:
					mapperParseVo.getMap().put(paramKey, paramValue);
					mapperParseVo.getMap().put("start_" + paramKey, arr[0]);
					mapperParseVo.getMap().put("end_" + paramKey, arr[1]);
					break;
				default:
					mapperParseVo.getMap().put(paramKey, paramValue);
					break;
				}
			} else {
				mapperParseVo.getMap().put(paramKey, paramValue);
			}

			stmtList.forEach(cond -> {

				String id = (String) cond.get("id");
				String param = "";
				if(cond.containsKey("param")) {
					param = (String) cond.get("param");
				} else {
					param = id;
				}

				String stmt = (String) cond.get("stmt");
				String type = (String) cond.get("type");

				boolean isRequire = (boolean) cond.getOrDefault("require", false);

				if(StringUtils.equals(paramKey, id)) {

					if(StringUtils.isNotBlank(paramValue)) {

						String condition = CommonUtils.replaceFilter(isRequire, stmt, param, type, mapperParseVo.getMap());
						if(StringUtils.isNotEmpty(condition)) {
							mapperParseVo.getFilterList().add(condition);
						}
//						mapperParseVo.getFilterList().add(CommonUtils.replaceFilter(stmt, param, type, mapperParseVo.getMap()));
					} else {

						if(isRequire) {

							String condition = CommonUtils.replaceRequireFilter(stmt, param, type, mapperParseVo.getMap());
							if(StringUtils.isNotEmpty(condition)) {
								mapperParseVo.getFilterList().add(condition);
							}
//							mapperParseVo.getFilterList().add(CommonUtils.replaceRequireFilter(stmt, param, type, mapperParseVo.getMap()));
						}
					}
				}
			});
		}

		return mapperParseVo;
	}

	/**
	 * 
	 * @param parameterMap
	 * @param columnSize
	 * @param configMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static MapperParseVo parseExcelParam(
			Map<String, String> parameterMap,
			int columnSize,
			Map<String, Object> configMap) {

		Map<String, Object> sqlMap = (Map<String, Object>) configMap.get("sql");
		List<Map<String, Object>> stmtList = (List<Map<String, Object>>) sqlMap.get("stmts");

		MapperParseVo mapperParseVo = new MapperParseVo();

		if((boolean) sqlMap.get("where")) {
			mapperParseVo.setWhere("AND");
		} else {
			mapperParseVo.setWhere("WHERE");
		}

		for (String paramKey : parameterMap.keySet()) {

			String paramValue = parameterMap.get(paramKey);
			if(StringUtils.contains(paramValue, "|")) {

				String[] arr = StringUtils.split(paramValue, "|");
				switch (arr.length) {
				case 2:
					mapperParseVo.getMap().put(paramKey, paramValue);
					mapperParseVo.getMap().put("start_" + paramKey, arr[0]);
					mapperParseVo.getMap().put("end_" + paramKey, arr[1]);
					break;
				default:
					mapperParseVo.getMap().put(paramKey, paramValue);
					break;
				}
			} else {
				mapperParseVo.getMap().put(paramKey, paramValue);
			}

			stmtList.forEach(cond -> {

				String id = (String) cond.get("id");
				String param = "";
				if(cond.containsKey("param")) {
					param = (String) cond.get("param");
				} else {
					param = id;
				}

				String stmt = (String) cond.get("stmt");
				String type = (String) cond.get("type");

				boolean isRequire = (boolean) cond.getOrDefault("require", false);

				if(StringUtils.equals(paramKey, id)) {

					if(StringUtils.isNotBlank(paramValue)) {

						String condition = CommonUtils.replaceFilter(isRequire, stmt, param, type, mapperParseVo.getMap());
						if(StringUtils.isNotEmpty(condition)) {
							mapperParseVo.getFilterList().add(condition);
						}
//						mapperParseVo.getFilterList().add(CommonUtils.replaceFilter(stmt, param, type, mapperParseVo.getMap()));
					} else {

						if(isRequire) {

							String condition = CommonUtils.replaceRequireFilter(stmt, param, type, mapperParseVo.getMap());
							if(StringUtils.isNotEmpty(condition)) {
								mapperParseVo.getFilterList().add(condition);
							}
//							mapperParseVo.getFilterList().add(CommonUtils.replaceRequireFilter(stmt, param, type, mapperParseVo.getMap()));
						}
					}
				}
			});
		}

		return mapperParseVo;
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	public static void printRequestParameter(HttpServletRequest request) {

		System.out.println("== Start Print Request Parameter ==");
		request.getParameterNames().asIterator().forEachRemaining(str -> {
			System.out.println(str + " : " + request.getParameter(str));
		});
		System.out.println("== End Print Request Parameter ==");
	}
}