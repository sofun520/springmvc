package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.springmvc.model.JhacAdmin;
import cn.springmvc.service.JhacAdminService;
import cn.springmvc.service.SmsService;
import cn.springmvc.util.MD5Util;

import com.alibaba.fastjson.JSONObject;

@Controller
public class JhacAdminController {

	@Autowired
	private JhacAdminService service;

	@Autowired
	private SmsService smsService;

	@RequestMapping(value = "/adminLoginProcess", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(HttpServletRequest request) {
		JSONObject re = new JSONObject();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adminUsername", username);
		map.put("adminPassword", MD5Util.md5(password));
		List<JhacAdmin> list = service.query(map);
		if (list.size() > 0) {
			re.put("success", "0");
			re.put("message", "登录成功");
			JhacAdmin admin = list.get(0);
			HttpSession session = request.getSession();
			session.setAttribute("jhacAdmin", admin);
		} else {
			re.put("success", "1");
			re.put("message", "登录失败，用户名或密码错误");
		}
		return re.toJSONString();
	}

	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("jhacAdmin");
			session.invalidate();
			response.sendRedirect("../adminLogin.do");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@RequestMapping(value = "/smsCode/send", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sendCode(HttpServletRequest request,
			HttpServletResponse response) {

		// int ran = (int) (Math.random() * 9000) + 1000;
		// String a = smsService.sendCode("18694054311", String.valueOf(ran));
		String code = request.getParameter("code");
		String a = smsService.sendCode("18694054311", code);
		return a;
	}
}
