package kr.co.rockplace.rshm.db.mapper.rshm;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.NoRepositoryBean;

/**
 * Form Mapper
 * @author wonsunlee
 */
@NoRepositoryBean
public interface FormMapper {

	public Map<String, Object> getObjectById(Map<String, Object> map);
	public int saveForm(Map<String, Object> map);
	public int saveWorkflowFlow(Map<String, Object> map);
	public int deleteForm(Map<String, Object> map);
	public List<Map<String, Object>> getObjectList(String table);
	public List<Map<String, Object>> getObjectListById(String table, String id);

	public Map<String, Object> getFormById(String id);
	public List<Map<String, Object>> getFormListByTaskId(Map<String, Object> map);
	public List<Map<String, Object>> getRelationObjectListBySrcId(Map<String, Object> map);
}