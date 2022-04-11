package kr.co.rockplace.rshm.db.entity;

import java.time.LocalDate;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

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
 * Employee Entity 
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_EMPLOYEE")
@ApiModel(description = "Employee 객체")
public class EmployeeEntity extends CommonEntity implements UserDetails {

	private static final long serialVersionUID = 1L;

	@Column(name = "org_id", nullable = false)
	@ApiModelProperty(position = 7, value = "조직 ID", example = "ORG00001")
	private String orgId;

	@JsonIgnore
	@ManyToOne(targetEntity = OrganizationEntity.class, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name="org_id", nullable = false, insertable = false, updatable = false)	// "조직 ID"
	private OrganizationEntity organizationEntity;

	@Column(name = "dpt_id", nullable = false)
	@ApiModelProperty(position = 8, value = "부서 ID", example = "DPT00001")
	private String dptId;

	@JsonIgnore
	@ManyToOne(targetEntity = DepartmentEntity.class, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name="dpt_id", nullable = false, insertable = false, updatable = false)	// "부서 ID"
	private DepartmentEntity departmentEntity;

	@Column(name = "number", nullable = false)
	@ApiModelProperty(position = 9, value = "사번", example = "RP-1")
	private String number;

	@Column(name = "hphone", nullable = true)
	@ApiModelProperty(position = 10, value = "연락처", example = "010-0000-0000")
	private String hphone;

	@Column(name = "job_tel", nullable = true)
	@ApiModelProperty(position = 11, value = "회사 연락처", example = "070-0000-0000")
	private String jobTel;

	@Column(name = "position_cd", nullable = true)
	@ApiModelProperty(position = 12, value = "직급", example = "POSITION_ROCKPLACE_10001")
	private String positionCd;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="position_cd", nullable = false, insertable = false, updatable = false)	// "직급"
	private CodeEntity positionCodeEntity;

	@Column(name = "duty_position_cd", nullable = true)
	@ApiModelProperty(position = 13, value = "직책", example = "DUTY_POSITION_ROCKPLACE_10001")
	private String dutyPositionCd;

	@JsonIgnore
	@ManyToOne(targetEntity = CodeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="duty_position_cd", nullable = false, insertable = false, updatable = false)	// "직책"
	private CodeEntity dutyPositionCodeEntity;

	@Column(name = "mgr_emp_id", nullable = true)
	@ApiModelProperty(position = 14, value = "관리자 ID", example = "admin")
	private String mgrEmpId;

	@JsonIgnore
	@OneToOne(targetEntity = EmployeeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="mgr_emp_id", nullable = true, insertable = false, updatable = false)	// "관리자 ID"
	private EmployeeEntity mgrEmployeeEntity;

	@Column(name = "mail_used", nullable = true)
	@ApiModelProperty(position = 15, value = "이메일 발송 여부", example = "true")
	private boolean isMailUsed;

	@Column(name = "agc_emp_id", nullable = true)
	@ApiModelProperty(position = 16, value = "대직자 ID", example = "admin")
	private String agcEmpId;

	@JsonIgnore
	@OneToOne(targetEntity = EmployeeEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="agc_emp_id", nullable = true, insertable = false, updatable = false)	// "대직자 ID"
	private EmployeeEntity agcEmployeeEntity;

	@Column(name = "agc_start_date", nullable = true)
	@ApiModelProperty(position = 17, value = "대직 시작일", example = "2021-06-01")
	private LocalDate agcStartDate;

	@Column(name = "agc_end_date", nullable = true)
	@ApiModelProperty(position = 18, value = "대직 종료일", example = "2021-06-05")
	private LocalDate agcEndDate;

	@Column(name = "passwd", nullable = true)
	@ApiModelProperty(position = 19, value = "암호", example = "")
	private String passwd;

	@Transient
	private Collection<SimpleGrantedAuthority> authorities;

	@Override
	public String getPassword() {
		return this.passwd;
	}

	@Override
	public String getUsername() {
		return this.name;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}