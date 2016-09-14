package cn.springmvc.controller;

import java.util.Date;
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

import cn.springmvc.model.JhacEnum;
import cn.springmvc.model.JhacProductClass;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacEnumService;
import cn.springmvc.service.JhacProductClassService;
import cn.springmvc.util.SessionUtil;

@Controller
public class ProductClassController {

	@Autowired
	private JhacProductClassService service;

	@Autowired
	private JhacEnumService enumService;

	@RequestMapping("/mvc/productclass/query")
	public ModelAndView query(HttpServletRequest request, JhacProductClass pc) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM004");
		List<JhacEnum> enumList = enumService.query(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("pNetwork", user.getuNetworkCode());

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacProductClass> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("enumList", enumList);
		context.put("pc", pc);
		return new ModelAndView("productclass/query", context);
	}

	@RequestMapping("/mvc/productclass/save")
	public ModelAndView save(HttpServletRequest request, JhacProductClass pc) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		if (StringUtils.isEmpty(pc.getPcId())) {
			pc.setPcCreateDate(new Date());
			pc.setPcCreateId(user.getuId());
			service.insert(pc);
		} else {
			pc.setPcUpdateDate(new Date());
			pc.setPcUpdateId(user.getuId());
			service.update(pc);
		}
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping(value = "/api/productclass/find", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject find(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		String id = request.getParameter("id");
		JhacProductClass pc = service.find(Integer.parseInt(id));
		data.put("data", pc);
		return data;
	}

}
