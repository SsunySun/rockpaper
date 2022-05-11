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
 * Relation Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_RELATION")
@ApiModel(description = "Relation 객체")
public class RelationEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "TAB")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "tab_id", nullable = false)
	@ApiModelProperty(position = 8, value = "테이블 ID", example = "TAB_ENTITY")
	private String tabId;

	@JsonIgnore
	@ManyToOne(targetEntity = TableEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="tab_id", nullable = false, insertable = false, updatable = false)	// "테이블 ID"
	private TableEntity tableEntity;

	@Column(name = "query", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 9, value = "Query")
	private String query;

	@Column(name = "config", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 10, value = "Config")
	private String config;
}