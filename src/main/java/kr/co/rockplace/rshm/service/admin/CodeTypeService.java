package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.CodeTypeEntity;
import kr.co.rockplace.rshm.db.repository.CodeTypeRepository;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Code Type Service
 * @author wonsunlee
 *
 */
@Service
public class CodeTypeService extends AdminCommonService<CodeTypeEntity, CommonRepository<CodeTypeEntity, String>> {

	@Autowired
	private CodeTypeRepository repository;

	@Override
	@Transactional
	public CodeTypeEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<CodeTypeEntity> checkEntity = this.repository.findById((String) map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		CodeTypeEntity returnCodeTypeEntity = null;
		returnCodeTypeEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, CodeTypeEntity.class)
		);

		return returnCodeTypeEntity;
	}

	@Override
	@Transactional
	public CodeTypeEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		CodeTypeEntity returnCodeTypeEntity = null;
		Optional<CodeTypeEntity> codeTypeEntity = this.repository.findById((String) map.get("id"));
		if(codeTypeEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(codeTypeEntity.get(), map);
			returnCodeTypeEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, CodeTypeEntity.class)
			);
		}
		return returnCodeTypeEntity;
	}
}