package kr.co.rockplace.rshm.service.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.HolidayEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.HolidayRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.service.LogService;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Holiday Service
 * @author wonsunlee
 *
 */
@Service
public class HolidayService extends AdminCommonService<HolidayEntity, CommonRepository<HolidayEntity, String>> {

	@Autowired
	private HolidayRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private LogService logService;

	@Value("${rshm.collect.holiday.key:}")
	private String SERVICE_KEY_HOLIDAY_DATA_BY_GOV;

	/**
	 * Collect of Holiday
	 */
	@SuppressWarnings("unchecked")
	public int collectHoliday(String year, String month) {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_HOLIDAY";

		int result = 0;

		try {

			int rows = 50;

			String xml = this.getHolidayDataByGov(year, month, rows);
			Map<String, Object> resultMap = JsonUtil.convertXmlToMap(xml);

			Map<String, Object> dataResponse = null;
			if(CommonUtils.isNotNull(resultMap) && resultMap.containsKey("response")) {

				if(StringUtils.isNotBlank(resultMap.get("response").toString())) {
					dataResponse = (Map<String, Object>) resultMap.get("response");
				}
			}

			Map<String, Object> body = null;
			if(CommonUtils.isNotNull(dataResponse) && dataResponse.containsKey("body")) {

				if(StringUtils.isNotBlank(dataResponse.get("body").toString())) {
					body = (Map<String, Object>) dataResponse.get("body");
				}
			}

			Map<String, Object> items = null;
			if(CommonUtils.isNotNull(body) && body.containsKey("items")) {

				if(StringUtils.isNotBlank(body.get("items").toString())) {
					items = (Map<String, Object>) body.get("items");
				}
			}

			List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
			if(CommonUtils.isNotNull(items) && items.containsKey("item")) {

				if(StringUtils.isNotBlank(items.get("item").toString())) {
					itemList = (List<Map<String, Object>>) items.get("item");
				}
			}

			for (Map<String, Object> item : itemList) {

				String dateName = item.get("dateName").toString();	// 설날
				String locdate = item.get("locdate").toString();	// 20210211
//				String dateKind = item.get("dateKind").toString();	// 01
				boolean isHoliday = false;	// Y
				if(StringUtils.equals(item.get("isHoliday").toString(), "Y")) {
					isHoliday = true;
				}
				int seq = Integer.parseInt(item.get("seq").toString());	// 1

				Map<String, Object> entityMap = new HashMap<String, Object>();
				entityMap.put("id", locdate);
				entityMap.put("name", dateName);
				entityMap.put("label", dateName);
				entityMap.put("descr", dateName);
				entityMap.put("isUsed", true);
				entityMap.put("orderBy", seq);
				entityMap.put("isHoliday", isHoliday);

				Optional<HolidayEntity> holidayEntity = this.repository.findById(locdate);
				if(holidayEntity.isPresent()) {

					entityMap.put("updateDate", LocalDateTime.now());
					entityMap.put("updateEmpId", "rshmadmin@rockplace.co.kr");

					this.update("HOD", entityMap);
				} else {

					entityMap.put("createDate", LocalDateTime.now());
					entityMap.put("createEmpId", "rshmadmin@rockplace.co.kr");

					this.create("HOD", entityMap);
				}

				result++;
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			e.printStackTrace();

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	/**
	 * Collect of Holiday
	 */
	@CacheEvict(value = "holiday", allEntries = true)
	@SuppressWarnings("unchecked")
	public int collectHoliday() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_HOLIDAY";

		int result = 0;

		try {

			LocalDate date = LocalDate.now();

			String year = String.valueOf(date.getYear());
			String month = StringUtils.leftPad(String.valueOf(date.getMonthValue()), 2, "0");
			int rows = 10;

			String xml = this.getHolidayDataByGov(year, month, rows);
			Map<String, Object> resultMap = JsonUtil.convertXmlToMap(xml);

			Map<String, Object> dataResponse = null;
			if(CommonUtils.isNotNull(resultMap) && resultMap.containsKey("response")) {

				if(StringUtils.isNotBlank(resultMap.get("response").toString())) {
					dataResponse = (Map<String, Object>) resultMap.get("response");
				}
			}

			Map<String, Object> body = null;
			if(CommonUtils.isNotNull(dataResponse) && dataResponse.containsKey("body")) {

				if(StringUtils.isNotBlank(dataResponse.get("body").toString())) {
					body = (Map<String, Object>) dataResponse.get("body");
				}
			}

			Map<String, Object> items = null;
			if(CommonUtils.isNotNull(body) && body.containsKey("items")) {

				if(StringUtils.isNotBlank(body.get("items").toString())) {
					items = (Map<String, Object>) body.get("items");
				}
			}

			List<Map<String, Object>> itemList = new ArrayList<Map<String, Object>>();
			if(CommonUtils.isNotNull(items) && items.containsKey("item")) {

				if(StringUtils.isNotBlank(items.get("item").toString())) {
					itemList = (List<Map<String, Object>>) items.get("item");
				}
			}

			for (Map<String, Object> item : itemList) {

				String dateName = item.get("dateName").toString();	// 설날
				String locdate = item.get("locdate").toString();	// 20210211
//				String dateKind = item.get("dateKind").toString();	// 01
				boolean isHoliday = false;	// Y
				if(StringUtils.equals(item.get("isHoliday").toString(), "Y")) {
					isHoliday = true;
				}
				int seq = Integer.parseInt(item.get("seq").toString());	// 1

				Map<String, Object> entityMap = new HashMap<String, Object>();
				entityMap.put("id", locdate);
				entityMap.put("name", dateName);
				entityMap.put("label", dateName);
				entityMap.put("descr", dateName);
				entityMap.put("isUsed", true);
				entityMap.put("orderBy", seq);
				entityMap.put("isHoliday", isHoliday);

				Optional<HolidayEntity> holidayEntity = this.repository.findById(locdate);
				if(holidayEntity.isPresent()) {

					entityMap.put("updateDate", LocalDateTime.now());
					entityMap.put("updateEmpId", "rshmadmin@rockplace.co.kr");

					this.update("HOD", entityMap);
				} else {

					entityMap.put("createDate", LocalDateTime.now());
					entityMap.put("createEmpId", "rshmadmin@rockplace.co.kr");

					this.create("HOD", entityMap);
				}

				result++;
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			e.printStackTrace();

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}

	public String getHolidayDataByGov(String year, String month, int rows) throws IOException {

		StringBuilder returnBuilder = new StringBuilder();

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + this.SERVICE_KEY_HOLIDAY_DATA_BY_GOV); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("solYear", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(year), "UTF-8")); /* 연 */

		if(StringUtils.isNotEmpty(month)) {
			urlBuilder.append("&" + URLEncoder.encode("solMonth", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(month), "UTF-8")); /* 월 */
		}

		if(rows > 0) {
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(rows), "UTF-8")); /* 한번에 가져오는 데이터 수 */
		} else {
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("30", "UTF-8")); /* 한번에 가져오는 데이터 수 */
		}

		URL url = new URL(urlBuilder.toString());

		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestMethod("GET");
		httpURLConnection.setRequestProperty("Content-Type", "application/json");

		BufferedReader bufferedReader;
		if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
		} else {
			bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
		}

		String line;
		while ((line = bufferedReader.readLine()) != null) {
			returnBuilder.append(line);
		}
		bufferedReader.close();
		httpURLConnection.disconnect();

		return returnBuilder.toString();
	}

	@Override
	@Transactional
	public HolidayEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		if(StringUtils.isNoneBlank(map.get("id").toString())) {

			Optional<HolidayEntity> checkEntity = this.repository.findById(map.get("id").toString());
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		HolidayEntity returnHolidayEntity = null;

		// Key 설정
		if(!map.containsKey("id") || StringUtils.isBlank(map.get("id").toString())) {
			map.put("id", this.sequenceKeyService.getKey(entId));
		}

		returnHolidayEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, HolidayEntity.class)
		);

		return returnHolidayEntity;
	}

	@Override
	@Transactional
	public HolidayEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		HolidayEntity returnHolidayEntity = null;

		Optional<HolidayEntity> holidayEntity = this.repository.findById(map.get("id").toString());
		if(holidayEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(holidayEntity.get(), map);
			returnHolidayEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, HolidayEntity.class)
			);
		}

		return returnHolidayEntity;
	}

	/**
	 * 요일 가져오기 
	 * @return 1: 월요일, 2: 화요일, 3: 수요일, 4: 목요일, 5: 금요일, 6: 토요일, 7: 일요일
	 */
	private int getDayOfWeek(LocalDate localDate) {

		// 1. DayOfWeek 객체 구하기 
		DayOfWeek dayOfWeek = localDate.getDayOfWeek();

		// 2. 숫자 요일 구하기 
		int dayOfWeekNumber = dayOfWeek.getValue();

		return dayOfWeekNumber;
	}

	/**
	 * 공휴일 및 일요일 여부 확인 
	 * @param localDate
	 * @return 공휴일/일요일: true, 평일/토요일: false
	 */
	public boolean checkHoliday(LocalDateTime localDateTime) {
		return this.checkHoliday(LocalDate.of(localDateTime.getYear(), localDateTime.getMonth(), localDateTime.getDayOfMonth()));
	}

	/**
	 * 공휴일 및 일요일 여부 확인 
	 * @param localDate
	 * @return 공휴일/일요일: true, 평일/토요일: false
	 */
	@Cacheable(value = "holiday")
	public boolean checkHoliday(LocalDate localDate) {

		boolean result = false;

		// 평일, 토요일, 일요일 체크
		int dayOfWeek = this.getDayOfWeek(localDate);
		if(dayOfWeek == 6 || dayOfWeek == 7) {	// 토요일, 일요일
			result = true;
		} else {	// 평일

			Optional<HolidayEntity> holidayEntity = this.repository.findById(localDate.format(DateTimeFormatter.ofPattern("yyyyMMdd")));
			if(holidayEntity.isPresent()) {
				result = true;
			}
		}

		return result;
	}
}