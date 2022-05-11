package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

import org.hibernate.annotations.Where;

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
 * Code Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_CODE")
@ApiModel(description = "Code 객체")
public class CodeEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "cty_id", nullable = false)
	@ApiModelProperty(position = 7, value = "유형 타입 ID", example = "")
	private String ctyId;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeTypeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="cty_id", nullable = false, insertable = false, updatable = false)	// "유형 타입 ID"
	private CodeTypeEntity codeTypeEntity;

	@Column(name = "val", nullable = false)
	@ApiModelProperty(position = 8, value = "코드 값", example = "")
	private String val;

	@Column(name = "sid", nullable = true)
	@ApiModelProperty(position = 9, value = "최상위 코드 ID", example = "")
	private String sid;

	@JsonIgnore
	@OneToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="sid", nullable = true, insertable = false, updatable = false)
	private CodeEntity superCodeEntity;

	@Column(name = "pid", nullable = true)
	@ApiModelProperty(position = 10, value = "상위 코드 ID", example = "")
	private String pid;

	@JsonIgnore
	@OneToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="pid", nullable = true, insertable = false, updatable = false)
	private CodeEntity parentCodeEntity;

	@Column(name = "level", nullable = true)
	@ApiModelProperty(position = 11, value = "코드 타입이 계층일 경우 레벨", example = "")
	private int level;

	@JsonIgnore
	@OneToMany(mappedBy = "parentCodeEntity", targetEntity = CodeEntity.class, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<CodeEntity> subCodeEntityList;
}