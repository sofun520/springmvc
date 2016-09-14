package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacAdminMapper;
import cn.springmvc.model.JhacAdmin;
import cn.springmvc.service.JhacAdminService;

@Service
public class JhacAdminServiceImpl implements JhacAdminService {

	@Autowired
	private JhacAdminMapper dao;

	public void insert(JhacAdmin t) {
		dao.insert(t);
	}

	public void update(JhacAdmin t) {
		dao.update(t);
	}

	public List<JhacAdmin> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacAdmin find(Integer id) {
		return dao.find(id);
	}

}
