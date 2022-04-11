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
 * Form Entity
 * @author wonsunlee
 *
 */
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_FORM")
@ApiModel(description = "Form 객체")
public class FormEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "ent_id", nullable = false)
	@ApiModelProperty(position = 7, value = "엔티티 ID", example = "TAB")
	private String entId;

	@JsonIgnore
	@ManyToOne(targetEntity = EntityEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="ent_id", nullable = false, insertable = false, updatable = false)	// "엔티티 ID"
	private EntityEntity entityEntity;

	@Column(name = "tas_id", nullable = true)
	@ApiModelProperty(position = 9, value = "Task ID", example = "TAS0001")
	private String tasId;

	@JsonIgnore
	@ManyToOne(targetEntity = TaskEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="tas_id", nullable = false, insertable = false, updatable = false)	// "Task ID"
	private TaskEntity taskEntity;

	@Column(name = "config", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 10, value = "설정", example = "config")
	protected String config;

	@Column(name = "script", nullable = false, columnDefinition = "LONGTEXT")
	@ApiModelProperty(position = 11, value = "Script")
	private String script;
}