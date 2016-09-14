package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacCarMapper;
import cn.springmvc.model.JhacCar;
import cn.springmvc.service.JhacCarService;

@Service
public class JhacCarServiceImpl implements JhacCarService {

	@Autowired
	private JhacCarMapper dao;

	public void insert(JhacCar t) {
		dao.insert(t);
	}

	public void update(JhacCar t) {
		dao.update(t);
	}

	public List<JhacCar> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacCar find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
