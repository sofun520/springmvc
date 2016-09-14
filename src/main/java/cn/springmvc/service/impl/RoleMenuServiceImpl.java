package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.RoleMenuMapper;
import cn.springmvc.model.RoleMenu;
import cn.springmvc.model.RoleMenuApi;
import cn.springmvc.service.RoleMenuService;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {

	@Autowired
	private RoleMenuMapper dao;

	public void insert(RoleMenu t) {
		dao.insert(t);
	}

	public void update(RoleMenu t) {
		dao.update(t);
	}

	public List<RoleMenu> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public RoleMenu find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public void insertList(Map<String, Object> map) {
		dao.insertList(map);
	}

	public void deleteByMap(Map<String, Object> map) {
		dao.deleteByMap(map);
	}

	public List<RoleMenuApi> queryMenu(Map<String, Object> map) {
		return dao.queryMenu(map);
	}

}
