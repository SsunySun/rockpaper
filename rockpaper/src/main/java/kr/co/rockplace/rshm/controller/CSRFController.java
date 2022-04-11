package kr.co.rockplace.rshm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * CSRF Controller
 * @author wonsunlee
 *
 */
@Controller
public class CSRFController {

	/**
	 * 
	 * @param request
	 * @return
	 */
	@GetMapping(value="/csrf", produces = "application/json;charset=UTF-8")
	public ResponseEntity<CsrfToken> getToken(final HttpServletRequest request) {
		return ResponseEntity.ok().body(new HttpSessionCsrfTokenRepository().generateToken(request));
	}
}