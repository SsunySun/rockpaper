package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
 * Control Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_CONTROL")
@ApiModel(description = "Control 객체")
public class ControlEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "CTL")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "tas_id", nullable = false)
	@ApiModelProperty(position = 8, value = "테스크 ID", example = "TAS00001")
	private String tasId;

	@JsonIgnore
	@ManyToOne(targetEntity = TaskEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="tas_id", nullable = false, insertable = false, updatable = false)	// "테스크 ID"
	private TaskEntity taskEntity;

	@Column(name = "next_tas_id", nullable = true)
	@ApiModelProperty(position = 9, value = "다음 테스크 ID", example = "TAS00002")
	private String nextTasId;

	@JsonIgnore
	@ManyToOne(targetEntity = TaskEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="next_tas_id", nullable = true, insertable = false, updatable = false)	// "다음 테스크 ID"
	private TaskEntity nextTaskEntity;

	@Column(name = "type_cd", nullable = false)
	@ApiModelProperty(position = 10, value = "코드 테이블의 cty_id이 'CTL_TYPE'인 정보", example = "CTL_TYPE_PRIMARY, CTL_TYPE_SECONDARY, CTL_TYPE_DANGER")
	private String typeCd;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="type_cd", nullable = false, insertable = false, updatable = false)	// "유형 ID"
	private CodeEntity typeCodeEntity;

	@Column(name = "data_update", nullable = true, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 11, value = "데이터 업데이트", example = "{}")
	private String dataUpdate;

	@Column(name = "content_id", nullable = true)
	@ApiModelProperty(position = 12, value = "컨텐츠 ID", example = "CTL")
	private String contentId;

	@JsonIgnore
	@ManyToOne(targetEntity = ContentEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="content_id", nullable = true, insertable = false, updatable = false)
	private ContentEntity contentEntity;
}