package kr.co.rockplace.rshm.service.batch;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.mapper.crm.CrmMapper;
import kr.co.rockplace.rshm.db.mapper.rshm.CommonMapper;
import kr.co.rockplace.rshm.service.LogService;
import kr.co.rockplace.rshm.vo.MapperParseVo;

/**
 * Sugar CRM Service
 * @author wonsunlee
 *
 */
@Service
public class CrmService {

	@Autowired
	private CrmMapper crmMapper;

	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private LogService logService;

	/**
	 * Collect of CRM
	 */
	public int collectCrm() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_CRM";

		int result = 0;

		try {

			long opportunitiesCount = this.crmMapper.getOpportunitiesCount();

			// 한번에 가져오는 갯수 
			int length = 1000;
			for (int start = 0; start < opportunitiesCount; start+=length) {

				MapperParseVo mapperParseVo = new MapperParseVo();
				mapperParseVo.getMap().put("start", start);
				mapperParseVo.getMap().put("length", length);

				List<Map<String, Object>> opportunitiesList = this.crmMapper.getOpportunitiesList(Map.of("mapperParseVo", mapperParseVo));
				for (Map<String, Object> opportunityMap : opportunitiesList) {

					Map<String, Object> map = new HashMap<>();
					opportunityMap.forEach((paramKey, paramValue) -> {
						map.put(paramKey, paramValue);
					});

					if(StringUtils.isNotBlank((String)map.get("id"))) {

						this.commonMapper.mergeTable(Map.of(
								"table", "tab_crm",
								"map", map,
								"user", Map.of(
										"id", "rshmadmin@rockplace.co.kr")));

						result++;
					}
				}
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + opportunitiesCount + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

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
	 * Collect of CRM by ID
	 * @param id
	 */
	public int collectCrm(String id) {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_CRM_M";

		int result = 0;

		try {

			long opportunitiesCount = this.crmMapper.getOpportunityCountById(id);

			// 한번에 가져오는 갯수 
			int length = 1000;
			for (int start = 0; start < opportunitiesCount; start+=length) {

				List<Map<String, Object>> opportunitiesList = this.crmMapper.getOpportunityById(id);
				for (Map<String, Object> opportunityMap : opportunitiesList) {

					Map<String, Object> map = new HashMap<>();
					opportunityMap.forEach((paramKey, paramValue) -> {
						map.put(paramKey, paramValue);
					});

					if(StringUtils.isNotBlank((String)map.get("id"))) {

						this.commonMapper.mergeTable(Map.of(
								"table", "tab_crm",
								"map", map,
								"user", Map.of(
										"id", "rshmadmin@rockplace.co.kr")));

						result++;
					}
				}
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + opportunitiesCount + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

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
	 * Collect of CRM Product
	 */
	public int collectCrmProduct() {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_CRM_PROD";

		int result = 0;

		try {

			long productsCount = this.crmMapper.getProductsCount();

			// 한번에 가져오는 갯수 
			int length = 1000;
			for (int start = 0; start < productsCount; start+=length) {

				MapperParseVo mapperParseVo = new MapperParseVo();
				mapperParseVo.getMap().put("start", start);
				mapperParseVo.getMap().put("length", length);

				List<Map<String, Object>> productList = this.crmMapper.getProductsList(Map.of("mapperParseVo", mapperParseVo));
				for (Map<String, Object> productMap : productList) {

					Map<String, Object> map = new HashMap<>();
					productMap.forEach((paramKey, paramValue) -> {
						map.put(paramKey, paramValue);
					});

					if(StringUtils.isNotBlank((String)map.get("id"))) {

						this.commonMapper.mergeTable(Map.of(
								"table", "tab_crm_prod",
								"map", map,
								"user", Map.of(
										"id", "rshmadmin@rockplace.co.kr")));

						result++;
					}
				}
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + productsCount + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

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
	 * Collect of CRM Product
	 * @param id
	 */
	public int collectCrmProduct(String id) {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_CRM_PROD_M";

		int result = 0;

		try {

			long productsCount = this.crmMapper.getProductsCountById(id);

			// 한번에 가져오는 갯수 
			int length = 1000;
			for (int start = 0; start < productsCount; start+=length) {

				List<Map<String, Object>> productList = this.crmMapper.getProductsListByid(id);
				for (Map<String, Object> productMap : productList) {

					Map<String, Object> map = new HashMap<>();
					productMap.forEach((paramKey, paramValue) -> {
						map.put(paramKey, paramValue);
					});

					this.commonMapper.mergeTable(Map.of(
							"table", "tab_crm_prod",
							"map", map,
							"user", Map.of(
									"id", "rshmadmin@rockplace.co.kr")));

					result++;
				}
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "Total: " + productsCount + ", Success Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = "";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "Count : " + result + ", elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);

		return result;
	}
}