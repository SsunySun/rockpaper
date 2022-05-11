package kr.co.rockplace.rshm.db.repository;

import org.springframework.stereotype.Repository;

import kr.co.rockplace.rshm.db.entity.LogEntity;

/**
 * Log Repository
 * @author wonsunlee
 *
 */
@Repository
public interface LogRepository extends CommonRepository<LogEntity, String> {

}