package cn.springmvc.service;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.RoleMenu;
import cn.springmvc.model.RoleMenuApi;

public interface RoleMenuService extends BaseService<RoleMenu> {

	void insertList(Map<String, Object> map);

	void deleteByMap(Map<String, Object> map);

	List<RoleMenuApi> queryMenu(Map<String, Object> map);

}
