package kr.co.rockplace.rshm.config;

import java.util.HashSet;
import java.util.Set;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger Configuration
 * @author wonsunlee
 *
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

	/**
	 * Swagger에서 메인으로 보여질 정보를 설정합니다. 
	 * @return
	 */
	private ApiInfo apiInfo() {

		return new ApiInfoBuilder()
				.title("RSHM")
				.description("Rockplace Support History Management")
				.version("1.0")
				.build();
	}

	/**
	 * 응답 객체 반환시 어떤 문서 타입으로 반환할지 정할 수 있다
	 * @return
	 */
	private Set<String> getConsumeContentTypes() {

		Set<String> consumes = new HashSet<>();
		consumes.add("application/json;charset=UTF-8");
		consumes.add("application/x-www-form-urlencoded");
		return consumes;
	}

	/**
	 * 각각의 URI Method endPoint 마다 HTTP 요청시 어떤 문서 타입을 지정할 수 있는지
	 * @return
	 */
	private Set<String> getProduceContentTypes() {

		Set<String> produces = new HashSet<>();
		produces.add("application/json;charset=UTF-8");
		return produces;
	}

	@Bean
	public Docket commonApi() {

		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(apiInfo())
				.consumes(getConsumeContentTypes())
				.produces(getProduceContentTypes())
				.select()
				.apis(RequestHandlerSelectors.basePackage("kr.co.rockplace.rshm.controller"))
				.paths(PathSelectors.ant("/api/**"))
				.build();
	}
}