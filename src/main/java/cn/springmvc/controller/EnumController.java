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
import cn.springmvc.model.JhacEnum;
import cn.springmvc.service.JhacEnumService;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONObject;

@Controller
public class EnumController {

	@Autowired
	private JhacEnumService service;

	@RequestMapping(value = "/api/enum/query", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject apiquery(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", request.getParameter("enumCode"));
		List<JhacEnum> list = service.query(map);
		data.put("data", list);
		return data;
	}

	@RequestMapping("/admin/enum/query")
	public ModelAndView query(HttpServletRequest request) {
		String enumCode = request.getParameter("enumCode");
		Map<String, Object> map = new HashMap<String, Object>();
		SessionUtil<JhacAdmin> su = new SessionUtil<JhacAdmin>();
		JhacAdmin admin = su.getSession(request, "jhacAdmin");
		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 11;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("enumCode", enumCode);

		List<JhacEnum> groupList = service.queryGroup(map);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacEnum> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("jhacAdmin", admin);
		context.put("pageCount", pageCount);
		context.put("groupList", groupList);
		context.put("enumCode", enumCode);
		return new ModelAndView("admin/enum", context);
	}

	@RequestMapping("/admin/enum/save")
	public ModelAndView save(HttpServletRequest request, JhacEnum jenum) {
		if (!StringUtils.isEmpty(jenum.getId())) {
			service.update(jenum);
		} else {
			service.insert(jenum);
		}
		return new ModelAndView("redirect:query.do");
	}
}
