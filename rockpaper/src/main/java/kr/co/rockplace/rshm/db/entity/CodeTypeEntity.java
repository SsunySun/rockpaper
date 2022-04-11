package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

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
 * Code Type Entity 
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_CODE_TYPE")
@ApiModel(description = "Code Type 객체")
public class CodeTypeEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "hierarchy", nullable = false)
	@ApiModelProperty(position = 7, value = "계층 여부", example = "false")
	private boolean isHierarchy;

	@JsonIgnore
	@OneToMany(mappedBy = "ctyId", targetEntity = CodeEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@OrderBy("order_by asc")
	private List<CodeEntity> codeEntityList;
}