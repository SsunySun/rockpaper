package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * Sequence Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_SEQUENCE")
@ApiModel(description = "Sequence 객체")
public class SequenceEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "SEQ")
	private String entId;

	@JsonIgnore
	@OneToOne(targetEntity = EntityEntity.class, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name="ent_id", nullable = false, unique = true, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "mid_type", nullable = false)
	@ApiModelProperty(position = 8, value = "시퀀스 형식", example = "yyyyMM", notes = "date format(ex: yyyyMMdd)")
	private String midType;

	@Column(name = "mid_num", nullable = false)
	@ApiModelProperty(position = 9, value = "시퀀스 형식 값", example = "0", hidden = true)
	private long midNum;

	@Column(name = "cur_num", nullable = false)
	@ApiModelProperty(position = 10, value = "현재 값", example = "0")
	private long curNum;

	@Column(name = "length", nullable = false)
	@ApiModelProperty(position = 11, value = "시퀀스의 키 자리수", example = "5", notes = "number digit")
	private int length;
}