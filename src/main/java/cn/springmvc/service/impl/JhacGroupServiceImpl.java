package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacGroupMapper;
import cn.springmvc.model.JhacGroup;
import cn.springmvc.service.JhacGroupService;

@Service
public class JhacGroupServiceImpl implements JhacGroupService {

	@Autowired
	private JhacGroupMapper dao;

	public void insert(JhacGroup t) {
		dao.insert(t);
	}

	public void update(JhacGroup t) {
		dao.update(t);
	}

	public List<JhacGroup> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacGroup find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
