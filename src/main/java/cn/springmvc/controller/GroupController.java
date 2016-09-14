package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacGroup;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacGroupService;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONObject;

@Controller
public class GroupController {

	@Autowired
	private JhacGroupService service;

	@RequestMapping("/mvc/group/save")
	public ModelAndView save(HttpServletRequest request, JhacGroup group) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		if (!StringUtils.isEmpty(group.getgId())) {
			group.setgUpdateId(user.getuId());
			service.update(group);
		} else {
			group.setgAddId(user.getuId());
			group.setgUpdateId(user.getuId());
			service.insert(group);
		}
		return new ModelAndView("redirect:../company/query.do");
	}

	@RequestMapping("/api/group/query")
	@ResponseBody
	public JSONObject query(HttpServletRequest request, JhacGroup group) {
		JSONObject data = new JSONObject();
		List<JhacGroup> list = service.query(new HashMap<String, Object>());
		data.put("data", list);
		return data;
	}

}
