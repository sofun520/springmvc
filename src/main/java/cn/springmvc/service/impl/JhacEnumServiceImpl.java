package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacEnumMapper;
import cn.springmvc.model.JhacEnum;
import cn.springmvc.service.JhacEnumService;

@Service
public class JhacEnumServiceImpl implements JhacEnumService {

	@Autowired
	private JhacEnumMapper dao;

	public void insert(JhacEnum t) {
		dao.insert(t);
	}

	public void update(JhacEnum t) {
		dao.update(t);
	}

	public List<JhacEnum> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacEnum find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public List<JhacEnum> queryGroup(Map<String, Object> map) {
		return dao.queryGroup(map);
	}

}
