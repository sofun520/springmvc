package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.springmvc.model.JhacAdmin;
import cn.springmvc.model.Menu;
import cn.springmvc.service.MenuService;
import cn.springmvc.util.SessionUtil;

@Controller
// @RequestMapping("/admin/menu")
public class MenuController {

	@Autowired
	private MenuService service;

	@RequestMapping("/admin/menu/query")
	public ModelAndView query(HttpServletRequest request) {
		String menuParent = request.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Menu> fmenus = service.queryFmenus(map);

		SessionUtil<JhacAdmin> su = new SessionUtil<JhacAdmin>();
		JhacAdmin admin = su.getSession(request, "jhacAdmin");
		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 11;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("menuParent", menuParent);
		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<Menu> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("jhacAdmin", admin);
		context.put("pageCount", pageCount);
		context.put("fmenus", fmenus);
		context.put("menuParent", menuParent);
		return new ModelAndView("admin/menu", context);
	}

	@RequestMapping("/admin/menu/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		service.delete(Integer.parseInt(id));
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/admin/menu/save")
	public ModelAndView save(HttpServletRequest request, Menu menu) {
		if (!StringUtils.isEmpty(menu.getMenuId())) {
			service.update(menu);
		} else {
			service.insert(menu);
		}
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping(value = "/admin/menu/selfMenu", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject selfMenu(HttpServletRequest request, Menu menu) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", request.getParameter("roleId"));
		List<Menu> list = service.selfMenu(map);
		for (Menu m : list) {
			if (StringUtils.isEmpty(m.getMenuParent())) {
				m.setMenuName("[一级] " + m.getMenuName());
			} else {
				m.setMenuName("[二级] " + m.getMenuName());
			}
		}
		data.put("data", list);
		return data;
	}

	@RequestMapping(value = "/admin/menu/notSelfMenu", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject notSelfMenu(HttpServletRequest request, Menu menu) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", request.getParameter("roleId"));
		List<Menu> list = service.notSelfMenu(map);
		for (Menu m : list) {
			if (StringUtils.isEmpty(m.getMenuParent())) {
				m.setMenuName("[一级] " + m.getMenuName());
			} else {
				m.setMenuName("[二级] " + m.getMenuName());
			}
		}
		data.put("data", list);
		return data;
	}

	@RequestMapping(value = "/menu/userMenu", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject userMenu(HttpServletRequest request, Menu menu) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", request.getParameter("roleId"));
		map.put("menuParent", request.getParameter("menuParent"));
		List<Menu> list = service.userMenuQuery(map);
		data.put("data", list);
		return data;
	}

}
