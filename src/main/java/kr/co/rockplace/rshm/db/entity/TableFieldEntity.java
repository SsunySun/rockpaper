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
 * Table Field Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_TABLE_FIELD")
@ApiModel(description = "테이블 필드 객체")
public class TableFieldEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "LST")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "tab_id", nullable = false)
	@ApiModelProperty(position = 8, value = "테이블 ID", example = "TAB_ENTITY")
	private String tabId;

	@JsonIgnore
	@ManyToOne(targetEntity = TableEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="tab_id", nullable = false, insertable = false, updatable = false)	// "테이블 ID"
	private TableEntity tableEntity;

	@Column(name = "type_cd", nullable = false)
	@ApiModelProperty(position = 9, value = "코드 테이블의 cty_id이 'FLT_TYPE'인 정보", example = "FLT_TYPE_STRING, FLT_TYPE_NUMBER")
	private String typeCd; 

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="type_cd", nullable = false, insertable = false, updatable = false)	// "유형 ID"
	private CodeEntity typeCodeEntity;

	@Column(name = "tfd_id", nullable = true)
	@ApiModelProperty(position = 10, value = "필드의 코드 타입 ID", example = "FLT_TYPE")
	private String tfdId;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="tfd_id", nullable = true, insertable = false, updatable = false)	// "필드의 코드 타입 ID"
	private CodeEntity tfdCodeEntity;

	@Column(name = "ref_ent_id", nullable = true)
	@ApiModelProperty(position = 11, value = "참조 엔티티 ID", example = "EMP")
	private String refEntId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ref_ent_id", nullable = false, insertable = false, updatable = false)	// "참조 엔티티 ID"
	private EntityEntity refEntityEntity;

	@Column(name = "ref_cty_id", nullable = true)
	@ApiModelProperty(position = 12, value = "참조 코드 타입 ID", example = "FTY")
	private String refCtyId;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeTypeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ref_cty_id", nullable = true, insertable = false, updatable = false)	// "참고 코드 ID"
	private CodeTypeEntity refCtyCodeTypeEntity;

	@Column(name = "product", nullable = false)
	@ApiModelProperty(position = 13, value = "시스템 필드 여부", example = "false")
	private boolean isProduct;
}