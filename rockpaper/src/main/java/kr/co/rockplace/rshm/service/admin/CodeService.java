package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.CodeEntity;
import kr.co.rockplace.rshm.db.entity.CodeTypeEntity;
import kr.co.rockplace.rshm.db.repository.CodeRepository;
import kr.co.rockplace.rshm.db.repository.CodeTypeRepository;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * Code Service
 * @author wonsunlee
 *
 */
@Service
public class CodeService extends AdminCommonService<CodeEntity, CommonRepository<CodeEntity, String>> {

	@Autowired
	private CodeRepository repository;

	@Autowired
	private CodeTypeRepository codeTypeRepository;

	@Override
	@Transactional
	public CodeEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<CodeEntity> checkEntity = this.repository.findById((String) map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		CodeEntity returnCodeEntity = null;
		Optional<CodeTypeEntity> codeTypeEntity = this.codeTypeRepository.findById((String) map.get("ctyId"));
		if(codeTypeEntity.isPresent()) {

			returnCodeEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(map, CodeEntity.class)
			);
		}

		return returnCodeEntity;
	}

	@Override
	@Transactional
	public CodeEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		CodeEntity returnCodeEntity = null;
		Optional<CodeTypeEntity> codeTypeEntity = this.codeTypeRepository.findById((String) map.get("ctyId"));
		if(codeTypeEntity.isPresent()) {

			Optional<CodeEntity> codeEntity = this.repository.findById((String) map.get("id"));
			if(codeEntity.isPresent()) {

				Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(codeEntity.get(), map);
				returnCodeEntity = this.repository.save(
					ReflectionUtil.convertToValueObject(resultMap, CodeEntity.class)
				);
			}
		}

		return returnCodeEntity;
	}

	/**
	 * 특정 코드 타입의 코드 리스트 가져오기
	 * @param ctyId Code Type ID
	 * @return
	 */
	public List<CodeEntity> getCodeByCodeTypeList(String ctyId) {
		return this.repository.findByCtyId(ctyId);
	}

	/**
	 * 특정 코드 타입의 코드 리스트 가져오기
	 * @param ctyId Code Type ID
	 * @param level Level
	 * @return
	 */
	public List<CodeEntity> getCodeByCodeTypeList(String ctyId, int level) {
		return this.repository.findByCtyIdAndLevel(ctyId, level);
	}
}