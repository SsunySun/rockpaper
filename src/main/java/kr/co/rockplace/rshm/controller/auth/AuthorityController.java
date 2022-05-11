package kr.co.rockplace.rshm.controller.auth;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ResolvableType;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rockplace.rshm.utils.LogUtils;

/**
 * Authority Controller
 * @author wonsunlee
 *
 */
@Controller
@RequestMapping("/auth")
public class AuthorityController {

	private static final String authorizationRequestBaseUri = "oauth2/authorization";
	private Map<String, String> oauth2AuthenticationUrls = new HashMap<>();

	@Autowired
	private ClientRegistrationRepository clientRegistrationRepository;

	/**
	 * 
	 * @return
	 */
	@GetMapping(value= {"", "/"})
	public String getAuthorizationMessage(@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/", parameterMap, true);

		return "index";
	}

	/**
	 * 
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@GetMapping(value="/login")
	public String login(
			@RequestParam Map<String, Object> parameterMap,
			Model model) {

		LogUtils.printParam("/login", parameterMap, true);

		Iterable<ClientRegistration> clientRegistrations = null;
		ResolvableType type = ResolvableType.forInstance(this.clientRegistrationRepository).as(Iterable.class);

		if(type != ResolvableType.NONE && ClientRegistration.class.isAssignableFrom(type.resolveGenerics()[0])) {
			clientRegistrations = (Iterable<ClientRegistration>) this.clientRegistrationRepository;
		}

		assert clientRegistrations != null;
		clientRegistrations.forEach(registration -> {
				this.oauth2AuthenticationUrls.put(registration.getClientName(), authorizationRequestBaseUri + "/" + registration.getRegistrationId());
			}
		);

		model.addAttribute("urls", this.oauth2AuthenticationUrls);

		return "content/auth/login";
	}

	/**
	 * 
	 * @return
	 */
	@GetMapping(value="/loginFailure")
	@Deprecated
	public String loginFailure(@RequestParam Map<String, Object> parameterMap) {

		LogUtils.printParam("/loginFailure", parameterMap, true);

		return "loginFailure";
	}
}