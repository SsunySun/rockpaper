package kr.co.rockplace.rshm;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;

import kr.co.rockplace.rshm.service.batch.InsaService;
import kr.co.rockplace.rshm.utils.SysJMX;
import lombok.extern.slf4j.Slf4j;

/**
 * Rockplace Service History Management Application
 * @author wonsunlee
 *
 */
@Slf4j
@EnableCaching
@EnableScheduling
@SpringBootApplication
public class RshmApplication {

	@Autowired
	private InsaService insaService;

	@Resource
	private Environment environment;

	public static void main(String[] args) {

		ConfigurableApplicationContext applicationContext = SpringApplication.run(RshmApplication.class, args);
		RshmApplication rshmApplication = applicationContext.getBean(RshmApplication.class);
		rshmApplication.init();

		// 서비스 실행 후 프로세스 모니터링을 위한 파일 생성 
		File exit = new File(SysJMX.getProcessPID() + ".rshm");
		try {
			exit.createNewFile();
		} catch (Exception e) {

			String tmp = System.getProperty("user.home", "/tmp");
			exit = new File(tmp, SysJMX.getProcessPID() + ".rshm.run");
			try {
				exit.createNewFile();
			} catch (Exception k) {
				System.exit(1);
			}
		}
		exit.deleteOnExit();

		log.info("== rockPLACE Service History Management start ==");
		log.info("System JRE version: {}", System.getProperty("java.version"));

		// 프로세스 모니터링 및 프로세스 파일 삭제시 서비스 종료 
		while (true) {

			if (exit.exists() == false) {

				log.info("== rockPLACE Service History Management shutdown ==");
				System.exit(0);
			}

			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 초기 서비스 실행시 추가 Method 실행 
	 */
	public void init() {

		boolean isCode = this.environment.getProperty("rshm.init-collect.code", Boolean.class);
		if(isCode) {
			this.insaService.collectCode();
		}

		boolean isOrganization = this.environment.getProperty("rshm.init-collect.organization", Boolean.class);
		if(isOrganization) {
			this.insaService.collectOrganization();
		}

		boolean isDepartment = this.environment.getProperty("rshm.init-collect.department", Boolean.class);
		if(isDepartment) {
			this.insaService.collectDepartment();
		}

		boolean isEmployee = this.environment.getProperty("rshm.init-collect.employee", Boolean.class);
		if(isEmployee) {
			this.insaService.collectEmployee();
		}
	}
}