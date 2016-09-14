package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.Menu;

public interface MenuMapper extends BaseMapper<Menu> {

	List<Menu> queryFmenus(Map<String, Object> map);

	List<Menu> selfMenu(Map<String, Object> map);

	List<Menu> notSelfMenu(Map<String, Object> map);

	List<Menu> userMenuQuery(Map<String, Object> map);
}