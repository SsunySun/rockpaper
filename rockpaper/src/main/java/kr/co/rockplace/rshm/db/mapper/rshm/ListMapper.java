package kr.co.rockplace.rshm.db.mapper.rshm;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.NoRepositoryBean;

/**
 * List Mapper
 * @author wonsunlee
 */
@NoRepositoryBean
public interface ListMapper {

	public List<Map<String, Object>> getListByList(Map<String, Object> map);
	public long countNotPage(Map<String, Object> map);
	public long count(Map<String, Object> map);

	public List<Map<String, Object>> getAllListByList(Map<String, Object> map);
}