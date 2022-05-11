package kr.co.rockplace.rshm.service.batch;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.SqlEntity;
import kr.co.rockplace.rshm.db.mapper.rshm.CommonMapper;
import kr.co.rockplace.rshm.service.LogService;
import kr.co.rockplace.rshm.service.admin.SqlService;
import kr.co.rockplace.rshm.utils.CommonUtils;
import kr.co.rockplace.rshm.utils.JsonUtil;
import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Ticket Service
 * @author wonsunlee
 *
 */
@Service
public class TicketService {

	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private SqlService sqlService;

	@Autowired
	private LogService logService;

	/**
	 * Close Ticket of SHM
	 */
	public int closeTicketOfShm() {
		return this.closeTicket("TAB_SHM", "CLOSED_SHM_LIST");
	}

	/**
	 * Close Ticket Of Workorder after 7 days
	 */
	public int closeTicketOfWorkorder() {
		return this.closeTicket("TAB_WORKORDER", "CLOSED_WORKORDER_LIST");
	}


	private int closeTicket(String table, String sqlId) {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_CLOSE_TICKET";

		SqlEntity sqlEntity = this.sqlService.getObject(sqlId);
		Map<String, Object> configMap = null;
		if(sqlEntity != null) {
			configMap = JsonUtil.convertJSONStringToMap(sqlEntity.getConfig());
		}

		LocalDate startDate = LocalDate.now().minusDays(14);
		LocalDate endDate = LocalDate.now().minusDays(7);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		paramMap.put("end", endDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

		MapperParseVo mapperParseVo = CommonUtils.parseSqlParam(paramMap, configMap);

		Map<String, Object> mapperMap = new HashMap<String, Object>();
		mapperMap.put("query", CommonUtils.transVarsByData(sqlEntity.getQuery(), paramMap));
		mapperMap.put("mapperParseVo", mapperParseVo);

		int resultCount = 0;

		List<Map<String, Object>> resultList = this.commonMapper.getSqlResultList(mapperMap);
		for (Map<String, Object> resultMap : resultList) {
	
			try {

				Map<String, Object> setMap = new HashMap<String, Object>();
				setMap.put("ass_emp_id", null);

				Map<String, Object> whereMap = Map.of(
						"id", resultMap.get("id").toString());

				this.commonMapper.updateTable(Map.of(
						"table", table,
						"setMap", setMap,
						"whereMap", whereMap));

				resultCount++;
			} catch (Exception e) {

				e.printStackTrace();
				logContent += e.getMessage();
			}
		}

		finishTime = System.currentTimeMillis();
		elapsedTime = finishTime - startTime;
		isLogResult = true;
		logMessage = "Total : " + resultList.size() + ", Count : " + resultCount + ", type : " + table + ", elapsedTime : " + elapsedTime + "ms";
		logContent = "";

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return resultCount;
	}
}