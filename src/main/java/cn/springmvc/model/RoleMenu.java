package cn.springmvc.model;

public class RoleMenu {
	private Integer rmId;

	private Integer rmRoleId;

	private Integer rmMenuId;

	private Role role;

	private Menu menu;

	/**
	 * @return the role
	 */
	public Role getRole() {
		return role;
	}

	/**
	 * @param role
	 *            the role to set
	 */
	public void setRole(Role role) {
		this.role = role;
	}

	/**
	 * @return the menu
	 */
	public Menu getMenu() {
		return menu;
	}

	/**
	 * @param menu
	 *            the menu to set
	 */
	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Integer getRmId() {
		return rmId;
	}

	public void setRmId(Integer rmId) {
		this.rmId = rmId;
	}

	public Integer getRmRoleId() {
		return rmRoleId;
	}

	public void setRmRoleId(Integer rmRoleId) {
		this.rmRoleId = rmRoleId;
	}

	public Integer getRmMenuId() {
		return rmMenuId;
	}

	public void setRmMenuId(Integer rmMenuId) {
		this.rmMenuId = rmMenuId;
	}
}