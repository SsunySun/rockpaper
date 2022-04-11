package kr.co.rockplace.rshm.service.admin;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.EntityEntity;
import kr.co.rockplace.rshm.db.entity.ListEntity;
import kr.co.rockplace.rshm.db.repository.CommonRepository;
import kr.co.rockplace.rshm.db.repository.EntityRepository;
import kr.co.rockplace.rshm.db.repository.ListRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;
import kr.co.rockplace.rshm.utils.ReflectionUtil;

/**
 * List Service
 * @author wonsunlee
 *
 */
@Service
public class ListService extends AdminCommonService<ListEntity, CommonRepository<ListEntity, String>> {

	@Autowired
	private ListRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Autowired
	private EntityRepository entityRepository;

	@Override
	@Transactional
	public ListEntity create(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		Optional<EntityEntity> thisEntity = this.entityRepository.findById(entId);
		if(StringUtils.isNoneBlank((String) map.get("id"))) {

			Optional<ListEntity> checkEntity = this.repository.findById(thisEntity.get().getPrefix() + "_" + map.get("id"));
			if(checkEntity.isPresent()) {
				return null;
			}
		}

		ListEntity returnListEntity = null;

		// Key 설정
		if(!map.containsKey("id") || StringUtils.isBlank((String) map.get("id"))) {
			map.put("id", this.sequenceKeyService.getKey(entId));
		} else {
			map.put("id", thisEntity.get().getPrefix() + "_" + map.get("id"));
		}

		returnListEntity = this.repository.save(
			ReflectionUtil.convertToValueObject(map, ListEntity.class)
		);

		return returnListEntity;
	}

	@Override
	@Transactional
	public ListEntity update(
			String entId,
			Map<String, Object> map) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {

		ListEntity returnListEntity = null;
		Optional<ListEntity> listEntity = this.repository.findById((String) map.get("id"));
		if(listEntity.isPresent()) {

			Map<String, Object> resultMap = ReflectionUtil.diffEntityAndMap(listEntity.get(), map);
			returnListEntity = this.repository.save(
				ReflectionUtil.convertToValueObject(resultMap, ListEntity.class)
			);
		}

		return returnListEntity;
	}
}