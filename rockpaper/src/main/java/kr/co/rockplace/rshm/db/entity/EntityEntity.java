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
 * Entity Entity 
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_ENTITY")
@ApiModel(description = "Entity 객체")
public class EntityEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "prefix", unique = true, nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 Prefix값")
	private String prefix;

	@Column(name = "type_cd", nullable = false)
	@ApiModelProperty(position = 8, value = "코드 테이블의 cty_id이 'ENT_TYPE'인 정보", example = "ENT_TYPE_SYSTEM, ENT_TYPE_WORKFLOW")
	private String typeCd; 

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="type_cd", nullable = false, insertable = false, updatable = false)	// "유형 ID"
	private CodeEntity typeCodeEntity;

	@JsonIgnore
	@OneToOne(mappedBy = "entityEntity", targetEntity = SequenceEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@ApiModelProperty(position = 9, value = "시퀀스 정보", example = "")
	private SequenceEntity sequenceEntity;

	@JsonIgnore
	@OneToMany(mappedBy = "entityEntity", targetEntity = TableEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<TableEntity> tableEntityList;
}