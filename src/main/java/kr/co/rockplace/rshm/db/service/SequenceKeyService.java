package kr.co.rockplace.rshm.db.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.SequenceEntity;
import kr.co.rockplace.rshm.db.repository.SequenceRepository;
import kr.co.rockplace.rshm.utils.AuthUtil;

/**
 * Sequence Make Key Service
 * @author wonsunlee
 *
 */
@Service
public class SequenceKeyService {

	@Autowired
	private SequenceRepository sequenceRepository;

	private String id;
	private String entId;

	private LocalDateTime createDate;
	private String entityName;
	private String prefix;
	private String midType;
	private long midNum;
	private long curNum;
	private int length;

	private String key;

	private long loadSequence() {

//		Optional<SequenceEntity> sequenceResult = this.sequenceRepository.findById(this.entId);
//		sequenceResult.ifPresentOrElse(
//			selectSequence -> {
//
//				this.entityEntity = selectSequence.getEntityEntity();
//				this.prefix = selectSequence.getPrefix();
//				this.midType = selectSequence.getMidType();
//				this.midNum = selectSequence.getMidNum();
//				this.curNum = selectSequence.getCurNum();
//				this.length = selectSequence.getLength();
//			}, () -> {
//
//				this.nextSeqNumber();
//				this.updateSequenceNumber();
//			}
//		);

		SequenceEntity sequenceResult = this.sequenceRepository.findByEntId(this.entId);
		if(sequenceResult != null) {

			this.id = sequenceResult.getId();
			if(sequenceResult.getEntityEntity() != null) {

				this.entityName = sequenceResult.getEntityEntity().getName();
				this.prefix = sequenceResult.getEntityEntity().getPrefix();
			}
			this.midType = sequenceResult.getMidType();
			this.midNum = sequenceResult.getMidNum();
			this.curNum = sequenceResult.getCurNum();
			this.length = sequenceResult.getLength();
			this.createDate = sequenceResult.getCreateDate();
		}

		return this.curNum;
	}

	private long getDateType() {

		if(StringUtils.isNotEmpty(this.midType)) {

			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(this.midType);
			return Long.parseLong(simpleDateFormat.format(new Date()));
		} else {
			return 0;
		}
	}

	private long nextSeqNumber() {

		this.curNum++;
		long curMidNum = this.getDateType();

		if (this.midNum != curMidNum) {

			this.midNum = curMidNum;
			this.curNum = 1;
			return this.curNum;
		}

		return this.curNum;
	}

	public final synchronized String getUniqueKey() {
		return UUID.randomUUID().toString();
	}

	public synchronized String getKey(String entId) {
		return this.getKey(entId, true);
	}

	public synchronized String getKey(String entId, boolean flush) {

		if(StringUtils.isEmpty(entId)) {
			return this.getUniqueKey();
		}

		this.entId = entId;

		StringBuffer sb = new StringBuffer();

		if (flush) {

			this.curNum = this.loadSequence();
			this.nextSeqNumber();
			this.updateSequenceNumber();
		} else {
			this.nextSeqNumber();
		}

		// Prefix
		if (StringUtils.isNotEmpty(this.prefix)) {
			sb.append(this.prefix);
		}

		// 날짜 타입
		if (StringUtils.isNotEmpty(this.midType)) {
			sb.append(midNum).append('-');
		}

		// 현재 숫자 
		sb.append(StringUtils.leftPad(String.valueOf(this.curNum), this.length, "0"));

		this.key = sb.toString();
		return this.key;
	}

	private synchronized void updateSequenceNumber() {

		String createEmpId = AuthUtil.getCurrentUserId();
		if(StringUtils.isEmpty(createEmpId)) {
			createEmpId = "rshmadmin@rockplace.co.kr";
		}

		String updateEmpId = AuthUtil.getCurrentUserId();
		if(StringUtils.isEmpty(updateEmpId)) {
			updateEmpId = "rshmadmin@rockplace.co.kr";
		}

		SequenceEntity sequenceEntity = SequenceEntity.builder()
				.id(this.id)
				.name(this.entityName)
				.createDate(this.createDate)
				.createEmpId(createEmpId)
				.updateDate(LocalDateTime.now())
				.updateEmpId(updateEmpId)

				.entId(this.entId)
				.midType(this.midType)
				.midNum(this.midNum)
				.curNum(this.curNum)
				.length(this.length)
				.build();

		this.sequenceRepository.save(sequenceEntity);
	}
}