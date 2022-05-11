package kr.co.rockplace.rshm.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.rockplace.rshm.service.batch.MaintenanceService;
import lombok.extern.slf4j.Slf4j;

/**
 * Maintenance Batch
 * @author wonsunlee
 */
@Component
@Slf4j
public class MaintenanceBatch {

	@Autowired
	private MaintenanceService maintenanceService;

	/**
	 * Create Ticket Monthly SHM Maintenance
	 */
	@Scheduled(cron = "${rshm.schedule.maintenance.monthly:0 5 0 1 * *}")
	public void createTicketOfMonthlyMaintenance() {

		log.info("==== Create Tikect of Monthly Maintenance Start ====");
		this.maintenanceService.createTicketOfMonthlyMaintenance();
		log.info("==== Create Tikect of Monthly Maintenance End ====");
	}

	/**
	 * Create Ticket Bimonthly SHM Maintenance
	 */
	@Scheduled(cron = "${rshm.schedule.maintenance.bimonthly:0 10 0 1 1,3,5,7,9.11 *}")
	public void createTicketOfBimonthMaintenance() {

		log.info("==== Create Tikect of Bimonthly Maintenance Start ====");
		this.maintenanceService.createTicketOfBimonthlyMaintenance();
		log.info("==== Create Tikect of Bimonthly Maintenance End ====");
	}

	/**
	 * Create Ticket Quarterly SHM Maintenance
	 */
	@Scheduled(cron = "${rshm.schedule.maintenance.quarterly:0 15 0 1 1,4,7,10 *}")
	public void createTicketOfQuarterlyMaintenance() {

		log.info("==== Create Tikect of Quarterly Maintenance Start ====");
		this.maintenanceService.createTicketOfQuarterlyMaintenance();
		log.info("==== Create Tikect of Quarterly Maintenance End ====");
	}

	/**
	 * Create Ticket Half SHM Maintenance
	 */
	@Scheduled(cron = "${rshm.schedule.maintenance.half:0 20 0 1 1,6 *}")
	public void createTicketOfHalfMaintenance() {

		log.info("==== Create Tikect of Half Maintenance Start ====");
		this.maintenanceService.createTicketOfHalfMaintenance();
		log.info("==== Create Tikect of Half Maintenance End ====");
	}

	/**
	 * Create Ticket Year SHM Maintenance
	 */
	@Scheduled(cron = "${rshm.schedule.maintenance.year:0 25 0 1 1 *}")
	public void createTicketOfYearMaintenance() {

		log.info("==== Create Tikect of Year Maintenance Start ====");
		this.maintenanceService.createTicketOfYearMaintenance();
		log.info("==== Create Tikect of Year Maintenance End ====");
	}
}