package kr.co.rockplace.rshm.db.mapper.insa;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * Insa Mapper
 * @author wonsunlee
 *
 */
@Mapper
public interface InsaMapper {

	public List<Map<String, Object>> getOrganizationList();
	public List<Map<String, Object>> getDepartmentList();
	public List<Map<String, Object>> getEmployeeList();
	public List<Map<String, Object>> getCodeList();
	public List<Map<String, Object>> getDepartmentLeaderInfoList();
	public List<Map<String, Object>> getVacationCodeList();
	public List<Map<String, Object>> getVacationList(Map<String, LocalDate> map);
}