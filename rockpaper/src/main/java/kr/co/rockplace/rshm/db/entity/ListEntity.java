package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

/**
 * List Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_LIST")
@ApiModel(description = "List 객체")
public class ListEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "query", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 7, value = "Query")
	private String query;

	@Column(name = "config", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 8, value = "Config")
	private String config;

	@Column(name = "script", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 9, value = "Script")
	private String script;
}