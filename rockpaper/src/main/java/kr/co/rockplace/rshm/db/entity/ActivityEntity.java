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
 * Activity Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_ACTIVITY")
@ApiModel(description = "Activity 객체")
public class ActivityEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "ACT")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "wof_id", nullable = false)
	@ApiModelProperty(position = 8, value = "워크플로우 ID", example = "WOF00001")
	private String wofId;

	@JsonIgnore
	@ManyToOne(targetEntity = WorkflowEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="wof_id", nullable = false, insertable = false, updatable = false)	// "워크플로우 ID"
	private WorkflowEntity workflowEntity;

	@JsonIgnore
	@OneToMany(mappedBy = "activityEntity", targetEntity = TaskEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<TaskEntity> taskEntityList;
}