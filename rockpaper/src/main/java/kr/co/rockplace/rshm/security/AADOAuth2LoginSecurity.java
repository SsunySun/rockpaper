package kr.co.rockplace.rshm.security;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.azure.spring.aad.webapp.AADWebSecurityConfigurerAdapter;

import kr.co.rockplace.rshm.db.entity.EmployeeEntity;
import kr.co.rockplace.rshm.service.admin.EmployeeService;
import kr.co.rockplace.rshm.utils.AuthUtil;
import lombok.RequiredArgsConstructor;

/**
 * Azure AD Web Security Configuration
 * @author wonsunlee
 *
 */
@RequiredArgsConstructor
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AADOAuth2LoginSecurity extends AADWebSecurityConfigurerAdapter {

	@Autowired
	protected EmployeeService employeeService;

	@Override
	public void configure(WebSecurity web) throws Exception {

		/*
		 * js, css, image 설정은 보안 설정의 영향 밖에 있도록 만들어주는 설정.
		 */
		web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// @formatter:off
		http
			.cors()
			.and()
				.csrf().disable()
//				.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
//			.and()
				.headers().frameOptions().disable()
			.and()
				.authorizeRequests()
				.antMatchers("/test/**, /demo/**").permitAll()
				.antMatchers("/csrf", "/assets/**").permitAll()
				.antMatchers("/api/**").hasRole("USER")
				.antMatchers("/api/admin/**").hasRole("ADMIN")
				.antMatchers("/v2/api-docs", "/swagger-ui.html", "/webjars/**", "/swagger-resources/**").hasRole("ADMIN")
				.anyRequest().authenticated()
			.and()
				.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.invalidateHttpSession(true)
				.clearAuthentication(true)
				.deleteCookies("JSESSIONID")
//				.logoutSuccessUrl("https://login.microsoftonline.com/common/oauth2/logout")
				.logoutSuccessUrl(String.format("https://login.microsoftonline.com/%s/oauth2/logout", properties.getTenantId()))
				.permitAll()
			.and()
				.oauth2Login()
//				.loginPage("/login")	// 로그인 커스텀 페이지일 경우 사용 
				.userInfoEndpoint()
					.oidcUserService(this.oidcUserService())
			.and()
				.defaultSuccessUrl("/")
				.failureUrl("/loginFailure")
		;
		// @formatter:on
	}

	private OAuth2UserService<OidcUserRequest, OidcUser> oidcUserService() {

		final OidcUserService delegate = new OidcUserService();

		return (userRequest) -> {

			OidcUser oidcUser = delegate.loadUser(userRequest);

			List<GrantedAuthority> grantedAuthorityList = null;

			List<String> roleList = oidcUser.getAttribute("roles");
			if(oidcUser.containsClaim("roles") && roleList.contains("ADMIN")) {
				grantedAuthorityList = AuthorityUtils.createAuthorityList("ROLE_ADMIN", "ROLE_USER");
			} else if(oidcUser.containsClaim("roles") && roleList.contains("BUSINESS")) {
				grantedAuthorityList = AuthorityUtils.createAuthorityList("ROLE_BUSINESS_MANAGEMENT", "ROLE_USER");
			} else {
				grantedAuthorityList = AuthorityUtils.createAuthorityList("ROLE_USER");
			}

			// TODO
			// 1) Fetch the authority information from the protected resource using accessToken
			// 2) Map the authority information to one or more GrantedAuthority's and add it to mappedAuthorities
			// 3) Create a copy of oidcUser but use the mappedAuthorities instead
			oidcUser = new DefaultOidcUser(grantedAuthorityList, oidcUser.getIdToken(), oidcUser.getUserInfo());

			Map<String, Object> userMap = new HashMap<>();
			EmployeeEntity employeeEntity = this.employeeService.getObject(oidcUser.getPreferredUsername());
			if(employeeEntity != null) {

				userMap.put("id", employeeEntity.getId());
				userMap.put("name", employeeEntity.getName());

				userMap.put("orgId", employeeEntity.getOrganizationEntity().getId());
				userMap.put("orgName", employeeEntity.getOrganizationEntity().getName());
				userMap.put("deptId", employeeEntity.getDepartmentEntity().getId());
				userMap.put("deptName", employeeEntity.getDepartmentEntity().getName());
				userMap.put("dutyCode", employeeEntity.getDutyPositionCd());

				AuthUtil.setCurrentUser(userMap);
			}

			return oidcUser;
		};
	}
}