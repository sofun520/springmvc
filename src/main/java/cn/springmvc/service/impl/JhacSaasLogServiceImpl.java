package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacSaasLogMapper;
import cn.springmvc.model.JhacSaasLog;
import cn.springmvc.service.JhacSaasLogService;

@Service
public class JhacSaasLogServiceImpl implements JhacSaasLogService {

	@Autowired
	private JhacSaasLogMapper dao;

	public void insert(JhacSaasLog t) {
		dao.insert(t);
	}

	public void update(JhacSaasLog t) {
		dao.update(t);
	}

	public List<JhacSaasLog> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacSaasLog find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
