package kr.co.rockplace.rshm.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.rockplace.rshm.service.batch.InsaService;
import lombok.extern.slf4j.Slf4j;

/**
 * Insa Batch
 * @author wonsunlee
 */
@Component
@Slf4j
public class InsaBatch {

	@Autowired
	private InsaService insaService;

	/**
	 * Code Collect by DB Inc
	 */
	@Scheduled(cron = "${rshm.schedule.insa.code:0 0 1 * * *}")
	public void codeCollectByDBInc() {

		log.info("==== Collect of Code Start ====");
		this.insaService.collectCode();
		this.insaService.collectVacationCode();
		log.info("==== Collect of Code End ====");
	}

	/**
	 * Organization Collect by DB Inc
	 */
	@Scheduled(cron = "${rshm.schedule.insa.organization:0 10 1 * * *}")
	public void organizationCollectByDBInc() {

		log.info("==== Collect of Organization Start ====");
		this.insaService.collectOrganization();
		log.info("==== Collect of Oragnization End ====");
	}

	/**
	 * Department Collect by DB Inc
	 */
	@Scheduled(cron = "${rshm.schedule.insa.department:0 20 1 * * *}")
	public void departmentCollectByDBInc() {

		log.info("==== Collect of Department Start ====");
		this.insaService.collectDepartment();
		log.info("==== Collect of Department End ====");
	}

	/**
	 * Employee Collect by DB Inc
	 */
	@Scheduled(cron = "${rshm.schedule.insa.employee:0 30 1 * * *}")
	public void employeeCollectByDBInc() {

		log.info("==== Collect of Employee Start ====");
		this.insaService.collectEmployee();
		log.info("==== Collect of Employee End ====");
	}

	/**
	 * Vacation Collect by DB Inc
	 */
	@Scheduled(cron = "${rshm.schedule.insa.vacation:0 40 1 * * *}")
	public void vacationCollectByDBInc() {

		log.info("==== Collect of Vacation Start ====");
		this.insaService.collectVacation();
		log.info("==== Collect of Vacation End ====");
	}
}