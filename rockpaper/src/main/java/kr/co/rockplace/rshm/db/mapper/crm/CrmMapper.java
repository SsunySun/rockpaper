package kr.co.rockplace.rshm.db.mapper.crm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * CRM Mapper
 * @author wonsunlee
 *
 */
@Mapper
public interface CrmMapper {

	public long getOpportunitiesCount();
	public List<Map<String, Object>> getOpportunitiesList(Map<String, Object> map);

	public long getOpportunityCountById(String id);
	public List<Map<String, Object>> getOpportunityById(String id);

	public long getProductsCount();
	public List<Map<String, Object>> getProductsList(Map<String, Object> map);

	public long getProductsCountById(String id);
	public List<Map<String, Object>> getProductsListByid(String id);
}