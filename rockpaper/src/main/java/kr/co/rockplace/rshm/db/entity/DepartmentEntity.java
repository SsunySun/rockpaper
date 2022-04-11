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
 * Department Entity 
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_DEPT")
@ApiModel(description = "Department 객체")
public class DepartmentEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "org_id", nullable = false)
	@ApiModelProperty(position = 7, value = "조직 ID", example = "ORG00001")
	private String orgId;

	@JsonIgnore
	@ManyToOne(targetEntity = OrganizationEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="org_id", nullable = false, insertable = false, updatable = false)	// "조직 ID"
	private OrganizationEntity organizationEntity;

	@Column(name = "pid", nullable = true)
	@ApiModelProperty(position = 8, value = "상위 부서 ID", example = "")
	private String pid;

	@JsonIgnore
	@OneToOne(targetEntity = DepartmentEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="pid", nullable = true, insertable = false, updatable = false)
	private DepartmentEntity parentDepartmentEntity;

	@JsonIgnore
	@OneToMany(mappedBy = "parentDepartmentEntity", targetEntity = DepartmentEntity.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@OrderBy("order_by asc")
	private List<DepartmentEntity> subDepartmentEntityList;

	@Column(name = "level", nullable = true)
	@ApiModelProperty(position = 9, value = "레벨", example = "1")
	private int level;

	@JsonIgnore
	@OneToMany(mappedBy = "dptId", targetEntity = EmployeeEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("name asc")
	private List<EmployeeEntity> employeeEntityList;
}