package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacAdmin;
import cn.springmvc.model.Role;
import cn.springmvc.service.RoleService;
import cn.springmvc.util.SessionUtil;

@Controller
@RequestMapping("/admin/role")
public class JhacRoleController {

	@Autowired
	private RoleService service;

	@RequestMapping("/query")
	public ModelAndView query(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		SessionUtil<JhacAdmin> su = new SessionUtil<JhacAdmin>();
		JhacAdmin admin = su.getSession(request, "jhacAdmin");
		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 11;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<Role> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("jhacAdmin", admin);
		context.put("pageCount", pageCount);
		return new ModelAndView("admin/role", context);
	}

	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		service.delete(Integer.parseInt(id));
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request, Role role) {
		if (!StringUtils.isEmpty(role.getRoleId())) {
			service.update(role);
		} else {
			service.insert(role);
		}
		return new ModelAndView("redirect:query.do");
	}

}
