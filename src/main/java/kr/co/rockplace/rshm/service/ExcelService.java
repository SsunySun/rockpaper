package kr.co.rockplace.rshm.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.db.mapper.rshm.ListMapper;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.ExcelUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import kr.co.rockplace.rshm.utils.RequestUtils;
import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Excel Service
 * @author wonsunlee
 *
 */
@Service
public class ExcelService {

	@Autowired
	private ListService listService;

	@Autowired
	private ListMapper listMapper;

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getExcelList(
			HttpServletRequest request,
			String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		int columnSize = 0;
		if(listEntity != null) {

			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}
		}

		MapperParseVo mapperParseVo = RequestUtils.parseExcelRequestParam(request, columnSize, configMap);

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

		return resultList;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getTeamWorkTimeExcelList(
			HttpServletRequest request,
			String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		int columnSize = 0;
		if(listEntity != null) {

			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}
		}

		MapperParseVo mapperParseVo = RequestUtils.parseExcelRequestParam(request, columnSize, configMap);
		mapperParseVo.getMap().put("orderBy", "charge_emp_name asc, act_start_date asc");

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

		return resultList;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getEmployeeByTeamExcelList(
			Map<String, String> parameterMap,
			String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		int columnSize = 0;
		if(listEntity != null) {

			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}
		}

		MapperParseVo mapperParseVo = RequestUtils.parseExcelParam(parameterMap, columnSize, configMap);
		mapperParseVo.getMap().put("orderBy", "charge_emp_name asc, act_start_date asc");

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

		return resultList;
	}

	/**
	 * ?????? ?????? ????????????(??????, ?????????)
	 * @param map
	 * @return
	 */
	private List<Map<String, Object>> getListByList(Map<String, Object> mapperMap) {
		return this.listMapper.getListByList(mapperMap);
	}

	/**
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param name
	 */
	public void writeTitle(Sheet sheet, String name, int columnSize) {

		// List Title 
		int firstRow = 0;
		int lastRow = firstRow;
		int firstCol = 0;
		int lastCol = firstCol + columnSize -1;

		// Title Box ????????? Merge??? Cell??? ?????? ??? Style ?????? 
		ExcelUtils.createMergeCell(sheet, firstRow, lastRow, firstCol, lastCol);

		Row row = ExcelUtils.getRow(sheet, firstRow);
		Cell cell = ExcelUtils.getCell(row, firstCol, true);

		// Title ??? ?????? 
		cell.setCellValue(StringUtils.abbreviate(name, 32000));

		// Title Cell??? Style ??????(Font Height, Alignment, WrapText ???)
		ExcelUtils.setStyleOfTitle(cell);

		// Title Box ?????? Merge ?????? 
		sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));

		// Column Width ???????????? 
		sheet.setColumnWidth(cell.getColumnIndex(), Math.min(255 * 256, ExcelUtils.DEFAULT_COLUMN_WIDTH));
	}

	/**
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param columnList
	 */
	public void writeColumnHeader(Sheet sheet, List<Map<String, Object>> columnList) {

		// List Title 
		int startRow = 2;
		int startColumn = 0;

		for(Map<String, Object> column: columnList) {

			if(StringUtils.equals((String) column.get("type"), "action")) {
				continue;
			}

			Row row = ExcelUtils.getRow(sheet, startRow);
			Cell cell = ExcelUtils.getCell(row, startColumn++, true);

			// Title ??? ?????? 
			cell.setCellValue(StringUtils.abbreviate((String) column.get("name"), 32000));

			// Title Cell??? Style ??????(Font Height, Alignment, WrapText ???)
			ExcelUtils.setStyleOfHeader(cell);

			// Column Width ???????????? 
			sheet.setColumnWidth(cell.getColumnIndex(), Math.min(255 * 256, ExcelUtils.DEFAULT_COLUMN_WIDTH));
		}
	}

	/**
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param columnList
	 * @param resultList
	 */
	public void writeColumnData(Sheet sheet, List<Map<String, Object>> columnList, List<Map<String, Object>> resultList) {

		// List Title 
		int startRow = 3;

		for (Map<String, Object> resultMap : resultList) {

			int startColumn = 0;
			for(Map<String, Object> column: columnList) {

				if(StringUtils.equals((String) column.get("type"), "action")) {
					continue;
				}

				Row row = ExcelUtils.getRow(sheet, startRow);
				Cell cell = ExcelUtils.getCell(row, startColumn++, true);

				// Data ??? ?????? 
				if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "String")) {
					cell.setCellValue(StringUtils.abbreviate((String) resultMap.get((String)column.get("data")), 32000));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Integer")) {
					cell.setCellValue(Integer.parseInt(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Double")) {
					cell.setCellValue(Double.parseDouble(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Boolean")) {
					cell.setCellValue(Boolean.parseBoolean(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "LocalDate")) {
					cell.setCellValue(LocalDate.parse(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "LocalDateTime")) {
					cell.setCellValue(LocalDateTime.parse(String.valueOf(resultMap.get((String)column.get("data")))));
				} else {
					cell.setCellValue(String.valueOf(resultMap.get((String)column.get("data"))));
				}

				// Data Cell??? Style ??????(Font Height, Alignment, WrapText ???)
				ExcelUtils.setStyleOfData(cell);

				// Column Width ???????????? 
				sheet.setColumnWidth(cell.getColumnIndex(), Math.min(255 * 256, ExcelUtils.DEFAULT_COLUMN_WIDTH));
			}
			startRow++;
		}
	}

	/**
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param columnList
	 * @param resultList
	 */
	public void writeColumnDataByTeamWorkTime(Sheet sheet, List<Map<String, Object>> columnList, List<Map<String, Object>> resultList) {

		// List Title 
		int startRow = 3;

		for (Map<String, Object> resultMap : resultList) {

			int startColumn = 0;
			for(Map<String, Object> column: columnList) {

				if(StringUtils.equals((String) column.get("type"), "action")) {
					continue;
				}

				Row row = ExcelUtils.getRow(sheet, startRow);
				Cell cell = null;

				if(StringUtils.equals((String) column.get("data"), "charge_dpt_name")) {

					cell = ExcelUtils.getCell(row, startColumn++, false);

					// HyperLink ?????? 
					String hyperLinkAddress = String.format("'%s(%s)'!%s", resultMap.get("charge_dpt_name"), resultMap.get("charge_org_name"), ExcelUtils.DEFAULT_HYPERLINK_ADDRESS);

					// HyperLink Style ??????(HyperLink, Border, Fill Foreground Color, Alignment ???)
					ExcelUtils.setStyleOfHyperLink(cell, hyperLinkAddress);
				} else {

					cell = ExcelUtils.getCell(row, startColumn++, true);

					// Data Cell??? Style ??????(Font Height, Alignment, WrapText ???)
					ExcelUtils.setStyleOfData(cell);
				}

				// Data ??? ?????? 
				if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "String")) {
					cell.setCellValue(StringUtils.abbreviate((String) resultMap.get((String)column.get("data")), 32000));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Integer")) {
					cell.setCellValue(Integer.parseInt(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Double")) {
					cell.setCellValue(Double.parseDouble(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Boolean")) {
					cell.setCellValue(Boolean.parseBoolean(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "LocalDate")) {
					cell.setCellValue(LocalDate.parse(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "LocalDateTime")) {
					cell.setCellValue(LocalDateTime.parse(String.valueOf(resultMap.get((String)column.get("data")))));
				} else {
					cell.setCellValue(String.valueOf(resultMap.get((String)column.get("data"))));
				}

				// Column Width ???????????? 
				sheet.setColumnWidth(cell.getColumnIndex(), Math.min(255 * 256, ExcelUtils.DEFAULT_COLUMN_WIDTH));
			}
			startRow++;
		}
	}

	/**
	 * @param sheet {@link org.apache.poi.ss.usermodel.Sheet}
	 * @param columnList
	 * @param resultList
	 */
	public void writeColumnDataByEmployeeWorkTime(Sheet sheet, List<Map<String, Object>> columnList, List<Map<String, Object>> resultList) {

		// List Title 
		int startRow = 3;

		for (Map<String, Object> resultMap : resultList) {

			int startColumn = 0;
			for(Map<String, Object> column: columnList) {

				if(StringUtils.equals((String) column.get("type"), "action")) {
					continue;
				}

				Row row = ExcelUtils.getRow(sheet, startRow);
				Cell cell = null;

				if(StringUtils.equals((String) column.get("data"), "charge_emp_name")) {

					cell = ExcelUtils.getCell(row, startColumn++, false);

					// HyperLink ?????? 
					String hyperLinkAddress = String.format("'%s(%s)'!%s", resultMap.get("charge_emp_name"), resultMap.get("charge_emp_id"), ExcelUtils.DEFAULT_HYPERLINK_ADDRESS);

					// HyperLink Style ??????(HyperLink, Border, Fill Foreground Color, Alignment ???)
					ExcelUtils.setStyleOfHyperLink(cell, hyperLinkAddress);
				} else {

					cell = ExcelUtils.getCell(row, startColumn++, true);

					// Data Cell??? Style ??????(Font Height, Alignment, WrapText ???)
					ExcelUtils.setStyleOfData(cell);
				}

				// Data ??? ?????? 
				if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "String")) {
					cell.setCellValue(StringUtils.abbreviate((String) resultMap.get((String)column.get("data")), 32000));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Integer")) {
					cell.setCellValue(Integer.parseInt(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Double")) {
					cell.setCellValue(Double.parseDouble(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "Boolean")) {
					cell.setCellValue(Boolean.parseBoolean(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "LocalDate")) {
					cell.setCellValue(LocalDate.parse(String.valueOf(resultMap.get((String)column.get("data")))));
				} else if(StringUtils.equals(resultMap.get((String)column.get("data")).getClass().getSimpleName(), "LocalDateTime")) {
					cell.setCellValue(LocalDateTime.parse(String.valueOf(resultMap.get((String)column.get("data")))));
				} else {
					cell.setCellValue(String.valueOf(resultMap.get((String)column.get("data"))));
				}

				// Column Width ???????????? 
				sheet.setColumnWidth(cell.getColumnIndex(), Math.min(255 * 256, ExcelUtils.DEFAULT_COLUMN_WIDTH));
			}
			startRow++;
		}
	}

	public void writeHyperLinkToMain(Sheet sheet, Sheet mainSheet) {

		// List Title 
		int startRow = 1;
		int startColumn = 0;

		Row row = ExcelUtils.getRow(sheet, startRow);
		Cell cell = ExcelUtils.getCell(row, startColumn++, false);

		// Title ????????? HyperLink ?????? 
		String hyperLinkAddress = String.format("'%s'!%s", mainSheet.getSheetName(), ExcelUtils.DEFAULT_HYPERLINK_ADDRESS);

		// HyperLink Style ??????(HyperLink, Border, Fill Foreground Color, Alignment ???)
		ExcelUtils.setStyleOfHyperLink(cell, hyperLinkAddress);

		// Data ??? ?????? 
		cell.setCellValue("Back");
	}
}