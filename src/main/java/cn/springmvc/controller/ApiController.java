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
import cn.springmvc.model.JhacApi;
import cn.springmvc.service.JhacApiService;
import cn.springmvc.util.SessionUtil;

@Controller
@RequestMapping("/admin/api")
public class ApiController {

	@Autowired
	private JhacApiService service;

	@RequestMapping("/query")
	public ModelAndView query(HttpServletRequest request, JhacApi api) {
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
		List<JhacApi> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("jhacAdmin", admin);
		context.put("pageCount", pageCount);
		return new ModelAndView("admin/api", context);
	}

	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request, JhacApi api) {
		if (!StringUtils.isEmpty(api.getaId())) {
			service.update(api);
		} else {
			service.insert(api);
		}
		return new ModelAndView("redirect:query.do");
	}

}
