package kr.co.rockplace.rshm.db.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
 * Menu Entity
 * @author wonsunlee
 *
 */
@Cacheable(true)
@SuperBuilder
@Getter
@Setter
//@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Entity(name = "TAB_MENU")
@ApiModel(description = "Menu 객체")
public class MenuEntity extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "pid", nullable = true)
	@ApiModelProperty(position = 7, value = "상위 메뉴 ID", example = "")
	private String pid;

	@JsonIgnore
	@ManyToOne(targetEntity = MenuEntity.class, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name="pid", nullable = true, insertable = false, updatable = false)
	private MenuEntity pidMenuEntity;

	@JsonIgnore
	@OneToMany(mappedBy = "pidMenuEntity", targetEntity = MenuEntity.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@Where(clause = "used = true")
	@OrderBy("order_by asc")
	private List<MenuEntity> pidMenuEntityList;

	@Column(name = "level", nullable = true)
	@ApiModelProperty(position = 8, value = "레벨", example = "")
	private int level;

	@Column(name = "url", nullable = true)
	@ApiModelProperty(position = 9, value = "URL", example = "")
	private String url;

	@Column(name = "icon", nullable = true)
	@Enumerated(value = EnumType.ORDINAL)
	@ApiModelProperty(position = 12, value = "Menu Icon", example = "0")
	private MenuIconEnum menuIcon;

	@Column(name = "aside", nullable = true)
	@ApiModelProperty(position = 13, value = "Aside 여부", example = "true")
	private boolean isAside;

	@Column(name = "new", nullable = true)
	@ApiModelProperty(position = 14, value = "새창 여부", example = "false")
	private boolean isNew;

	@Column(name = "leader", nullable = false)
	@ApiModelProperty(position = 15, value = "팀장 여부", example = "false")
	private boolean isLeader;

	@Column(name = "admin", nullable = false)
	@ApiModelProperty(position = 16, value = "관리자 여부", example = "false")
	private boolean isAdmin;
}