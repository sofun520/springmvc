package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacNetworkMapper;
import cn.springmvc.model.JhacNetwork;
import cn.springmvc.service.JhacNetworkService;

@Service
public class JhacNetworkServiceImpl implements JhacNetworkService {

	@Autowired
	private JhacNetworkMapper dao;

	public void insert(JhacNetwork t) {
		dao.insert(t);
	}

	public void update(JhacNetwork t) {
		dao.update(t);
	}

	public List<JhacNetwork> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacNetwork find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public List<JhacNetwork> notCreateSaas(Map<String, Object> map) {
		return dao.notCreateSaas(map);
	}

}
