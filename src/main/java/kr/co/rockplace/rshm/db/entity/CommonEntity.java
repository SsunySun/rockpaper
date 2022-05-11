package kr.co.rockplace.rshm.db.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * Common Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@ApiModel(description = "Common 객체")
public abstract class CommonEntity {

	@Id
	@Column(name = "id")
	@ApiModelProperty(position = 1, value = "ID", example = "")
	protected String id;

	@Column(name = "name", nullable = false)
	@ApiModelProperty(position = 2, value = "이름", example = "name")
	protected String name;

	@Column(name = "label", nullable = true)
	@ApiModelProperty(position = 3, value = "라벨", example = "label")
	protected String label;

	@Column(name = "descr", nullable = true, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 4, value = "설명", example = "descr")
	protected String descr;

	@Column(name = "used", nullable = false)
	@ApiModelProperty(position = 5, value = "사용 여부", example = "true")
	protected boolean isUsed;

	@Column(name = "order_by", nullable = false)
	@ApiModelProperty(position = 6, value = "순서", example = "1")
	protected int orderBy;

	@Column(name = "create_date", nullable = false)
	@ApiModelProperty(position = 99, value = "등록시간", hidden = true)
	protected LocalDateTime createDate;

	@Column(name = "create_emp_id", nullable = false)
	@ApiModelProperty(position = 99, value = "등록자", hidden = true)
	protected String createEmpId;

	@Column(name = "update_date", nullable = true)
	@ApiModelProperty(position = 99, value = "수정시간", hidden = true)
	protected LocalDateTime updateDate;

	@Column(name = "update_emp_id", nullable = true)
	@ApiModelProperty(position = 99, value = "수정자", hidden = true)
	protected String updateEmpId;
}