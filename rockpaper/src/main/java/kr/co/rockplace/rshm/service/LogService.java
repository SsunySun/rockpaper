package kr.co.rockplace.rshm.service;

import java.time.LocalDateTime;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.LogEntity;
import kr.co.rockplace.rshm.db.repository.LogRepository;
import kr.co.rockplace.rshm.db.service.SequenceKeyService;

/**
 * Log Service
 * @author wonsunlee
 *
 */
@Service
public class LogService {

	@Autowired
	private LogRepository repository;

	@Autowired
	private SequenceKeyService sequenceKeyService;

	@Transactional
	public void create(
			String typeCd,
			String message,
			String content,
			boolean isResult) {

		this.repository.save(
				LogEntity.builder()
				.id(this.sequenceKeyService.getUniqueKey())
				.name(message)
//				.label("label")
//				.descr("descr")
				.isUsed(true)
				.orderBy(1)
				.createDate(LocalDateTime.now())
				.createEmpId("rshmadmin@rockplace.co.kr")
//				.updateDate(LocalDateTime.now())
//				.updateEmpId("rshmadmin@rockplace.co.kr")
				.typeCd(typeCd)
				.content(content)
				.isResult(isResult)
				.build());
	}
}