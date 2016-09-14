package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacApiMapper;
import cn.springmvc.model.JhacApi;
import cn.springmvc.service.JhacApiService;

@Service
public class JhacApiServiceImpl implements JhacApiService {

	@Autowired
	private JhacApiMapper dao;

	public void insert(JhacApi t) {
		dao.insert(t);
	}

	public void update(JhacApi t) {
		dao.update(t);
	}

	public List<JhacApi> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacApi find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
