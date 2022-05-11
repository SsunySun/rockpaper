package kr.co.rockplace.rshm.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.rockplace.rshm.service.admin.HolidayService;
import lombok.extern.slf4j.Slf4j;

/**
 * Holiday Batch
 * @author wonsunlee
 */
@Component
@Slf4j
public class HolidayBatch {

	@Autowired
	private HolidayService holidayService;

	/**
	 * Holiday Collect by 공공데이터 포털 
	 */
	@Scheduled(cron = "${rshm.schedule.holiday:0 0 1 * * 7}")
	public void holidayCollectByDataGov() {

		log.info("==== Collect of Holiday Start ====");
		this.holidayService.collectHoliday();
		log.info("==== Collect of Holiday End ====");
	}
}