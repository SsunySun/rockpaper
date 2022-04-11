package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.CodeEntity;

/**
 * Code Repository
 * @author wonsunlee
 *
 */
@Repository
public interface CodeRepository extends CommonRepository<CodeEntity, String> {

	public List<CodeEntity> findByCtyId(String codeTypeId);
	public Iterable<CodeEntity> findByCtyId(String codeTypeId, Sort sort);
	public Page<CodeEntity> findByCtyId(String codeTypeId, Pageable pageable);

	public List<CodeEntity> findByCtyIdIn(List<String> codeTypeList);
	public Iterable<CodeEntity> findByCtyIdIn(List<String> codeTypeIdList, Sort sort);
	public Page<CodeEntity> findByCtyIdIn(List<String> codeTypeIdList, Pageable pageable);

	public List<CodeEntity> findByCtyIdAndLevel(String codeTypeId, int level);
	public Iterable<CodeEntity> findByCtyIdAndLevel(String codeTypeId, int level, Sort sort);
	public Page<CodeEntity> findByCtyIdAndLevel(String codeTypeId , int level, Pageable pageable);
}