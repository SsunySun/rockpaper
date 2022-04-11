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
 * Table Field Type Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_FIELD_TYPE")
@ApiModel(description = "필드 타입 객체")
public class FieldTypeEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "def_uiitem", nullable = false)
	@ApiModelProperty(position = 7, value = "Default UIItem")
	private String defUIItem;

	@Column(name = "type_cd", nullable = false)
	@ApiModelProperty(position = 8, value = "코드 테이블의 cty_id이 'FLT_TYPE'인 정보(Level 1)", example = "")
	private String typeCd;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="type_cd", nullable = false, insertable = false, updatable = false)
	private CodeEntity typeCodeEntity;

	@JsonIgnore
	@OneToMany(mappedBy = "codeTypeEntity", targetEntity = CodeEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<CodeEntity> codeEntityList;
}