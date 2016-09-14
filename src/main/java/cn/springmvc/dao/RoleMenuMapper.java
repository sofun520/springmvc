package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.RoleMenu;
import cn.springmvc.model.RoleMenuApi;

public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

	void insertList(Map<String, Object> map);

	void deleteByMap(Map<String, Object> map);

	List<RoleMenuApi> queryMenu(Map<String, Object> map);
}