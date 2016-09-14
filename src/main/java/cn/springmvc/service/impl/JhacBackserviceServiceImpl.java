package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacBackserviceMapper;
import cn.springmvc.model.JhacBackservice;
import cn.springmvc.service.JhacBackserviceService;

@Service
public class JhacBackserviceServiceImpl implements JhacBackserviceService {

	@Autowired
	private JhacBackserviceMapper dao;

	public void insert(JhacBackservice t) {
		dao.insert(t);
	}

	public void update(JhacBackservice t) {
		dao.update(t);
	}

	public List<JhacBackservice> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacBackservice find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
