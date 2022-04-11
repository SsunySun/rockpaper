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
 * Task Entity 
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_TASK")
@ApiModel(description = "Task 객체")
public class TaskEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "TAS")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "act_id", nullable = false)
	@ApiModelProperty(position = 8, value = "액티비티 ID", example = "ACT00001")
	private String actId;

	@Column(name = "type_cd", nullable = false)
	@ApiModelProperty(position = 8, value = "코드 테이블의 cty_id이 'TAS_TYPE'인 정보", example = "TAS_TYPE_REG, TAS_TYPE_ACP")
	private String typeCd;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="type_cd", nullable = false, insertable = false, updatable = false)	// "유형 ID"
	private CodeEntity typeCodeEntity;

	@JsonIgnore
	@ManyToOne(targetEntity = ActivityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="act_id", nullable = false, insertable = false, updatable = false)	// "액티비티 ID"
	private ActivityEntity activityEntity;

	@JsonIgnore
	@OneToMany(mappedBy = "taskEntity", targetEntity = FormEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<FormEntity> formEntityList;

	@JsonIgnore
	@OneToMany(mappedBy = "taskEntity", targetEntity = ControlEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<ControlEntity> controlEntityList;
}