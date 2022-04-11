package kr.co.rockplace.rshm.config.database;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * CRM Database Configuration
 * @author wonsunlee
 *
 */
@Configuration
@MapperScan(value = "kr.co.rockplace.rshm.db.mapper.crm", sqlSessionFactoryRef = "crmSqlSessionFactory")
public class CRMDatabaseConfiguration {

//	private final String TYPE_ALIASES_PACKAGE = "kr.co.rockplace.rshm.controller.rest.vo";
//	private final String TYPE_HANDLERS_PACKAGE = "kr.co.rockplace.rshm.db.handler";

	@Bean(name = "crmDataSource")
	@ConfigurationProperties(prefix="spring.datasource.crm")
	public DataSource crmDataSource() {
		return DataSourceBuilder.create().build();
	}

	@Bean(name = "crmSqlSessionFactory")
	public SqlSessionFactory crmSqlSessionFactory(
			@Qualifier("crmDataSource") DataSource dataSource,
			ApplicationContext applicationContext) throws Exception {

		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
//		sqlSessionFactoryBean.setTypeAliasesPackage(this.TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/crm/**/*.xml"));
//		sqlSessionFactoryBean.setTypeHandlersPackage(this.TYPE_HANDLERS_PACKAGE);
		return sqlSessionFactoryBean.getObject();
	}

	@Bean(name = "crmSessionTemplate")
	public SqlSessionTemplate crmSqlSessionTemplate(@Qualifier("crmSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}