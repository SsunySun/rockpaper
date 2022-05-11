package kr.co.rockplace.rshm.db.repository;

import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.ContentEntity;

/**
 * Content Repository
 * @author wonsunlee
 *
 */
@Repository
public interface ContentRepository extends CommonRepository<ContentEntity, String> {

}