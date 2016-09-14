package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacSaasMapper;
import cn.springmvc.model.JhacSaas;
import cn.springmvc.service.JhacSaasService;

@Service
public class JhacSaasServiceImpl implements JhacSaasService {

	@Autowired
	private JhacSaasMapper dao;

	public void insert(JhacSaas t) {
		dao.insert(t);
	}

	public void update(JhacSaas t) {
		dao.update(t);
	}

	public List<JhacSaas> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacSaas find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
