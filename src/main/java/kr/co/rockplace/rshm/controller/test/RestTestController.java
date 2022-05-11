package kr.co.rockplace.rshm.controller.test;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.rockplace.rshm.db.mapper.insa.InsaMapper;
import kr.co.rockplace.rshm.service.MailService;
import kr.co.rockplace.rshm.service.batch.CrmService;
import kr.co.rockplace.rshm.service.batch.InsaService;
import lombok.extern.slf4j.Slf4j;

/**
 * Rest Test Controller
 * @author wonsunlee
 *
 */
@RestController
@RequestMapping(value="/rest/test")
@Slf4j
public class RestTestController {

	@Autowired
	private InsaMapper insaMapper;

	@Autowired
	private InsaService insaService;

	@Autowired
	private CrmService crmService;

	@Autowired
	private MailService mailService;

	@Autowired
	Environment environment;

	@GetMapping("/test")
	public String test() throws UnknownHostException {
	
		environment.getDefaultProfiles();
		for (String profile : environment.getDefaultProfiles()) {
			log.info("profile : " + profile);
		}

		log.info("=====");
		for (String profile : environment.getActiveProfiles()) {
			log.info("profile : " + profile);
		}
		
		log.info("server.port: " + environment.getProperty("server.port"));
		log.info("server.host: " + environment.getProperty("server.host"));
		
		// Local address
		log.info("AA : "+ InetAddress.getLocalHost().getHostAddress());
		log.info("BB : "+ InetAddress.getLocalHost().getHostName());

		// Remote address
		log.info("CC : "+ InetAddress.getLoopbackAddress().getHostAddress());
		log.info("DD : "+ InetAddress.getLoopbackAddress().getHostName());
		log.info("EE : "+ InetAddress.getLoopbackAddress().getCanonicalHostName());
		

		return "test";
	}

	@GetMapping("/account")
	public Authentication account() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	@GetMapping("/admin")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public Authentication admin(HttpServletRequest request) {

		log.info("request.getAuthType: {}", request.getAuthType());
		log.info("request.getCharacterEncoding: {}", request.getCharacterEncoding());
		log.info("request.getContentLength: {}", request.getContentLength());
		log.info("request.getContentLengthLong: {}", request.getContentLengthLong());
		log.info("request.getContentType: {}", request.getContentType());
		log.info("request.getContextPath: {}", request.getContextPath());
		log.info("request.getLocalAddr: {}", request.getLocalAddr());
		log.info("request.getLocalName: {}", request.getLocalName());
		log.info("request.getLocalPort: {}", request.getLocalPort());
		log.info("request.getMethod: {}", request.getMethod());
		log.info("request.getPathInfo: {}", request.getPathInfo());
		log.info("request.getPathTranslated: {}", request.getPathTranslated());
		log.info("request.getProtocol: {}", request.getProtocol());
		log.info("request.getQueryString: {}", request.getQueryString());
		log.info("request.getRemoteAddr: {}", request.getRemoteAddr());
		log.info("request.getRemoteHost: {}", request.getRemoteHost());
		log.info("request.getRemotePort: {}", request.getRemotePort());
		log.info("request.getRemoteUser: {}", request.getRemoteUser());
		log.info("request.getRequestedSessionId: {}", request.getRequestedSessionId());
		log.info("request.getRequestURI: {}", request.getRequestURI());
		log.info("request.getScheme: {}", request.getScheme());
		log.info("request.getServerName: {}", request.getServerName());
		log.info("request.getServerPort: {}", request.getServerPort());
		log.info("request.getServletPath: {}", request.getServletPath());
//		log.info("request.getAsyncContext: {}", request.getAsyncContext());
		log.info("request.getAttributeNames: {}", request.getAttributeNames());
		log.info("request.getCookies: {}", request.getCookies().toString());
		log.info("request.getDispatcherType: {}", request.getDispatcherType());
		log.info("request.getHeaderNames: {}", request.getHeaderNames());
		log.info("request.getHttpServletMapping: {}", request.getHttpServletMapping());
//		log.info("request.getInputStream: {}", request.getInputStream());
		log.info("request.getLocale: {}", request.getLocale());
		log.info("request.getLocales: {}", request.getLocales());
		log.info("request.getParameterMap: {}", request.getParameterMap());
		log.info("request.getParameterNames: {}", request.getParameterNames());
//		log.info("request.getParts: {}", request.getParts());
//		log.info("request.getReader: {}", request.getReader());
		log.info("request.getRequestURL: {}", request.getRequestURL());
		log.info("request.getServletContext: {}", request.getServletContext());
		log.info("request.getSession: {}", request.getSession());
		log.info("request.getTrailerFields: {}", request.getTrailerFields());
		log.info("request.getUserPrincipal: {}", request.getUserPrincipal());

		log.info("ROLE_ADMIN: {}", request.isUserInRole("ROLE_ADMIN"));
		log.info("ROLE_USER: {}", request.isUserInRole("ROLE_USER"));
		return SecurityContextHolder.getContext().getAuthentication();
	}

	@GetMapping("/user")
	@PreAuthorize("hasRole('ROLE_USER')")
	public Authentication user() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	@GetMapping("/collect/crm")
	public String collectCrm() {

		log.info("=== collect CRM ===");
		this.crmService.collectCrm();

		return "success";
	}

	@GetMapping("/collect/crm_product")
	public String collectCrmProduct() {

		log.info("=== collect CRM Product ===");
		this.crmService.collectCrmProduct();

		return "success";
	}

	@GetMapping("/insa")
	public List<Map<String, Object>> insa() {

		log.info("=== insaTest ===");
		List<Map<String, Object>> list = this.insaMapper.getOrganizationList();
		list.listIterator().forEachRemaining(data -> {
			log.info("data: {}", data);
		});
		return list;
	}

	@GetMapping("/insa/code")
	public int code() {

		log.info("=== insa code ===");
		int result = this.insaService.collectCode();
		return result;
	}

	@GetMapping("/insa/org")
	public int org() {

		log.info("=== insa org ===");
		int result = this.insaService.collectOrganization();
		return result;
	}

	@GetMapping("/insa/dpt")
	public int dpt() {

		log.info("=== insa dpt ===");
		int result = this.insaService.collectDepartment();
		return result;
	}

	@GetMapping("/insa/emp")
	public int emp() {

		log.info("=== insa emp ===");
		int result = this.insaService.collectEmployee();
		return result;
	}

	@GetMapping("/mail")
	public String sendMail() {

		log.info("=== sendMail ===");
		String contentId = "CTN_SHM_SAVE";
		Map<String, Object> contentMap = Map.of(
				"id", "SHM202111-00001");

//		for (int i = 0; i < 20; i++) {
			this.mailService.sendMailByContent(contentId, contentMap);
//		}
		return "send Mail";
	}
}