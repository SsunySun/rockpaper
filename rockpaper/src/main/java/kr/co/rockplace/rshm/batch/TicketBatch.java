package kr.co.rockplace.rshm.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.rockplace.rshm.service.batch.TicketService;
import lombok.extern.slf4j.Slf4j;

/**
 * Ticket Batch
 * @author wonsunlee
 */
@Component
@Slf4j
public class TicketBatch {

	@Autowired
	private TicketService ticketService;

	/**
	 * Close Ticket
	 */
	@Scheduled(cron = "${rshm.schedule.ticket.close:0 30 0 * * *}")
	public void closeTicket() {

		log.info("==== Close Ticket Start ====");
		this.ticketService.closeTicketOfShm();
		this.ticketService.closeTicketOfWorkorder();
		log.info("==== Close Ticket End ====");
	}
}