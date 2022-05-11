package kr.co.rockplace.rshm.db.mapper.rshm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Common Mapper
 * @author wonsunlee
 */
@NoRepositoryBean
public interface CommonMapper {

	public Map<String, Object> getObjectToMapBySQL(@Param("query") String query);
	public String getObjectToStringBySQL(@Param("query") String query);
	public List<Map<String, Object>> getListToMapBySQL(@Param("query") String query);
	public List<String> getListToStringBySQL(@Param("query") String query);

	public Map<String, Object> getSqlResultMap(Map<String, Object> map);
	public List<Map<String, Object>> getSqlResultList(Map<String, Object> map);

	/**
	 * 
	 * @param map String table, Map map, Map user
	 * @return
	 */
	public int mergeTable(Map<String, Object> map);

	/**
	 * 
	 * @param map String table, Map setMap, Map whereMap
	 * @return
	 */
	public int updateTable(Map<String, Object> map);
}