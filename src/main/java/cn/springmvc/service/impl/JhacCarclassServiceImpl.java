package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacCarclassMapper;
import cn.springmvc.model.JhacCarclass;
import cn.springmvc.service.JhacCarclassService;

@Service
public class JhacCarclassServiceImpl implements JhacCarclassService {

	@Autowired
	private JhacCarclassMapper dao;

	public void insert(JhacCarclass t) {
		dao.insert(t);
	}

	public void update(JhacCarclass t) {
		dao.update(t);
	}

	public List<JhacCarclass> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacCarclass find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
