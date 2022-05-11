package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.SqlEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.SqlRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * SQL Service
 * @author wonsunlee
 *
 */
@Service
public class SqlService extends AdminCommonService<SqlEntity, CommonRepository<SqlEntity, String>> {

	@Autowired
	private SqlRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public SqlEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<SqlEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		SqlEntity returnSqlEntity = null;

		// Key 설정
		if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
			map.put("id", this.sequenceKeyService.getKey(entId));
		} else {
			map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
		}

		returnSqlEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, SqlEntity.class)
		);

		return returnSqlEntity;
	}

	@Override
	@Transactional
	public SqlEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		SqlEntity returnSqlEntity = null;
		Optional<SqlEntity> sqlEntity = this.repository.findById((String) map.get("id"));
		if(sqlEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(sqlEntity.get(), map);
			returnSqlEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, SqlEntity.class)
			);
		}

		return returnSqlEntity;
	}
}