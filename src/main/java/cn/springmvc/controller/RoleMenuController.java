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

import cn.springmvc.model.JhacAdmin;
import cn.springmvc.model.Role;
import cn.springmvc.model.RoleMenu;
import cn.springmvc.model.RoleMenuApi;
import cn.springmvc.service.RoleMenuService;
import cn.springmvc.service.RoleService;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/admin/roleMenu")
public class RoleMenuController {

	@Autowired
	private RoleMenuService service;

	@Autowired
	private RoleService roleService;

	@RequestMapping("/query")
	public ModelAndView query(HttpServletRequest request) {
		String roleId = request.getParameter("roleId");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> rList = roleService.query(map);
		SessionUtil<JhacAdmin> su = new SessionUtil<JhacAdmin>();
		JhacAdmin admin = su.getSession(request, "jhacAdmin");
		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("roleId", roleId);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<RoleMenu> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("rList", rList);
		context.put("list", list);
		context.put("jhacAdmin", admin);
		context.put("pageCount", pageCount);
		context.put("roleId", roleId);
		return new ModelAndView("admin/role_menu", context);
	}

	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		service.delete(Integer.parseInt(id));
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request, RoleMenu menu) {

		if (!StringUtils.isEmpty(menu.getRmId())) {
			service.update(menu);
		} else {
			service.insert(menu);
		}
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping(value = "/addRoleMenu", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject addRoleMenu(HttpServletRequest request) {

		JSONObject data = new JSONObject();
		try {
			int roleId = Integer.parseInt(request.getParameter("roleId"));
			String rmMenuIds = request.getParameter("rmMenuIds");
			String[] menuIds = rmMenuIds.split(",");
			JSONArray roleMenuLsit = new JSONArray();
			RoleMenu menu = null;
			if (StringUtils.isEmpty(rmMenuIds)) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("roleId", roleId);
				map.put("roleMenuLsit", roleMenuLsit);
				service.deleteByMap(map);
			} else {
				if (menuIds.length > 0) {
					for (String s : menuIds) {
						menu = new RoleMenu();
						menu.setRmRoleId(roleId);
						menu.setRmMenuId(Integer.parseInt(s));
						roleMenuLsit.add(menu);
					}
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("roleId", roleId);
				map.put("roleMenuLsit", roleMenuLsit);

				service.deleteByMap(map);
				service.insertList(map);
			}

			data.put("success", "0");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "/queryMenu", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject queryMenu(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", request.getParameter("roleId"));
		List<RoleMenuApi> list = service.queryMenu(map);
		data.put("data", list);
		return data;
	}
}
