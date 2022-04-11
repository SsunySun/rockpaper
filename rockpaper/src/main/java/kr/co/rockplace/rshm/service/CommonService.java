package kr.co.rockplace.rshm.service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.rockplace.rshm.db.entity.CodeTypeEntity;
import kr.co.rockplace.rshm.db.entity.ControlEntity;
import kr.co.rockplace.rshm.db.entity.DepartmentEntity;
import kr.co.rockplace.rshm.db.entity.EmployeeEntity;
import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.db.entity.MenuEntity;
import kr.co.rockplace.rshm.db.entity.RelationEntity;
import kr.co.rockplace.rshm.db.entity.SqlEntity;
import kr.co.rockplace.rshm.db.entity.TableEntity;
import kr.co.rockplace.rshm.db.entity.TableFieldEntity;
import kr.co.rockplace.rshm.db.mapper.rshm.CommonMapper;
import kr.co.rockplace.rshm.db.mapper.rshm.FormMapper;
import kr.co.rockplace.rshm.db.mapper.rshm.ListMapper;
import kr.co.rockplace.rshm.db.repository.CodeTypeRepository;
import kr.co.rockplace.rshm.db.repository.ControlRepository;
import kr.co.rockplace.rshm.db.repository.DepartmentRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.RelationRepository;
import kr.co.rockplace.rshm.db.repository.TableFieldRepository;
import kr.co.rockplace.rshm.db.repository.TableRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.service.WorkTimeService.TimeSet;
import kr.co.rockplace.rshm.service.admin.DepartmentService;
import kr.co.rockplace.rshm.service.admin.EmployeeService;
import kr.co.rockplace.rshm.service.admin.HolidayService;
import kr.co.rockplace.rshm.service.admin.ListService;
import kr.co.rockplace.rshm.service.admin.MenuService;
import kr.co.rockplace.rshm.service.admin.OrganizationService;
import kr.co.rockplace.rshm.service.admin.SqlService;
import kr.co.rockplace.rshm.utils.AuthUtil;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import kr.co.rockplace.rshm.utils.ReflectionUtil;
import kr.co.rockplace.rshm.utils.RequestUtils;
import kr.co.rockplace.rshm.view.ChildTableResultView;
import kr.co.rockplace.rshm.view.TableResultView;
import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Common Service
 * @author wonsunlee
 *
 */
@Service
public class CommonService {

	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private ListMapper listMapper;

	@Autowired
	private ListService listService;

	@Autowired
	private SqlService sqlService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private FormMapper formMapper;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Autowired
	private TableRepository tableRepository;

	@Autowired
	private ControlRepository controlRepository;

	@Autowired
	private TableFieldRepository tableFieldRepository;

	@Autowired
	private RelationRepository relationRepository;

	@Autowired
	private CodeTypeRepository codeTypeRepository;

	@Autowired
	private DepartmentRepository departmentRepository;

	@Autowired
	private WorkTimeService workTimeService;

	@Autowired
	private HolidayService holidayService;

	@Autowired
	private OrganizationService organizationService;

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private EmployeeService employeeService;

	@SuppressWarnings("unchecked")
	public TableResultView<List<Map<String, Object>>> getTableListByList(HttpServletRequest request, String lstId, int draw) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		int columnSize = 0;
		if(listEntity != null) {

			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view")) {
					columnSize++;
				}
			}
		}

		MapperParseVo mapperParseVo = RequestUtils.parseRequestParam(request, columnSize, configMap);

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

		return TableResultView.success(resultList, draw, this.countNotPage(mapperMap), this.getSize(mapperMap));
	}

	@SuppressWarnings("unchecked")
	public TableResultView<List<Map<String, Object>>> getWorkTimeTableListByList(HttpServletRequest request, String lstId, int draw) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		int columnSize = 0;
		if(listEntity != null) {

			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
			List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
			for (Map<String, Object> map : columnList) {

				if(StringUtils.equals((String) map.get("type"), "view")) {
					columnSize++;
				}
			}
		}

		MapperParseVo mapperParseVo = RequestUtils.parseRequestParam(request, columnSize, configMap);
		if(StringUtils.isNotEmpty((String) configMap.get("order"))) {
			mapperParseVo.getMap().put("orderBy", configMap.get("order"));
		}

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getAllListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

		List<Map<String, Object>> calcWorkTimeList = new ArrayList<Map<String, Object>>();

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
				boolean isHoliday = this.holidayService.checkHoliday(date);

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

//				this.workTimeService.printWorkTime(timeSetList);

				Map<String, List<TimeSet>> calcWorkTimeMap = this.workTimeService.calcWorkTime(timeSetList, isHoliday);
				Map<String, Double> calcWeightWorkTimeMap = this.workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);
				Map<String, Object> returnMap = new HashMap<String, Object>();

				String empName = this.employeeService.getName(empId);

				returnMap.put("ent_id", "WOT");				// 엔티티 ID
				returnMap.put("form_id", "FRM_WOT_001");	// 폼 ID
				returnMap.put("charge_emp_id", empId);	// 엔지니어 ID
				returnMap.put("charge_emp_name", empName);	// 엔지니어
				returnMap.put("work_date", date.toString());	// 지원 시작일

				String workDateOfWeek = LocalDate.parse(date.toString()).getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.forLanguageTag("ko"));
				returnMap.put("start_date", date.toString() + "(" + workDateOfWeek + ")");	// 지원 시작일(요일)

				returnMap.put("charge_emp_name", empName);	// 엔지니어
				returnMap.put("start_date", date.toString());	// 지원 시작일
				returnMap.put("rest_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("restTimeTotalMinutes")));	// 휴계시간
				returnMap.put("total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("sumWorkTime")));	// 총 시간
				returnMap.put("calc_total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("calcSumWorkTime")));	// 총 시간(휴계제외)

				// 휴일 유무 
				if(!isHoliday) {

					String workTimeStr = "";
					List<TimeSet> workTimeList = calcWorkTimeMap.get("workTimeList");
					for (TimeSet timeSet : workTimeList) {
						workTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
					}
					returnMap.put("work_time", workTimeStr);	// 소정 근로시간
				} else {

					String holidayTimeStr = "";
					List<TimeSet> holidayTimeList = calcWorkTimeMap.get("holidayTimeList");
					for (TimeSet timeSet : holidayTimeList) {
						holidayTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
					}
					returnMap.put("holiday_time", holidayTimeStr);	// 휴일 근로시간
				}

				String overTimeStr = "";
				List<TimeSet> overTimeList = calcWorkTimeMap.get("overTimeList");
				for (TimeSet timeSet : overTimeList) {
					overTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
				}
				returnMap.put("over_time", overTimeStr);	// 연장 근로시간

				String nightTimeStr = "";
				List<TimeSet> nightTimeList = calcWorkTimeMap.get("nightTimeList");
				for (TimeSet timeSet : nightTimeList) {
					nightTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
				}
				returnMap.put("night_time", nightTimeStr);	// 야간 근로시간

				returnMap.put("weight_work_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightWorkTimeTotalMinutes")));	// 소정근로
				returnMap.put("weight_over_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightOverTimeTotalMinutes")));	// 연장근로
				returnMap.put("weight_night_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightNightTimeTotalMinutes")));	// 야간근로
				returnMap.put("weight_holiday_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightHolidayWorkTimeTotalMinutes")));	// 휴일근로
				returnMap.put("weight_total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightTotalTime")));	// 합계

				String sqlId = "WORKTIME_OBJECT";
				Map<String, Object> sqlParamMap = new HashMap<String, Object>();
				sqlParamMap.put("work_date", date.toString());
				sqlParamMap.put("charge_emp_id", empId);

				Map<String, Object> worktimeObject = this.getResultMapBySql(sqlId, sqlParamMap);
				double usedWorkTime = 0;
				double compensation_time = 0;
				if(worktimeObject != null) {

					if(worktimeObject.containsKey("used_work_time")) {

						usedWorkTime = Double.parseDouble(worktimeObject.get("used_work_time").toString());
						returnMap.put("used_work_time", usedWorkTime);
						returnMap.put("used_work_time_str", this.workTimeService.convertPrintWorkTime((usedWorkTime * 60)));
					}

					if(worktimeObject.containsKey("compensation_time")) {

						compensation_time = Double.parseDouble(worktimeObject.get("compensation_time").toString());

						returnMap.put("compensation_time", compensation_time);
						returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(compensation_time * 60));	// 보상 발생시간
					} else {

						compensation_time = calcWeightWorkTimeMap.get("weight_compensation_total_time") / 60;

						returnMap.put("compensation_time", compensation_time);	// 기존에 등록된 사용시간
						returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(compensation_time * 60));	// 보상 발생시간
					}

					returnMap.put("key", worktimeObject.get("id"));					// 기존에 등록된 Key(있을 경우만 입력)
				} else {

					returnMap.put("used_work_time", usedWorkTime);
					returnMap.put("used_work_time_str", this.workTimeService.convertPrintWorkTime((usedWorkTime * 60)));	// 기존에 등록된 사용시간

					compensation_time = calcWeightWorkTimeMap.get("weight_compensation_total_time") / 60;

					returnMap.put("compensation_time", compensation_time);
					returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(compensation_time * 60));
				}

				double compensation_rest_time = (compensation_time * 60) - (usedWorkTime * 60);
				returnMap.put("compensation_rest_time", this.workTimeService.convertPrintWorkTime(compensation_rest_time));	// 잔여시간

				if(isAlternativeHoliday) {
					returnMap.put("alternative_holiday", "적용");	// 대체휴무 여부
				} else {
					returnMap.put("alternative_holiday", "미적용");	// 대체휴무 여부
				}

				calcWorkTimeList.add(returnMap);
			}
		});

		int start = (int) mapperParseVo.getMap().get("start");
		int length = (int) mapperParseVo.getMap().get("length");

		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		for (int i = start; i < calcWorkTimeList.size() && i < start + length; i++) {
			returnList.add(calcWorkTimeList.get(i));
		}

		return TableResultView.success(returnList, draw, calcWorkTimeList.size(), calcWorkTimeList.size());
	}

	@SuppressWarnings("unchecked")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getChildTableListByList(HttpServletRequest request, String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		if(listEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
		}

		MapperParseVo mapperParseVo = RequestUtils.parseRequestParam(request, configMap);

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

		mapperParseVo.getMetadata().setTotal(this.countNotPage(mapperMap));
		if(mapperParseVo.getMetadata().getPages() == 0) {
			mapperParseVo.getMetadata().setPages(mapperParseVo.getMetadata().getTotal() / mapperParseVo.getMetadata().getPerpage());
		}

		return ChildTableResultView.success(mapperParseVo.getMetadata(), resultList);
	}

	@SuppressWarnings("unchecked")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getWorkTimeChildTableListByList(HttpServletRequest request, String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		if(listEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
		}

		MapperParseVo mapperParseVo = RequestUtils.parseRequestParam(request, configMap);
		if(StringUtils.isNotEmpty((String) configMap.get("order"))) {
			mapperParseVo.getMap().put("orderBy", configMap.get("order"));
		}

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getAllListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

		List<Map<String, Object>> calcWorkTimeList = new ArrayList<Map<String, Object>>();

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
				boolean isHoliday = this.holidayService.checkHoliday(date);

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

//				this.workTimeService.printWorkTime(timeSetList);

				Map<String, List<TimeSet>> calcWorkTimeMap = this.workTimeService.calcWorkTime(timeSetList, isHoliday);
				Map<String, Double> calcWeightWorkTimeMap = this.workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);
				Map<String, Object> returnMap = new HashMap<String, Object>();

				String empName = this.employeeService.getName(empId);

				returnMap.put("ent_id", "WOT");				// 엔티티 ID
				returnMap.put("form_id", "FRM_WOT_001");	// 폼 ID
				returnMap.put("charge_emp_id", empId);	// 엔지니어 ID
				returnMap.put("charge_emp_name", empName);	// 엔지니어
				returnMap.put("work_date", date.toString());	// 지원 시작일

				String workDateOfWeek = LocalDate.parse(date.toString()).getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.forLanguageTag("ko"));
				returnMap.put("start_date", date.toString() + "(" + workDateOfWeek + ")");	// 지원 시작일(요일)

				returnMap.put("rest_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("restTimeTotalMinutes")));	// 휴계시간
				returnMap.put("total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("sumWorkTime")));	// 총 시간
				returnMap.put("calc_total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("calcSumWorkTime")));	// 총 시간(휴계제외)

				// 휴일 유무 
				if(!isHoliday) {

					String workTimeStr = "";
					List<TimeSet> workTimeList = calcWorkTimeMap.get("workTimeList");
					for (TimeSet timeSet : workTimeList) {
						workTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
					}
					returnMap.put("work_time", workTimeStr);	// 소정 근로시간
				} else {

					String holidayTimeStr = "";
					List<TimeSet> holidayTimeList = calcWorkTimeMap.get("holidayTimeList");
					for (TimeSet timeSet : holidayTimeList) {
						holidayTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
					}
					returnMap.put("holiday_time", holidayTimeStr);	// 휴일 근로시간
				}

				String overTimeStr = "";
				List<TimeSet> overTimeList = calcWorkTimeMap.get("overTimeList");
				for (TimeSet timeSet : overTimeList) {
					overTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
				}
				returnMap.put("over_time", overTimeStr);	// 연장 근로시간

				String nightTimeStr = "";
				List<TimeSet> nightTimeList = calcWorkTimeMap.get("nightTimeList");
				for (TimeSet timeSet : nightTimeList) {
					nightTimeStr += timeSet.getSourceTime() + "->" + timeSet.getTargetTime() + "\n";
				}
				returnMap.put("night_time", nightTimeStr);	// 야간 근로시간

				returnMap.put("weight_work_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightWorkTimeTotalMinutes")));	// 소정근로
				returnMap.put("weight_over_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightOverTimeTotalMinutes")));	// 연장근로
				returnMap.put("weight_night_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightNightTimeTotalMinutes")));	// 야간근로
				returnMap.put("weight_holiday_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightHolidayWorkTimeTotalMinutes")));	// 휴일근로
				returnMap.put("weight_total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weightTotalTime")));	// 합계
				returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(calcWeightWorkTimeMap.get("weight_compensation_total_time")));	// 보상 발생시간

				String sqlId = "WORKTIME_OBJECT";
				Map<String, Object> sqlParamMap = new HashMap<String, Object>();
				sqlParamMap.put("work_date", date.toString());
				sqlParamMap.put("charge_emp_id", empId);

				Map<String, Object> worktimeObject = this.getResultMapBySql(sqlId, sqlParamMap);
				double usedWorkTime = 0;
				double compensation_time = 0;
				if(worktimeObject != null) {

					if(worktimeObject.containsKey("used_work_time")) {

						usedWorkTime = Double.parseDouble(worktimeObject.get("used_work_time").toString());
						returnMap.put("used_work_time", usedWorkTime);
						returnMap.put("used_work_time_str", this.workTimeService.convertPrintWorkTime((usedWorkTime * 60)));
					}

					if(worktimeObject.containsKey("compensation_time")) {

						compensation_time = Double.parseDouble(worktimeObject.get("compensation_time").toString());

						returnMap.put("compensation_time", compensation_time);
						returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(compensation_time * 60));	// 보상 발생시간
					} else {

						compensation_time = calcWeightWorkTimeMap.get("weight_compensation_total_time") / 60;

						returnMap.put("compensation_time", compensation_time);	// 기존에 등록된 사용시간
						returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(compensation_time * 60));	// 보상 발생시간
					}

					returnMap.put("key", worktimeObject.get("id"));					// 기존에 등록된 Key(있을 경우만 입력)
				} else {

					returnMap.put("used_work_time", usedWorkTime);
					returnMap.put("used_work_time_str", this.workTimeService.convertPrintWorkTime((usedWorkTime * 60)));	// 기존에 등록된 사용시간

					compensation_time = calcWeightWorkTimeMap.get("weight_compensation_total_time") / 60;

					returnMap.put("compensation_time", compensation_time);
					returnMap.put("weight_compensation_total_time", this.workTimeService.convertPrintWorkTime(compensation_time * 60));
				}

				double compensation_rest_time = (compensation_time * 60) - (usedWorkTime * 60);
				returnMap.put("compensation_rest_time", this.workTimeService.convertPrintWorkTime(compensation_rest_time));	// 잔여시간

				if(isAlternativeHoliday) {
					returnMap.put("alternative_holiday", "적용");	// 대체휴무 여부
				} else {
					returnMap.put("alternative_holiday", "미적용");	// 대체휴무 여부
				}

				returnMap.put("rownum", calcWorkTimeList.size());

				calcWorkTimeList.add(returnMap);
			}
		});

		int start = (int) mapperParseVo.getMap().get("start");
		int length = (int) mapperParseVo.getMap().get("length");

		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		for (int i = start; i < calcWorkTimeList.size() && i < start + length; i++) {
			returnList.add(calcWorkTimeList.get(i));
		}

		mapperParseVo.getMetadata().setTotal(calcWorkTimeList.size());
		if(mapperParseVo.getMetadata().getPages() == 0) {
			mapperParseVo.getMetadata().setPages(mapperParseVo.getMetadata().getTotal() / mapperParseVo.getMetadata().getPerpage());
		}

		return ChildTableResultView.success(mapperParseVo.getMetadata(), returnList);
	}

	@SuppressWarnings("unchecked")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getTeamWorkTimeChildTableListByList(HttpServletRequest request, String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		if(listEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
		}

		MapperParseVo mapperParseVo = RequestUtils.parseRequestParam(request, configMap);
		if(StringUtils.isNotEmpty((String) configMap.get("order"))) {
			mapperParseVo.getMap().put("orderBy", configMap.get("order"));
		}

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getAllListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

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
				boolean isHoliday = this.holidayService.checkHoliday(date);

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

				Map<String, List<TimeSet>> calcWorkTimeMap = this.workTimeService.calcWorkTime(timeSetList, isHoliday);
				Map<String, Double> calcWeightWorkTimeMap = this.workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);
				Map<String, Object> returnMap = new HashMap<String, Object>();

				String empName = this.employeeService.getName(empId);
				String empDptId = this.employeeService.getDepartmentId(empId);
				String empDptName = this.departmentService.getName(empDptId);
				String empOrgId = this.employeeService.getOrganizationId(empId);
				String empOrgName = this.organizationService.getName(empOrgId);

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

			String search_date = request.getParameter("query[search_date]");
			stand_work_time = this.workTimeService.getRangeDateStandWorkTime(search_date, employee_count);	// 소정 근로시간

			returnMap.put("rownum", index++);

			returnMap.put("search_date", search_date);
			returnMap.put("charge_dpt_id", charge_dpt_id);
			returnMap.put("charge_dpt_name", charge_dpt_name);
			returnMap.put("charge_org_id", charge_org_id);
			returnMap.put("charge_org_name", charge_org_name);
			returnMap.put("employee_count", employee_count + "명");

			int workingDay = this.workTimeService.getRangeDateWorkingDay(search_date, employee_count);
			double day_avg_work_time = CommonUtils.roundValue(work_time / workingDay, 2);	// 일 평균 근로시간
			double week = this.workTimeService.getRangeDateWeekCount(search_date);
			double week_avg_work_time = CommonUtils.roundValue(work_time / week, 2);	// 주 평균 근로시간
			returnMap.put("day_avg_work_time", this.workTimeService.convertPrintWorkTime(day_avg_work_time));
			returnMap.put("week_avg_work_time", this.workTimeService.convertPrintWorkTime(week_avg_work_time));

			returnMap.put("stand_work_time", stand_work_time);
			returnMap.put("stand_work_time_str", this.workTimeService.convertPrintWorkTime(stand_work_time));

			returnMap.put("work_time", work_time);
			returnMap.put("work_time_str", this.workTimeService.convertPrintWorkTime(work_time));

			returnMap.put("over_time", over_time);
			returnMap.put("over_time_str", this.workTimeService.convertPrintWorkTime(over_time));

			returnMap.put("night_time", night_time);
			returnMap.put("night_time_str", this.workTimeService.convertPrintWorkTime(night_time));

			returnMap.put("holiday_time", holiday_time);
			returnMap.put("holiday_time_str", this.workTimeService.convertPrintWorkTime(holiday_time));

			returnMap.put("compensation_time", compensation_time);
			returnMap.put("compensation_time_str", this.workTimeService.convertPrintWorkTime(compensation_time));

			teamReturnList.add(returnMap);
		}

		int start = (int) mapperParseVo.getMap().get("start");
		int length = (int) mapperParseVo.getMap().get("length");

		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();

		for (int i = start; i < teamReturnList.size() && i < start + length; i++) {
			returnList.add(teamReturnList.get(i));
		}

		mapperParseVo.getMetadata().setTotal(teamReturnList.size());
		if(mapperParseVo.getMetadata().getPages() == 0) {
			mapperParseVo.getMetadata().setPages(mapperParseVo.getMetadata().getTotal() / mapperParseVo.getMetadata().getPerpage());
		}

		return ChildTableResultView.success(mapperParseVo.getMetadata(), returnList);
	}

	@SuppressWarnings("unchecked")
	public ChildTableResultView<MapperParseVo.MetaData, List<Map<String, Object>>> getTeamChildTableListByList(HttpServletRequest request, String lstId) {

		ListEntity listEntity = this.listService.getObject(lstId);
		Map<String, Object> configMap = null;
		if(listEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(listEntity.getConfig());
		}

		MapperParseVo mapperParseVo = RequestUtils.parseRequestParam(request, configMap);
		mapperParseVo.getMap().put("orderBy", "charge_emp_name asc");

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVars(listEntity.getQuery(), Map.of()));
		mapperMap.put("config", configMap);
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> columnList = (List<Map<String, Object>>) configMap.get("column");
		List<Map<String, Object>> resultList = this.getAllListByList(mapperMap);
		resultList.forEach(map -> {

			columnList.iterator().forEachRemaining(column -> {
				String resultColumn = (String) column.get("data");
				if(!map.containsKey(resultColumn)) {
					map.put(resultColumn, null);
				}
			});
		});

		Map<String, Map<LocalDate, List<Map<String, Object>>>> employeeMap = new LinkedHashMap<String, Map<LocalDate, List<Map<String, Object>>>>();

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

		// 엔지니어ID로 정렬 
		employeeMap.forEach((empId, dateListMap) -> {

			Map<String, Object> returnMap = new LinkedHashMap<String, Object>();

			String charge_emp_id = empId;	// 엔지니어 ID
			String charge_emp_name = this.employeeService.getName(empId);	// 엔지니어

			double stand_work_time = 0;	// 소정 근로시간
			double work_time = 0;	// 총 근무시간
			double over_time = 0;	// 연장 근로시간
			double night_time = 0;	// 야간 근로시간
			double holiday_time = 0;	// 휴일 근로시간
			double compensation_time = 0;	// 보상 발생시간

			for (LocalDate date : dateListMap.keySet()) {

				List<Map<String, Object>> workList = dateListMap.get(date);

				// 휴일 체크
				boolean isHoliday = this.holidayService.checkHoliday(date);

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

				Map<String, List<TimeSet>> calcWorkTimeMap = this.workTimeService.calcWorkTime(timeSetList, isHoliday);
				Map<String, Double> calcWeightWorkTimeMap = this.workTimeService.calcWeightWorkTime(date, calcWorkTimeMap, isHoliday, isAlternativeHoliday);

				work_time += calcWeightWorkTimeMap.get("calcSumWorkTime");	// 총 근무시간
				over_time += calcWeightWorkTimeMap.get("overTimeTotalMinutes");		// 연장 근로시간
				night_time += calcWeightWorkTimeMap.get("nightTimeTotalMinutes");		// 야간 근로시간
				holiday_time += calcWeightWorkTimeMap.get("holidayWorkTimeTotalMinutes");	// 휴일 근로시간
				compensation_time += calcWeightWorkTimeMap.get("weight_compensation_total_time");		// 보상 발생시간
			}

			String search_date = request.getParameter("query[search_date]");
			stand_work_time = this.workTimeService.getRangeDateStandWorkTime(search_date, 1);	// 소정 근로시간

			int workingDay = this.workTimeService.getRangeDateWorkingDay(search_date, 1);
			double day_avg_work_time = CommonUtils.roundValue(work_time / workingDay, 2);	// 일 평균 근로시간
			double week = this.workTimeService.getRangeDateWeekCount(search_date);
			double week_avg_work_time = CommonUtils.roundValue(work_time / week, 2);	// 주 평균 근로시간
			returnMap.put("day_avg_work_time", this.workTimeService.convertPrintWorkTime(day_avg_work_time));
			returnMap.put("week_avg_work_time", this.workTimeService.convertPrintWorkTime(week_avg_work_time));

			returnMap.put("stand_work_time", stand_work_time);
			returnMap.put("stand_work_time_str", this.workTimeService.convertPrintWorkTime(stand_work_time));

			returnMap.put("work_time", work_time);
			returnMap.put("work_time_str", this.workTimeService.convertPrintWorkTime(work_time));

			returnMap.put("over_time", over_time);
			returnMap.put("over_time_str", this.workTimeService.convertPrintWorkTime(over_time));

			returnMap.put("night_time", night_time);
			returnMap.put("night_time_str", this.workTimeService.convertPrintWorkTime(night_time));

			returnMap.put("holiday_time", holiday_time);
			returnMap.put("holiday_time_str", this.workTimeService.convertPrintWorkTime(holiday_time));

			returnMap.put("compensation_time", compensation_time);
			returnMap.put("compensation_time_str", this.workTimeService.convertPrintWorkTime(compensation_time));

			returnMap.put("charge_emp_id", charge_emp_id);	// 엔지니어 ID
			returnMap.put("charge_emp_name", charge_emp_name);	// 엔지니어명

			calcWorkTimeList.add(returnMap);
		});

		int start = (int) mapperParseVo.getMap().get("start");
		int length = (int) mapperParseVo.getMap().get("length");

		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
		for (int i = start; i < calcWorkTimeList.size() && i < start + length; i++) {
			returnList.add(calcWorkTimeList.get(i));
		}

		mapperParseVo.getMetadata().setTotal(calcWorkTimeList.size());
		if(mapperParseVo.getMetadata().getPages() == 0) {
			mapperParseVo.getMetadata().setPages(mapperParseVo.getMetadata().getTotal() / mapperParseVo.getMetadata().getPerpage());
		}

		return ChildTableResultView.success(mapperParseVo.getMetadata(), returnList);
	}

	/**
	 * 
	 * @param model
	 * @param listEntity
	 */
	@SuppressWarnings("unchecked")
	public void setListConfig(Model model, ListEntity listEntity) {

		Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(CommonUtils.transVars(listEntity.getConfig(), Map.of()));
		model.addAttribute("config", configMap);

		String script = listEntity.getScript();
		model.addAttribute("script", script);

		Map<String, List<?>> refListMap = new HashMap<>();

		List<List<Map<String, Object>>> filterList = (List<List<Map<String, Object>>>) configMap.get("filter");
		for (List<Map<String, Object>> filter: filterList) {
			for (Map<String, Object> subFilter : filter) {

				if(StringUtils.startsWith((String) subFilter.get("uiitem"), "Code")) {

					Optional<CodeTypeEntity> refCodeTypeEntity = codeTypeRepository.findById(subFilter.get("config").toString());
					if(refCodeTypeEntity.isPresent()) {
						refListMap.put((String) subFilter.get("id"), refCodeTypeEntity.get().getCodeEntityList());
					}

					if(StringUtils.equals((String) subFilter.get("uiitem"), "Code.SQL")) {

						Map<String, Object> subFilterConfigMap = (Map<String, Object>) subFilter.get("config");
						String sqlId = (String) subFilterConfigMap.get("sql");
						refListMap.put((String) subFilter.get("id"), this.getResultListBySql(sqlId, Map.of()));

					}
				}

				if(StringUtils.startsWith((String) subFilter.get("uiitem"), "Entity")) {

					Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn((String) subFilter.get("config"), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
					if(refTableEntity.isPresent()) {
						refListMap.put((String) subFilter.get("id"), this.formMapper.getObjectList(refTableEntity.get().getId()));
					}
				}
			}
		}
		model.addAttribute("refListMap", refListMap);
	}

	/**
	 * 
	 * @param model
	 * @param listEntity
	 */
	@SuppressWarnings("unchecked")
	public void setChildListConfig(Model model, ListEntity listEntity) {

		Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(CommonUtils.transVars(listEntity.getConfig(), Map.of()));
		model.addAttribute("config", configMap);

		String script = listEntity.getScript();
		model.addAttribute("script", script);

		Map<String, List<?>> refListMap = new HashMap<>();

		List<List<Map<String, Object>>> filterList = (List<List<Map<String, Object>>>) configMap.get("filter");
		for (List<Map<String, Object>> filter: filterList) {
			for (Map<String, Object> subFilter : filter) {

				if(StringUtils.startsWith((String) subFilter.get("uiitem"), "Code")) {

					Optional<CodeTypeEntity> refCodeTypeEntity = codeTypeRepository.findById(subFilter.get("config").toString());
					if(refCodeTypeEntity.isPresent()) {
						refListMap.put((String) subFilter.get("id"), refCodeTypeEntity.get().getCodeEntityList());
					}

					if(StringUtils.equals((String) subFilter.get("uiitem"), "Code.SQL")) {

						Map<String, Object> subFilterConfigMap = (Map<String, Object>) subFilter.get("config");
						String sqlId = (String) subFilterConfigMap.get("sql");
						refListMap.put((String) subFilter.get("id"), this.getResultListBySql(sqlId, Map.of()));

					}
				}

				if(StringUtils.startsWith((String) subFilter.get("uiitem"), "Entity")) {

					Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn((String) subFilter.get("config"), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
					if(refTableEntity.isPresent()) {
						refListMap.put((String) subFilter.get("id"), this.formMapper.getObjectList(refTableEntity.get().getId()));
					}
				}
			}
		}
		model.addAttribute("refListMap", refListMap);

		// Child List 추가
		String childLstId = "";
		if(configMap.containsKey("child_list")) {
			childLstId = (String) configMap.get("child_list");
		}

		ListEntity childListEntity = this.listService.getObject(childLstId);
		Map<String, Object> childConfigMap = JsonUtil.convertJSONStringToMap(CommonUtils.transVars(childListEntity.getConfig(), Map.of()));
		model.addAttribute("childObject", childListEntity);
		model.addAttribute("childConfig", childConfigMap);
	}

	/**
	 * 
	 * @param model
	 * @param listEntity
	 */
	@SuppressWarnings("unchecked")
	public void setCalendarConfig(Model model, ListEntity listEntity) {

		Map<String, Object> configMap = JsonUtil.convertJSONStringToMap(CommonUtils.transVars(listEntity.getConfig(), Map.of()));
		model.addAttribute("config", configMap);

		String script = listEntity.getScript();
		model.addAttribute("script", script);

		String dptId = (String) AuthUtil.getCurrentUser().get("deptId");

		Map<String, List<?>> refListMap = new HashMap<>();

		List<List<Map<String, Object>>> filterList = (List<List<Map<String, Object>>>) configMap.get("filter");
		for (List<Map<String, Object>> filter: filterList) {
			for (Map<String, Object> subFilter : filter) {

				if(StringUtils.startsWith((String) subFilter.get("uiitem"), "Code")) {

					Optional<CodeTypeEntity> refCodeTypeEntity = codeTypeRepository.findById(subFilter.get("config").toString());
					if(refCodeTypeEntity.isPresent()) {
						refListMap.put((String) subFilter.get("id"), refCodeTypeEntity.get().getCodeEntityList());
					}

					if(StringUtils.equals((String) subFilter.get("uiitem"), "Code.SQL")) {

						Map<String, Object> subFilterConfigMap = (Map<String, Object>) subFilter.get("config");
						String sqlId = (String) subFilterConfigMap.get("sql");
						refListMap.put((String) subFilter.get("id"), this.getResultListBySql(sqlId, Map.of()));

					}
				}

				if(StringUtils.startsWith((String) subFilter.get("uiitem"), "Entity")) {

					Optional<TableEntity> refTableEntity = this.tableRepository.findByEntIdAndTypeCdIn((String) subFilter.get("config"), List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
					if(refTableEntity.isPresent()) {
						refListMap.put((String) subFilter.get("id"), this.formMapper.getObjectList(refTableEntity.get().getId()));
					}
				}
			}
		}

		List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
		Optional<DepartmentEntity> departmentEntity = this.departmentRepository.findById(dptId);
		if(departmentEntity.isPresent()) {
			this.getEmployeeByDepartmentList(employeeList, departmentEntity.get(), false);
		}

		List<Map<String, Object>> convertEmployeeList = new ArrayList<Map<String, Object>>();
		for (EmployeeEntity employeeEntity : employeeList) {

			Map<String, Object> employeeMap = new HashMap<String, Object>();
			try {
				employeeMap = ReflectionUtil.convertToMap(employeeEntity);
				convertEmployeeList.add(employeeMap);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
			employeeMap.put("class", this.getCalendarClass(employeeList.indexOf(employeeEntity)));
		}

		model.addAttribute("employeeList", convertEmployeeList);
		model.addAttribute("refListMap", refListMap);
	}

	/**
	 * 
	 * @param model
	 * @param dptId
	 * @param chargeEmpName
	 */
	public void getEngineerList(Model model, String dptId, String chargeEmpName) {

		List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
		Optional<DepartmentEntity> departmentEntity = this.departmentRepository.findById(dptId);
		if(departmentEntity.isPresent()) {
			this.getEmployeeByDepartmentList(employeeList, departmentEntity.get(), false);
		}

		List<Map<String, Object>> convertEmployeeList = new ArrayList<Map<String, Object>>();
		for (EmployeeEntity employeeEntity : employeeList) {

			Map<String, Object> employeeMap = new HashMap<String, Object>();
			try {

				employeeMap = ReflectionUtil.convertToMap(employeeEntity);
				employeeMap.put("class", this.getCalendarClass(employeeList.indexOf(employeeEntity)));
				convertEmployeeList.add(employeeMap);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("employeeList", convertEmployeeList);
	}

	private void getEmployeeByDepartmentList(List<EmployeeEntity> employeeList, DepartmentEntity departmentEntity, boolean isSub) {

		employeeList.addAll(departmentEntity.getEmployeeEntityList());
		if(isSub) {

			for (DepartmentEntity subDepartmentEntity : departmentEntity.getSubDepartmentEntityList()) {
				this.getEmployeeByDepartmentList(employeeList, subDepartmentEntity, isSub);
			}
		}
	}

	private String getCalendarClass(int index) {

		List<String> calendarClassList = List.of(
				"btn-primary fc-event-solid-primary",
				"btn-secondary fc-event-solid-secondary",
				"btn-success fc-event-solid-success",
//				"btn-info fc-event-solid-info",
				"btn-warning fc-event-solid-warning",
				"btn-danger fc-event-solid-danger",
				"btn-light fc-event-solid-light",
				"btn-dark fc-event-solid-dark",
				"btn-white fc-event-solid-white");

		return calendarClassList.get(index % calendarClassList.size());
	}

	/**
	 * SQL ID를 기반으로 쿼리 결과 가져오기(Calendar 전용)
	 * @param sqlId
	 * @param paramMap
	 * @return
	 */
	public List<Map<String, Object>> getCalendarListBySql(String sqlId, Map<String, Object> paramMap) {

		List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
		Optional<DepartmentEntity> departmentEntity = this.departmentRepository.findById((String) paramMap.get("dpt_id"));
		if(departmentEntity.isPresent()) {
			this.getEmployeeByDepartmentList(employeeList, departmentEntity.get(), true);
		}

		List<Map<String, Object>> convertEmployeeList = new ArrayList<Map<String, Object>>();
		for (EmployeeEntity employeeEntity : employeeList) {

			Map<String, Object> employeeMap = new HashMap<String, Object>();
			try {
				employeeMap = ReflectionUtil.convertToMap(employeeEntity);
				employeeMap.put("class", this.getCalendarClass(employeeList.indexOf(employeeEntity)));
				convertEmployeeList.add(employeeMap);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}

		SqlEntity sqlEntity = this.sqlService.getObject(sqlId);
		Map<String, Object> configMap = null;
		if(sqlEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(sqlEntity.getConfig());
		} else {
			return null;
		}

		MapperParseVo mapperParseVo = CommonUtils.parseSqlParam(paramMap, configMap);

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVarsByData(sqlEntity.getQuery(), paramMap));
		mapperMap.put("mapperParseVo", mapperParseVo);

		List<Map<String, Object>> ticketList = this.commonMapper.getSqlResultList(mapperMap);
		for (Map<String, Object> ticket : ticketList) {
			for (Map<String, Object> employeeMap : convertEmployeeList) {
				if(StringUtils.equals((String) employeeMap.get("id"), (String) ticket.get("emp_id"))) {
					ticket.put("className", employeeMap.get("class"));
				}
			}
		}

		return ticketList;
	}

	/**
	 * 목록 전체 갯수 가져오기
	 * @return
	 */
	public long getSize(Map<String, Object> mapperMap) {
		return this.listMapper.count(mapperMap);
	}

	/**
	 * 전체 목록 가져오기(필터, 페이지)
	 * @param map
	 * @return
	 */
	private List<Map<String, Object>> getListByList(Map<String, Object> mapperMap) {
		return this.listMapper.getListByList(mapperMap);
	}

	/**
	 * 전체 목록 가져오기(필터)
	 * @param map
	 * @return
	 */
	private List<Map<String, Object>> getAllListByList(Map<String, Object> mapperMap) {
		return this.listMapper.getAllListByList(mapperMap);
	}

	/**
	 * 전체 목록 갯수 가져오기(필터)
	 * @param map
	 * @return
	 */
	private long countNotPage(Map<String, Object> mapperMap) {
		return this.listMapper.countNotPage(mapperMap);
	}

	/**
	 * SQL ID를 기반으로 쿼리 결과 가져오기
	 * @param sqlId
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> getResultMapBySql(String sqlId, Map<String, Object> paramMap) {

		SqlEntity sqlEntity = this.sqlService.getObject(sqlId);
		Map<String, Object> configMap = null;
		if(sqlEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(sqlEntity.getConfig());
		} else {
			return null;
		}

		MapperParseVo mapperParseVo = CommonUtils.parseSqlParam(paramMap, configMap);

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVarsByData(sqlEntity.getQuery(), paramMap));
		mapperMap.put("mapperParseVo", mapperParseVo);

		return this.commonMapper.getSqlResultMap(mapperMap);
	}

	/**
	 * SQL ID를 기반으로 쿼리 결과 가져오기
	 * @param sqlId
	 * @param paramMap
	 * @return
	 */
	public List<Map<String, Object>> getResultListBySql(String sqlId, Map<String, Object> paramMap) {

		SqlEntity sqlEntity = this.sqlService.getObject(sqlId);
		Map<String, Object> configMap = null;
		if(sqlEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(sqlEntity.getConfig());
		} else {
			return null;
		}

		MapperParseVo mapperParseVo = CommonUtils.parseSqlParam(paramMap, configMap);

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVarsByData(sqlEntity.getQuery(), paramMap));
		mapperMap.put("mapperParseVo", mapperParseVo);

		return this.commonMapper.getSqlResultList(mapperMap);
	}

	/**
	 * Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
	 * @param paramMap
	 * @param model
	 */
	public void setMenuInfo(
			Map<String, Object> paramMap,
			Model model) {

		this.setMenuInfo(paramMap, true, model);
	}

	/**
	 * Menu ID의 정보를 기준으로 Aside 및 Menu Entity 설정
	 * @param paramMap
	 * @param isAside
	 * @param model
	 */
	public void setMenuInfo(
			Map<String, Object> paramMap,
			boolean isAside,
			Model model) {

		if(paramMap.containsKey("menuId")) {

			MenuEntity menuEntity = this.menuService.getObject((String) paramMap.get("menuId"));
			if(menuEntity != null) {
				isAside = menuEntity.isAside();
			}
		}
		model.addAttribute("isAside", isAside);

		if(isAside) {

			// 팀장/팀원 구분 
			boolean isLeader = !StringUtils.equals("DUTY_POSITION_ROCKPLACE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString())
					&& !StringUtils.equals("DUTY_POSITION_OSZONE_30001", AuthUtil.getCurrentUser().get("dutyCode").toString());

			model.addAttribute("menuList", this.menuService.getMenuList(isLeader, AuthUtil.hasRole("ROLE_ADMIN")));
		}
	}

	/**
	 * 
	 * @param entId
	 * @param ctlId
	 * @param map
	 * @return
	 */
	@Transactional
	public String saveForm(
			String entId,
			String ctlId,
			Map<String, Object> map) {

		String key = "";

		Optional<TableEntity> tableEntity = this.tableRepository.findByEntIdAndTypeCdIn(entId, List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		Optional<ControlEntity> controlEntity = this.controlRepository.findById(ctlId);

		Map<String, Object> objectMap = null;

		if(tableEntity.isPresent() && thisEntity.isPresent()) {

			// Key가 있을 경우 
			if(map.containsKey("key")) {

				objectMap = this.formMapper.getObjectById(Map.of(
						"table", tableEntity.get().getId(),
						"key", map.get("key")));

				if(StringUtils.equals(tableEntity.get().getTypeCd(), "TAB_TYPE_WORKFLOW") && objectMap != null && objectMap.containsKey("tas_id")) {

					if(!StringUtils.equals((String) objectMap.get("tas_id"), controlEntity.get().getTasId())) {
						return key;
					}
				}
			}

			// 제어에서 데이터 업데이트 
			if(controlEntity.isPresent()) {

				// 현재 단계 
				map.put("tas_id", controlEntity.get().getNextTasId());

				List<Map<String, Object>> dataUpdateList = JsonUtil.convertJSONStringToList(controlEntity.get().getDataUpdate());
				for (Map<String, Object> dataUpdateMap : dataUpdateList) {

					String field = ((String) dataUpdateMap.get("field")).toLowerCase();
					String value = CommonUtils.transVars((String) dataUpdateMap.get("value"), map, objectMap);
					map.put(field, value);
				}
			}

			List<TableFieldEntity> tableFieldList = this.tableFieldRepository.findByTabId(tableEntity.get().getId());

			// TableField 의 목록에 있는 것만 사용 
			Map<String, Object> paramMap = new HashMap<>();
			for (TableFieldEntity tableFieldEntity : tableFieldList) {

				if(map.containsKey(tableFieldEntity.getName().toLowerCase())) {

					if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_BOOLEAN")) {

						// FLT_TYPE_BOOLEAN
						paramMap.put(tableFieldEntity.getName().toLowerCase(), Boolean.parseBoolean(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase()))));
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_CODE")) {

						// FLT_TYPE_CODE
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())).isBlank() ? null : String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_DATE")) {

						// FLT_TYPE_DATE
						if(StringUtils.isNotEmpty(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())))) {

							if(StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_DTTM") || StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_RANGE_DTTM")) {
								paramMap.put(tableFieldEntity.getName().toLowerCase(), LocalDateTime.parse(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
							} else if(StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_DT") || StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_RANGE_DT")) {
								paramMap.put(tableFieldEntity.getName().toLowerCase(), LocalDate.parse(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
							}
						} else {
							paramMap.put(tableFieldEntity.getName().toLowerCase(), null);
						}
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_ENTITY")) {

						// FLT_TYPE_ENTITY
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())).isBlank() ? null : String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_NUMBER")) {

						if(StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_NUMBER_POINT")) {

							// FLT_TYPE_NUMBER_POINT
							paramMap.put(tableFieldEntity.getName().toLowerCase(), Double.parseDouble(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase()))));
						} else {

							// FLT_TYPE_NUMBER
							paramMap.put(tableFieldEntity.getName().toLowerCase(), Integer.parseInt(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase()))));
						}
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_STRING")) {

						// FLT_TYPE_STRING
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					} else {

						// ETC
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					}
				}

				// Entity ID 필수값 처리
				if(StringUtils.equals(tableFieldEntity.getName().toLowerCase(), "ent_id")) {

					if(!map.containsKey("ent_id")) {
						paramMap.put(tableFieldEntity.getName().toLowerCase(), entId);
					}
				}
			}

			// Key 설정
			if(map.containsKey("key") && StringUtils.isNotBlank((String) map.get("key"))) {
				paramMap.put("id", map.get("key"));
			} else if(map.containsKey("id") && StringUtils.isNotBlank((String) map.get("id"))) {
				paramMap.put("id", entId + "_" + map.get("id"));
			} else {
				paramMap.put("id", this.sequenceKeyService.getKey(entId));
			}

			key = (String) paramMap.get("id");

			this.formMapper.saveForm(Map.of(
					"table", tableEntity.get().getId(),
					"map", paramMap,
					"user", AuthUtil.getCurrentUser()));

			// Workflow Flow에 저장
			if(controlEntity.isPresent() && StringUtils.equals(tableEntity.get().getTypeCd(), "TAB_TYPE_WORKFLOW")) {

				Map<String, Object> wffMap = new HashMap<>();
				wffMap.put("id", this.sequenceKeyService.getUniqueKey());
				wffMap.put("srcId", paramMap.get("id"));
				wffMap.put("srcEntId", paramMap.get("ent_id"));

				if(objectMap != null && objectMap.containsKey("tas_id")) {

					wffMap.put("tasId", controlEntity.get().getTasId());
					wffMap.put("nextTasId", controlEntity.get().getNextTasId());
				} else {

					wffMap.put("tasId", null);
					wffMap.put("nextTasId", controlEntity.get().getNextTasId());
				}

				this.formMapper.saveWorkflowFlow(Map.of(
						"map", wffMap,
						"user", AuthUtil.getCurrentUser()));
			}
		}

		return key;
	}

	/**
	 * 
	 * @param key
	 * @param entId
	 * @param map
	 * @return
	 */
	@Transactional
	public int deleteForm(
			String key,
			String entId,
			Map<String, Object> map) {

		int result = -1;

		Optional<TableEntity> tableEntity = this.tableRepository.findByEntIdAndTypeCdIn(entId, List.of("TAB_TYPE_SYSTEM", "TAB_TYPE_WORKFLOW"));
		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(tableEntity.isPresent() && thisEntity.isPresent()) {

			result = this.formMapper.deleteForm(Map.of(
					"table", tableEntity.get().getId(),
					"map", map,
					"user", AuthUtil.getCurrentUser()));
		} else {
			result = -1;
		}

		return result;
	}

	/**
	 * 
	 * @param relationId
	 * @param ctlId
	 * @param map
	 * @return
	 */
	@Transactional
	public String saveRelation(
			String relationId,
			String ctlId,
			Map<String, Object> map) {

		String key = "";

		Optional<RelationEntity> relationEntity = this.relationRepository.findById(relationId);
		if(relationEntity.isPresent()) {

			TableEntity tableEntity = relationEntity.get().getTableEntity();
			Optional<ControlEntity> controlEntity = this.controlRepository.findById(ctlId);

			Map<String, Object> objectMap = null;

			// Key가 있을 경우 
			if(map.containsKey("key")) {

				objectMap = this.formMapper.getObjectById(Map.of(
						"table", tableEntity.getId(),
						"key", map.get("key")));

				if(StringUtils.equals(tableEntity.getTypeCd(), "TAB_TYPE_WORKFLOW") && objectMap != null && objectMap.containsKey("tas_id")) {

					if(!StringUtils.equals((String) objectMap.get("tas_id"), controlEntity.get().getTasId())) {
						return key;
					}
				}
			}

			// Relation의 상위 정보 업데이트
			if(map.containsKey("srcId") && map.containsKey("srcEntId")) {

				map.put("src_id", (String) map.get("srcId"));
				map.put("src_ent_id", (String) map.get("srcEntId"));
			}

			// 제어에서 데이터 업데이트 
			if(controlEntity.isPresent()) {

				// 현재 단계 
				map.put("tas_id", controlEntity.get().getNextTasId());

				List<Map<String, Object>> dataUpdateList = JsonUtil.convertJSONStringToList(controlEntity.get().getDataUpdate());
				for (Map<String, Object> dataUpdateMap : dataUpdateList) {

					String field = ((String) dataUpdateMap.get("field")).toLowerCase();
					String value = CommonUtils.transVars((String) dataUpdateMap.get("value"), map, objectMap);
					map.put(field, value);
				}
			}

			List<TableFieldEntity> tableFieldList = this.tableFieldRepository.findByTabId(tableEntity.getId());

			// TableField 의 목록에 있는 것만 사용 
			Map<String, Object> paramMap = new HashMap<>();
			for (TableFieldEntity tableFieldEntity : tableFieldList) {

				if(map.containsKey(tableFieldEntity.getName().toLowerCase())) {

					if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_BOOLEAN")) {

						// FLT_TYPE_BOOLEAN
						paramMap.put(tableFieldEntity.getName().toLowerCase(), Boolean.parseBoolean(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase()))));
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_CODE")) {

						// FLT_TYPE_CODE
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName())).toString().isBlank() ? null : String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_DATE")) {

						//FLT_TYPE_DATE
						if(StringUtils.isNotEmpty(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())))) {

							if(StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_DTTM") || StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_RANGE_DTTM")) {
								paramMap.put(tableFieldEntity.getName().toLowerCase(), LocalDateTime.parse(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
							} else if(StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_DT") || StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_DATE_RANGE_DT")) {
								paramMap.put(tableFieldEntity.getName().toLowerCase(), LocalDate.parse(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
							}
						} else {
							paramMap.put(tableFieldEntity.getName().toLowerCase(), null);
						}
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_ENTITY")) {

						// FLT_TYPE_ENTITY
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())).isBlank() ? null : String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_NUMBER")) {

						if(StringUtils.equals(tableFieldEntity.getTypeCd(), "FLT_TYPE_NUMBER_POINT")) {

							// FLT_TYPE_NUMBER_POINT
							paramMap.put(tableFieldEntity.getName().toLowerCase(), Double.parseDouble(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase()))));
						} else {

							// FLT_TYPE_NUMBER
							paramMap.put(tableFieldEntity.getName().toLowerCase(), Integer.parseInt(String.valueOf(map.get(tableFieldEntity.getName().toLowerCase()))));
						}
					} else if(StringUtils.equals(tableFieldEntity.getTfdId(), "FLT_TYPE_STRING")) {

						// FLT_TYPE_STRING
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					} else {

						// ETC
						paramMap.put(tableFieldEntity.getName().toLowerCase(), String.valueOf(map.get(tableFieldEntity.getName().toLowerCase())));
					}
				}

				// Entity ID 필수값 처리
				if(StringUtils.equals(tableFieldEntity.getName().toLowerCase(), "ent_id")) {

					if(!map.containsKey("ent_id")) {
						paramMap.put(tableFieldEntity.getName().toLowerCase(), relationEntity.get().getEntId());
					}
				}
			}

			// Key 설정
			if(map.containsKey("key") && StringUtils.isNotBlank((String) map.get("key"))) {
				paramMap.put("id", map.get("key"));
			} else if(map.containsKey("id") && StringUtils.isNotBlank((String) map.get("id"))) {
				paramMap.put("id", relationEntity.get().getEntId() + "_" + map.get("id"));
			} else {
				paramMap.put("id", this.sequenceKeyService.getKey(relationEntity.get().getEntId()));
			}

			key = (String) paramMap.get("id");

			this.formMapper.saveForm(Map.of(
					"table", tableEntity.getId(),
					"map", paramMap,
					"user", AuthUtil.getCurrentUser()));

			// Workflow Flow에 저장
			if(controlEntity.isPresent() && StringUtils.equals(tableEntity.getTypeCd(), "TAB_TYPE_WORKFLOW")) {

				Map<String, Object> wffMap = new HashMap<>();
				wffMap.put("id", this.sequenceKeyService.getUniqueKey());
				wffMap.put("srcId", paramMap.get("id"));
				wffMap.put("srcEntId", paramMap.get("ent_id"));

				if(objectMap != null && objectMap.containsKey("tas_id")) {

					wffMap.put("tasId", controlEntity.get().getTasId());
					wffMap.put("nextTasId", controlEntity.get().getNextTasId());
				} else {

					wffMap.put("tasId", null);
					wffMap.put("nextTasId", controlEntity.get().getNextTasId());
				}

				this.formMapper.saveWorkflowFlow(Map.of(
						"map", wffMap,
						"user", AuthUtil.getCurrentUser()));
			}
		}

		return key;
	}
}