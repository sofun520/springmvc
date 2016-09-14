package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacProductClassMapper;
import cn.springmvc.model.JhacProductClass;
import cn.springmvc.service.JhacProductClassService;

@Service
public class JhacProductClassServiceImpl implements JhacProductClassService {

	@Autowired
	private JhacProductClassMapper dao;

	public void insert(JhacProductClass t) {
		dao.insert(t);
	}

	public void update(JhacProductClass t) {
		dao.update(t);
	}

	public List<JhacProductClass> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacProductClass find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
