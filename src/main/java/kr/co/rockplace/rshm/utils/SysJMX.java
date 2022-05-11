package kr.co.rockplace.rshm.utils;

import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;

/**
 * System JMX Utility
 * @author wonsunlee
 */
public class SysJMX {

	/**
	 * 프로세스 정보 가져오기 
	 * @return proecss pid
	 */
	public static int getProcessPID() {

		RuntimeMXBean o = ManagementFactory.getRuntimeMXBean();
		String nm = o.getName();
		int x = nm.indexOf("@");
		try {

			if (x > 0) {
				return Integer.parseInt(nm.substring(0, x));
			}
		} catch (Exception e) {}

		return -1;
	}
}