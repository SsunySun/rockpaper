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
import org.springframework.context.annotation.Primary;

/**
 * RSHM Database Configuration
 * @author wonsunlee
 *
 */
@Configuration
@MapperScan(value = "kr.co.rockplace.rshm.db.mapper.rshm", sqlSessionFactoryRef = "rshmSqlSessionFactory")
public class RSHMDatabaseConfiguration {

//	private final String TYPE_ALIASES_PACKAGE = "kr.co.rockplace.rshm.controller.rest.vo";
	private final String TYPE_HANDLERS_PACKAGE = "kr.co.rockplace.rshm.db.handler";

	@Primary
	@Bean(name = "rshmDataSource")
	@ConfigurationProperties(prefix="spring.datasource.rshm")
	public DataSource rshmDataSource() {
		return DataSourceBuilder.create().build();
	}

	@Primary
	@Bean(name = "rshmSqlSessionFactory")
	public SqlSessionFactory rshmSqlSessionFactory(
			@Qualifier("rshmDataSource") DataSource dataSource,
			ApplicationContext applicationContext) throws Exception {

		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
//		sqlSessionFactoryBean.setTypeAliasesPackage(this.TYPE_ALIASES_PACKAGE);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/rshm/**/*.xml"));
		sqlSessionFactoryBean.setTypeHandlersPackage(this.TYPE_HANDLERS_PACKAGE);
		return sqlSessionFactoryBean.getObject();
	}

	@Primary
	@Bean(name = "rshmSessionTemplate")
	public SqlSessionTemplate rshmSqlSessionTemplate(@Qualifier("rshmSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}