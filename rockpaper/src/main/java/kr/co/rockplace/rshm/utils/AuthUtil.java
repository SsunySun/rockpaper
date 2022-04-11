package kr.co.rockplace.rshm.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;

/**
 * Authority Utility
 * @author wonsunlee
 */
@Slf4j
public class AuthUtil {

	/**
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getCurrentUser() {

		Map<String, Object> userMap = null;

		try {

			ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);

			userMap = (Map<String, Object>) httpSession.getAttribute("user");
		} catch (Exception e) {}

		if(CommonUtils.isNull(userMap)) {

			userMap = new HashMap<String, Object>();
			userMap.put("id", "rshmadmin@rockplace.co.kr");
			userMap.put("name", "관리자");

			userMap.put("orgId", "ORG_ROCKPLACE");
			userMap.put("orgName", "락플레이스");
			userMap.put("deptId", "DPT_ROCKPLACE");
			userMap.put("deptName", "Rockplace");
			userMap.put("dutyCode", "");
		}

		return userMap;
	}

	/**
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getCurrentUserId() {

		String userId = "";

		try {

			ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);

			userId = ((Map<String, Object>)httpSession.getAttribute("user")).get("id").toString();
		} catch (Exception e) {}

		return userId;
	}

	/**
	 * 
	 * @param userMap
	 */
	public static void setCurrentUser(Map<String, Object> userMap) {

		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);
		httpSession.setAttribute("user", userMap);
	}

	/**
	 * 
	 * @param role
	 * @return
	 */
	public static boolean hasRole(String role) {

		// get security context from thread local
		SecurityContext context = SecurityContextHolder.getContext();
		if (context == null) {
			return false;
		}

		Authentication authentication = context.getAuthentication();
		if (authentication == null) {
			return false;
		}

		for (GrantedAuthority auth : authentication.getAuthorities()) {
			if (role.equals(auth.getAuthority())) {
				return true;
			}
		}

		return false;
	}

	/**
	 * 
	 */
	@SuppressWarnings("unchecked")
	public static void printSession() {

		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);
		httpSession.getAttributeNames().asIterator().forEachRemaining(str -> {
			log.info("{} : {}", str, httpSession.getAttribute(str));
		});

		Map<String, Object> userMap = (Map<String, Object>) httpSession.getAttribute("user");
		if(userMap != null && !userMap.isEmpty()) {

			userMap.forEach((key, value)
					-> {
						log.info("{} : {}", key, value);
					});
		}
	}
}