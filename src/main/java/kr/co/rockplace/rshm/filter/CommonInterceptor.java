package kr.co.rockplace.rshm.filter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.rockplace.rshm.utils.AuthUtil;

/**
 * Common Interceptor
 * @author wonsunlee
 *
 */
@Component
public class CommonInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		Map<String, Object> userMap = AuthUtil.getCurrentUser();
		if(userMap == null) {

			response.sendError(HttpStatus.PRECONDITION_REQUIRED.value(), "로그인 정보가 수집되어 있지 않습니다.");
			return false;
		} else {
			return true;
		}
	}
}