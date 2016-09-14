package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacUserMapper;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacUserService;

@Service
public class JhacUserServiceImpl implements JhacUserService {

	@Autowired
	private JhacUserMapper dao;

	public void insert(JhacUser t) {
		dao.insert(t);
	}

	public void update(JhacUser t) {
		dao.update(t);
	}

	public List<JhacUser> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacUser find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
