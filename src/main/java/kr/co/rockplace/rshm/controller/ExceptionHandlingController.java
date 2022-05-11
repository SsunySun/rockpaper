package kr.co.rockplace.rshm.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Exception Handling Controller
 * @author wonsunlee
 *
 */
@Controller
public class ExceptionHandlingController implements ErrorController {

	// 에러 페이지 정의
	private final String ERROR_PAGE_PATH = "error/error";
	private final String LOGIN_FAIL_PAGE_PATH = "error/loginFail";

	/**
	 * 
	 * @param code
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/error")
	public String handleError(
			@RequestParam(required = false) String code,
			HttpServletRequest request,
			Model model) {

		// 에러 코드를 획득한다.
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {

			// 에러 코드에 대한 상태 정보 
			HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
			if (status.equals(HttpStatus.PRECONDITION_REQUIRED.value())) {

				// 에러 페이지에 표시할 정보 
				model.addAttribute("code", status.toString()); 
				model.addAttribute("msg", "로그인 정보가 수집되어 있지 않습니다.");

				return this.LOGIN_FAIL_PAGE_PATH;
			}

			// 에러 페이지에 표시할 정보 
			model.addAttribute("code", status.toString()); 
			model.addAttribute("msg", httpStatus.getReasonPhrase());
		}

		// 정의한 에러 외 모든 에러는 error/error 페이지로 보낸다. 
		return this.ERROR_PAGE_PATH; 
	}

	@Override
	public String getErrorPath() {
		return "/error";
	}
}