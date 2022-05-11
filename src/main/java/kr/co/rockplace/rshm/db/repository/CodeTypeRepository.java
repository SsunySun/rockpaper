package kr.co.rockplace.rshm.db.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.CodeTypeEntity;

/**
 * Code Type Repository
 * @author wonsunlee
 *
 */
@Repository
public interface CodeTypeRepository extends CommonRepository<CodeTypeEntity, String> {

	public List<CodeTypeEntity> findByIsHierarchy(boolean isHierarchy);
	public Iterable<CodeTypeEntity> findByIsHierarchy(boolean isHierarchy, Sort sort);
	public Page<CodeTypeEntity> findByIsHierarchy(boolean isHierarchy, Pageable pageable);
}