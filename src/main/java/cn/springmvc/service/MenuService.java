package cn.springmvc.service;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.Menu;

public interface MenuService extends BaseService<Menu> {

	List<Menu> queryFmenus(Map<String, Object> map);

	List<Menu> selfMenu(Map<String, Object> map);

	List<Menu> notSelfMenu(Map<String, Object> map);

	List<Menu> userMenuQuery(Map<String, Object> map);

}
