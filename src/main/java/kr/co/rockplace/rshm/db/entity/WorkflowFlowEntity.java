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
 * Workflow Flow Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_WFF")
@ApiModel(description = "Workflow Flow 객체")
public class WorkflowFlowEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "SHM")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)
	private EntityEntity entityEntity;

	@Column(name = "src_id", nullable = false)
	@ApiModelProperty(position = 8, value = "원본 티켓 ID", example = "SHM202110-00001")
	private String srcId;

	@Column(name = "src_ent_id", nullable = false)
	@ApiModelProperty(position = 9, value = "원본 티켓 엔티티 ID", example = "SHM")
	private String srcEntId;

	@Column(name = "org_id", nullable = false)
	@ApiModelProperty(position = 10, value = "조직 ID", example = "ORG_ROCKPLACE")
	private String orgId;

	@JsonIgnore
	@ManyToOne(targetEntity = OrganizationEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="org_id", nullable = true, insertable = false, updatable = false)
	private OrganizationEntity organizationEntity;

	@Column(name = "dpt_id", nullable = false)
	@ApiModelProperty(position = 11, value = "부서 ID", example = "DPT_ROCKPLACE")
	private String dptId;

	@JsonIgnore
	@ManyToOne(targetEntity = DepartmentEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="dpt_id", nullable = true, insertable = false, updatable = false)
	private DepartmentEntity departmentEntity;

	@Column(name = "emp_id", nullable = false)
	@ApiModelProperty(position = 12, value = "직원 ID", example = "rshmadmin@rockplace.co.kr")
	private String empId;

	@JsonIgnore
	@ManyToOne(targetEntity = EmployeeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="emp_id", nullable = true, insertable = false, updatable = false)
	private EmployeeEntity employeeEntity;

	@Column(name = "tas_id", nullable = true)
	@ApiModelProperty(position = 13, value = "테스크 ID", example = "TAS00001")
	private String tasId;

	@JsonIgnore
	@ManyToOne(targetEntity = TaskEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="tas_id", nullable = false, insertable = false, updatable = false)
	private TaskEntity taskEntity;

	@Column(name = "next_tas_id", nullable = true)
	@ApiModelProperty(position = 14, value = "다음 테스크 ID", example = "TAS00002")
	private String nextTasId;

	@JsonIgnore
	@ManyToOne(targetEntity = TaskEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="next_tas_id", nullable = true, insertable = false, updatable = false)
	private TaskEntity nextTaskEntity;
}