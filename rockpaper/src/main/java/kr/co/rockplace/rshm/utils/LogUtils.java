package kr.co.rockplace.rshm.utils;

import java.util.Map;

import lombok.extern.slf4j.Slf4j;

/**
 * Log Utility
 * @author wonsunlee
 */
@Slf4j
public class LogUtils {

	public static void printParam(String subject, Map<String, Object> parameterMap, boolean isAll, String ...params) {

		log.info("== {} ==", subject);
		for (String param : params) {
			log.info("{}: {}", param, parameterMap.get(param));
		}

		if(isAll) {

			log.info("== parameterMap ==");
			parameterMap.forEach((paramKey, paramValue) -> {
				log.info("{} : {}", paramKey, paramValue);
			});
		}
	}
}