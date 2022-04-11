package kr.co.rockplace.rshm.config;

import java.util.concurrent.ThreadPoolExecutor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/**
 * Scheduler Configuration
 * @author wonsunlee
 */
@Configuration
public class SchedulerConfig {

	@Bean
	public ThreadPoolTaskScheduler schedulerExecutor() {

		ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
		taskScheduler.setPoolSize(50);
		taskScheduler.setRejectedExecutionHandler(new ThreadPoolExecutor.AbortPolicy());
		return taskScheduler;
	}
}