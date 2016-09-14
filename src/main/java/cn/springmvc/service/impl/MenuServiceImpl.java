package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.MenuMapper;
import cn.springmvc.model.Menu;
import cn.springmvc.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper dao;

	public void insert(Menu t) {
		dao.insert(t);
	}

	public void update(Menu t) {
		dao.update(t);
	}

	public List<Menu> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public Menu find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public List<Menu> queryFmenus(Map<String, Object> map) {
		return dao.queryFmenus(map);
	}

	public List<Menu> selfMenu(Map<String, Object> map) {
		return dao.selfMenu(map);
	}

	public List<Menu> notSelfMenu(Map<String, Object> map) {
		return dao.notSelfMenu(map);
	}

	public List<Menu> userMenuQuery(Map<String, Object> map) {
		return dao.userMenuQuery(map);
	}

}
