package kr.co.rockplace.rshm.view;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.service.ExcelService;
import kr.co.rockplace.rshm.service.WorkTimeService;
import kr.co.rockplace.rshm.service.WorkTimeService.TimeSet;
import kr.co.rockplace.rshm.service.admin.DepartmentService;
import kr.co.rockplace.rshm.service.admin.EmployeeService;
import kr.co.rockplace.rshm.service.admin.HolidayService;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.service.admin.OrganizationService;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.ExcelUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * Team WorkTime Excel Result View Class
 * @author wonsunlee
 *
 */
@Slf4j
public class TeamWorkTimeExcelView extends AbstractXlsxView {

	/**
	 * The content type for an Excel response
	 */
	private final String CONTENT_TYPE = "application/vnd.ms-excel";

	/**
	 * Constructor
	 */
	public TeamWorkTimeExcelView() {
		setContentType(CONTENT_TYPE);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, 
			Workbook workbook,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		long start = System.currentTimeMillis();

		// View에서는 @Autowired가 안되어서 model 객체에 service 객체를 담아서 넘김. 
		ExcelService excelService = (ExcelService) model.get("excelService");
		ListService listService = (ListService) model.get("listService");
		WorkTimeService workTimeService = (WorkTimeService) model.get("workTimeService");
		HolidayService holidayService = (HolidayService) model.get("holidayService");
		EmployeeService employeeService = (EmployeeService) model.get("employeeService");
		DepartmentService departmentService = (DepartmentService) model.get("departmentService");
		OrganizationService organizationService = (OrganizationService) model.get("organizationService");

		String lstId = (String) model.get("lstId");

		String excelName = "rockpaper";
		// Excel Download Filename 설정 
		response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + excelName + ".xlsx");

		List<Map<String, Object>> resultList = excelService.getTeamWorkTimeExcelList(request, lstId);

		workbook = new XSSFWorkbook();

		Sheet sheet = ExcelUtils.getSheet(workbook);

		ListEntity listEntity = listService.getObject(lstId);

		if(listEntity != null) {

			String listName = listEntity.getName();
			int columnSize = 0;
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}

			// Write of List Title
			excelService.writeTitle(sheet, listName, columnSize);

			// Write of List Column Header
			excelService.writeColumnHeader(sheet, columnList);

			Map<String, Map<LocalDate, List<Map<String, Object>>>> employeeMap = new HashMap<String, Map<LocalDate, List<Map<String, Object>>>>();

			// DB 조회 결과값을 엔지니어별, 날짜별로 데이터 재조합
			resultList.forEach(map -> {

				String employee = (String) map.get("charge_emp_id");
				LocalDateTime startDateTime = ((Timestamp) map.get("act_start_date")).toLocalDateTime();
				LocalDate standDate = LocalDate.of(startDateTime.getYear(), startDateTime.getMonth(), startDateTime.getDayOfMonth());

				if(employeeMap.containsKey(employee)) {

					Map<LocalDate, List<Map<String, Object>>> dateListMap = employeeMap.get(employee);
					if(dateListMap.containsKey(standDate)) {

						List<Map<String, Object>> list = dateListMap.get(standDate);
						list.add(map);

						dateListMap.put(standDate, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						dateListMap.put(standDate, list);
					}

					employeeMap.put(employee, dateListMap);
				} else {

					Map<LocalDate, List<Map<String, Object>>> dateListMap = new HashMap<LocalDate, List<Map<String, Object>>>();
					if(dateListMap.containsKey(standDate)) {

						List<Map<String, Object>> list = dateListMap.get(standDate);
						list.add(map);

						dateListMap.put(standDate, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						dateListMap.put(standDate, list);
					}
					employeeMap.put(employee, dateListMap);
				}
			});

			// 엔지니어별로 근로 시간 계산 / empId: 직원 ID, mapValue: 날짜별 리스트 정보 
			List<Map<String, Object>> calcWorkTimeList = new ArrayList<Map<String, Object>>();
			employeeMap.forEach((empId, dateListMap) -> {

				// 날짜별로 정렬 
				List<Map.Entry<LocalDate, List<Map<String, Object>>>> entries = dateListMap.entrySet().
						stream().
						sorted(Map.Entry.comparingByKey()).
						collect(Collectors.toList());

				for (Map.Entry<LocalDate, List<Map<String, Object>>> entry : entries) {

					LocalDate date = entry.getKey();
					List<Map<String, Object>> workList = entry.getValue();

					// 휴일 체크
					boolean isHoliday = holidayService.checkHoliday(date);

					// 지원 유형이 방문지원(SHM_CATALOG_001) 일 경우 true, 아닐 경우 false
					boolean isAlternativeHoliday = false;
					String catCd = "";

					List<TimeSet> timeSetList = new ArrayList<TimeSet>();
					for (Map<String, Object> workMap : workList) {

						timeSetList.add(new TimeSet(((Timestamp) workMap.get("act_start_date")).toLocalDateTime(), ((Timestamp) workMap.get("act_finish_date")).toLocalDateTime()));

						catCd = (String) workMap.get("cat_cd");
						if(StringUtils.equals(catCd, "SHM_CATALOG_001")) {
							isAlternativeHoliday = true;
						}
					}

					Map<String, List<TimeSet>> calcWorkTimeMap = workTimeService.calcWorkTime(timeSetList, isHoliday);
					Map<String, Double> calcWeightWorkTimeMap = workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);
					Map<String, Object> returnMap = new HashMap<String, Object>();

					String empName = employeeService.getName(empId);
					String empDptId = employeeService.getDepartmentId(empId);
					String empDptName = departmentService.getName(empDptId);
					String empOrgId = employeeService.getOrganizationId(empId);
					String empOrgName = organizationService.getName(empOrgId);

					returnMap.put("charge_emp_id", empId);	// 엔지니어 ID
					returnMap.put("charge_emp_name", empName);	// 엔지니어명
					returnMap.put("charge_dpt_id", empDptId);	// 엔지니어 부서 ID
					returnMap.put("charge_dpt_name", empDptName);	// 엔지니어 부서명
					returnMap.put("charge_org_id", empOrgId);	// 엔지니어 회사 ID
					returnMap.put("charge_org_name", empOrgName);	// 엔지니어 회사명
					returnMap.put("work_date", date);	// 지원 시작일

					returnMap.put("calcWeightWorkTimeMap", calcWeightWorkTimeMap);

					calcWorkTimeList.add(returnMap);
				}
			});

			// 유저별로 계산된 공식을 팀별로 재조합(부서 & 유저 & 업무시간)
			Map<String, Map<String, List<Map<String, Object>>>> departmentMap = new HashMap<String, Map<String, List<Map<String, Object>>>>();
			calcWorkTimeList.forEach(map -> {

				String dptId = (String) map.get("charge_dpt_id");
				String empId = (String) map.get("charge_emp_id");

				if(departmentMap.containsKey(dptId)) {

					Map<String, List<Map<String, Object>>> empListMap = departmentMap.get(dptId);
					if(empListMap.containsKey(empId)) {

						List<Map<String, Object>> list = empListMap.get(empId);
						list.add(map);

						empListMap.put(empId, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						empListMap.put(empId, list);
					}

					departmentMap.put(dptId, empListMap);
				} else {

					Map<String, List<Map<String, Object>>> empListMap = new HashMap<String, List<Map<String, Object>>>();
					if(empListMap.containsKey(empId)) {

						List<Map<String, Object>> list = empListMap.get(empId);
						list.add(map);

						empListMap.put(empId, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						empListMap.put(empId, list);
					}
					departmentMap.put(dptId, empListMap);
				}
			});

			int index = 0;
			List<Map<String, Object>> teamReturnList = new ArrayList<Map<String, Object>>();

			// 부서ID로 정렬 
			List<Entry<String, Map<String, List<Map<String, Object>>>>> entries = departmentMap.entrySet().
					stream().
					sorted(Map.Entry.comparingByKey()).
					collect(Collectors.toList());

			for (Entry<String, Map<String, List<Map<String, Object>>>> entry : entries) {

				String dptId = entry.getKey();
				Map<String, List<Map<String, Object>>> employeeListMap = entry.getValue();

				Map<String, Object> returnMap = new HashMap<String, Object>();

				String charge_dpt_id = dptId;	// 부서 ID
				String charge_dpt_name = "";	// 부서명
				String charge_org_id = "";	// 회사 ID
				String charge_org_name = "";	// 회사명
				int employee_count = 0;	// 부서 인원

				double stand_work_time = 0;	// 소정 근로시간
				double work_time = 0;	// 총 근무시간
				double over_time = 0;	// 연장 근로시간
				double night_time = 0;	// 야간 근로시간
				double holiday_time = 0;	// 휴일 근로시간
				double compensation_time = 0;	// 보상 발생시간

				for(String empId: employeeListMap.keySet()) {

					employee_count++;
					List<Map<String, Object>> dateList = employeeListMap.get(empId);
					for (Map<String, Object> dateMap : dateList) {

						charge_dpt_name = (String) dateMap.get("charge_dpt_name");
						charge_org_id = (String) dateMap.get("charge_org_id");
						charge_org_name = (String) dateMap.get("charge_org_name");

						Map<String, Double> calcWeightWorkTimeMap = (Map<String, Double>) dateMap.get("calcWeightWorkTimeMap");

						work_time += calcWeightWorkTimeMap.get("calcSumWorkTime");	// 총 근무시간
						over_time += calcWeightWorkTimeMap.get("overTimeTotalMinutes");		// 연장 근로시간
						night_time += calcWeightWorkTimeMap.get("nightTimeTotalMinutes");		// 야간 근로시간
						holiday_time += calcWeightWorkTimeMap.get("holidayWorkTimeTotalMinutes");	// 휴일 근로시간
						compensation_time += calcWeightWorkTimeMap.get("weight_compensation_total_time");		// 보상 발생시간
					}
				}

				String search_date = request.getParameter("search_date");
				stand_work_time = workTimeService.getRangeDateStandWorkTime(request.getParameter("search_date"), employee_count);	// 소정 근로시간

				returnMap.put("rownum", index++);

				returnMap.put("search_date", search_date);
				returnMap.put("charge_dpt_id", charge_dpt_id);
				returnMap.put("charge_dpt_name", charge_dpt_name);
				returnMap.put("charge_org_id", charge_org_id);
				returnMap.put("charge_org_name", charge_org_name);
				returnMap.put("employee_count", employee_count + "명");

				int workingDay = workTimeService.getRangeDateWorkingDay(search_date, employee_count);
				double day_avg_work_time = CommonUtils.roundValue(work_time / workingDay, 2);	// 일 평균 근로시간
				double week = workTimeService.getRangeDateWeekCount(search_date);
				double week_avg_work_time = CommonUtils.roundValue(work_time / week, 2);	// 주 평균 근로시간
				returnMap.put("day_avg_work_time", workTimeService.convertPrintWorkTime(day_avg_work_time));
				returnMap.put("week_avg_work_time", workTimeService.convertPrintWorkTime(week_avg_work_time));

				returnMap.put("stand_work_time", stand_work_time);
				returnMap.put("stand_work_time_str", workTimeService.convertPrintWorkTime(stand_work_time));

				returnMap.put("work_time", work_time);
				returnMap.put("work_time_str", workTimeService.convertPrintWorkTime(work_time));

				returnMap.put("over_time", over_time);
				returnMap.put("over_time_str", workTimeService.convertPrintWorkTime(over_time));

				returnMap.put("night_time", night_time);
				returnMap.put("night_time_str", workTimeService.convertPrintWorkTime(night_time));

				returnMap.put("holiday_time", holiday_time);
				returnMap.put("holiday_time_str", workTimeService.convertPrintWorkTime(holiday_time));

				returnMap.put("compensation_time", compensation_time);
				returnMap.put("compensation_time_str", workTimeService.convertPrintWorkTime(compensation_time));

				teamReturnList.add(returnMap);

				Map<String, String> parameterMap = new HashMap<String,String>();
				parameterMap.put("charge_dpt_id", charge_dpt_id);
				parameterMap.put("charge_dpt_name", charge_dpt_name);
				parameterMap.put("charge_org_id", charge_org_id);
				parameterMap.put("charge_org_name", charge_org_name);
				parameterMap.put("search_date", search_date);

				this.buildEmployeeByTeamList(model, parameterMap, workbook, (String) configMap.get("child_list"), resultList);
			}

			// Write of List Column Data
			excelService.writeColumnDataByTeamWorkTime(sheet, columnList, teamReturnList);
		} else {
			excelService.writeTitle(sheet, "리스트가 없습니다.", 1);
		}

		ServletOutputStream out = response.getOutputStream();
		workbook.write(out);
		workbook.close();

		if (out != null) {
			out.close();
		}

		long finish = System.currentTimeMillis();
		long timeElapsed = finish - start;
		log.info("timeElapsed : " + timeElapsed);
	}

	@SuppressWarnings("unchecked")
	private void buildEmployeeByTeamList(Map<String, Object> model, 
			Map<String, String> parameterMap, 
			Workbook workbook, 
			String lstId,
			List<Map<String, Object>> resultList) {

		// View에서는 @Autowired가 안되어서 model 객체에 service 객체를 담아서 넘김. 
		ExcelService excelService = (ExcelService) model.get("excelService");
		ListService listService = (ListService) model.get("listService");
		WorkTimeService workTimeService = (WorkTimeService) model.get("workTimeService");
		HolidayService holidayService = (HolidayService) model.get("holidayService");
		EmployeeService employeeService = (EmployeeService) model.get("employeeService");

		List<Map<String, Object>> filteredResultList = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> resultMap : resultList) {
			if(StringUtils.equals((String)resultMap.get("charge_dpt_id"), parameterMap.get("charge_dpt_id"))) {
				filteredResultList.add(resultMap);
			}
		}

		Sheet sheet = ExcelUtils.getSheet(workbook, parameterMap.get("charge_dpt_name") + "(" + parameterMap.get("charge_org_name") + ")");

		ListEntity listEntity = listService.getObject(lstId);
		if(listEntity != null) {

			String listName = listEntity.getName();
			int columnSize = 0;
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}

			// Write of List Title
			excelService.writeTitle(sheet, listName, columnSize);

			// Write of Hyperlink To Main
			excelService.writeHyperLinkToMain(sheet, workbook.getSheetAt(0));

			// Write of List Column Header
			excelService.writeColumnHeader(sheet, columnList);

			Map<String, Map<LocalDate, List<Map<String, Object>>>> employeeMap = new LinkedHashMap<String, Map<LocalDate, List<Map<String, Object>>>>();

			// DB 조회 결과값을 엔지니어별, 날짜별로 데이터 재조합
			filteredResultList.forEach(map -> {

				String employee = (String) map.get("charge_emp_id");
				LocalDateTime startDateTime = ((Timestamp) map.get("act_start_date")).toLocalDateTime();
				LocalDate standDate = LocalDate.of(startDateTime.getYear(), startDateTime.getMonth(), startDateTime.getDayOfMonth());

				if(employeeMap.containsKey(employee)) {

					Map<LocalDate, List<Map<String, Object>>> dateListMap = employeeMap.get(employee);
					if(dateListMap.containsKey(standDate)) {

						List<Map<String, Object>> list = dateListMap.get(standDate);
						list.add(map);

						dateListMap.put(standDate, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						dateListMap.put(standDate, list);
					}

					employeeMap.put(employee, dateListMap);
				} else {

					Map<LocalDate, List<Map<String, Object>>> dateListMap = new HashMap<LocalDate, List<Map<String, Object>>>();
					if(dateListMap.containsKey(standDate)) {

						List<Map<String, Object>> list = dateListMap.get(standDate);
						list.add(map);

						dateListMap.put(standDate, list);
					} else {

						List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						list.add(map);

						dateListMap.put(standDate, list);
					}
					employeeMap.put(employee, dateListMap);
				}
			});

			// 엔지니어별로 근로 시간 계산 / empId: 직원 ID, mapValue: 날짜별 리스트 정보 
			List<Map<String, Object>> calcWorkTimeList = new ArrayList<Map<String, Object>>();

			employeeMap.forEach((empId, dateListMap) -> {

				Map<String, Object> returnMap = new LinkedHashMap<String, Object>();

				String charge_emp_id = empId;	// 엔지니어 ID
				String charge_emp_name = employeeService.getName(empId);	// 엔지니어

				// 유저별 업무 상세 리스트
				parameterMap.put("charge_emp_id", charge_emp_id);
				parameterMap.put("charge_emp_name", charge_emp_name);

				List<Map<String, Object>> employeeDetailResultList = new ArrayList<Map<String, Object>>();
				for (Map<String, Object> resultMap : filteredResultList ) {
					if(StringUtils.equals((String) resultMap.get("charge_emp_id"), empId)) {
						employeeDetailResultList.add(resultMap);
					}
				}

				this.buildEmployeeDetailList(model, parameterMap, workbook, sheet, (String) configMap.get("child_list"), employeeDetailResultList);

				double stand_work_time = 0;	// 소정 근로시간
				double work_time = 0;	// 총 근무시간
				double over_time = 0;	// 연장 근로시간
				double night_time = 0;	// 야간 근로시간
				double holiday_time = 0;	// 휴일 근로시간
				double compensation_time = 0;	// 보상 발생시간

				for (LocalDate date : dateListMap.keySet()) {

					List<Map<String, Object>> workList = dateListMap.get(date);

					// 휴일 체크
					boolean isHoliday = holidayService.checkHoliday(date);

					// 지원 유형이 방문지원(SHM_CATALOG_001) 일 경우 true, 아닐 경우 false
					boolean isAlternativeHoliday = false;
					String catCd = "";

					List<TimeSet> timeSetList = new ArrayList<TimeSet>();
					for (Map<String, Object> workMap : workList) {

						timeSetList.add(new TimeSet(((Timestamp) workMap.get("act_start_date")).toLocalDateTime(), ((Timestamp) workMap.get("act_finish_date")).toLocalDateTime()));

						catCd = (String) workMap.get("cat_cd");
						if(StringUtils.equals(catCd, "SHM_CATALOG_001")) {
							isAlternativeHoliday = true;
						}
					}

					Map<String, List<TimeSet>> calcWorkTimeMap = workTimeService.calcWorkTime(timeSetList, isHoliday);
					Map<String, Double> calcWeightWorkTimeMap = workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);

					work_time += calcWeightWorkTimeMap.get("calcSumWorkTime");	// 총 근무시간
					over_time += calcWeightWorkTimeMap.get("overTimeTotalMinutes");		// 연장 근로시간
					night_time += calcWeightWorkTimeMap.get("nightTimeTotalMinutes");		// 야간 근로시간
					holiday_time += calcWeightWorkTimeMap.get("holidayWorkTimeTotalMinutes");	// 휴일 근로시간
					compensation_time += calcWeightWorkTimeMap.get("weight_compensation_total_time");		// 보상 발생시간
				}

				String search_date = parameterMap.get("search_date");
				stand_work_time = workTimeService.getRangeDateStandWorkTime(search_date, 1);	// 소정 근로시간

				int workingDay = workTimeService.getRangeDateWorkingDay(search_date, 1);
				double day_avg_work_time = CommonUtils.roundValue(work_time / workingDay, 2);	// 일 평균 근로시간
				double week = workTimeService.getRangeDateWeekCount(search_date);
				double week_avg_work_time = CommonUtils.roundValue(work_time / week, 2);	// 주 평균 근로시간
				returnMap.put("day_avg_work_time", workTimeService.convertPrintWorkTime(day_avg_work_time));
				returnMap.put("week_avg_work_time", workTimeService.convertPrintWorkTime(week_avg_work_time));

				returnMap.put("stand_work_time", stand_work_time);
				returnMap.put("stand_work_time_str", workTimeService.convertPrintWorkTime(stand_work_time));

				returnMap.put("work_time", work_time);
				returnMap.put("work_time_str", workTimeService.convertPrintWorkTime(work_time));

				returnMap.put("over_time", over_time);
				returnMap.put("over_time_str", workTimeService.convertPrintWorkTime(over_time));

				returnMap.put("night_time", night_time);
				returnMap.put("night_time_str", workTimeService.convertPrintWorkTime(night_time));

				returnMap.put("holiday_time", holiday_time);
				returnMap.put("holiday_time_str", workTimeService.convertPrintWorkTime(holiday_time));

				returnMap.put("compensation_time", compensation_time);
				returnMap.put("compensation_time_str", workTimeService.convertPrintWorkTime(compensation_time));

				returnMap.put("charge_emp_id", charge_emp_id);	// 엔지니어 ID
				returnMap.put("charge_emp_name", charge_emp_name);	// 엔지니어명

				calcWorkTimeList.add(returnMap);
			});

			// Write of List Column Data
			excelService.writeColumnDataByEmployeeWorkTime(sheet, columnList, calcWorkTimeList);
		} else {
			excelService.writeTitle(sheet, "리스트가 없습니다.", 1);
		}
	}

	@SuppressWarnings("unchecked")
	private void buildEmployeeDetailList(Map<String, Object> model, 
			Map<String, String> parameterMap, 
			Workbook workbook, 
			Sheet mainSheet,
			String lstId,
			List<Map<String, Object>> resultList) {

		// View에서는 @Autowired가 안되어서 model 객체에 service 객체를 담아서 넘김. 
		ExcelService excelService = (ExcelService) model.get("excelService");
		ListService listService = (ListService) model.get("listService");

		Sheet sheet = ExcelUtils.getSheet(workbook, parameterMap.get("charge_emp_name") + "(" + parameterMap.get("charge_emp_id") + ")");

		// Sheet 숨기기
		// workbook.setSheetHidden(workbook.getSheetIndex(sheet), true);

		ListEntity listEntity = listService.getObject(lstId);

		if(listEntity != null) {

			String listName = listEntity.getName();
			int columnSize = 0;
			Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view") || StringUtils.equals((String) map.get("type"), "excel")) {
					columnSize++;
				}
			}

			// Write of List Title
			excelService.writeTitle(sheet, listName, columnSize);

			// Write of Hyperlink To Main
			excelService.writeHyperLinkToMain(sheet, mainSheet);

			// Write of List Column Header
			excelService.writeColumnHeader(sheet, columnList);

			// Write of List Column Data
			excelService.writeColumnData(sheet, columnList, resultList);
		} else {
			excelService.writeTitle(sheet, "리스트가 없습니다.", 1);
		}
	}
}