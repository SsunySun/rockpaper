package kr.co.rockplace.rshm.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.rockplace.rshm.service.batch.CrmService;
import lombok.extern.slf4j.Slf4j;

/**
 * Sugar CRM Batch
 * @author wonsunlee
 */
@Component
@Slf4j
public class CrmBatch {

	@Autowired
	private CrmService crmService;

	/**
	 * CRM Collect by Sugar CRM
	 */
	@Scheduled(cron = "${rshm.schedule.crm.crm:0 0 2,12 * * *}")
	public void crmCollectBySugarCRM() {

		log.info("==== Collect of CRM Start ====");
		this.crmService.collectCrm();
		log.info("==== Collect of CRM End ====");
	}

	/**
	 * CRM Collect by Sugar CRM
	 */
	@Scheduled(cron = "${rshm.schedule.crm.product:0 20 2,12 * * *}")
	public void crmProductCollectBySugarCRM() {

		log.info("==== Collect of CRM Product Start ====");
		this.crmService.collectCrmProduct();
		log.info("==== Collect of CRM Product End ====");
	}
}