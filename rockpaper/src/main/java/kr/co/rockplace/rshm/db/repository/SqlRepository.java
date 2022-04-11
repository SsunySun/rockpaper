package kr.co.rockplace.rshm.db.repository;

import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.SqlEntity;

/**
 * SQL Repository
 * @author wonsunlee
 *
 */
@Repository
public interface SqlRepository extends CommonRepository<SqlEntity, String> {

}