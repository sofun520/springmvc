package cn.springmvc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacUserService;
import cn.springmvc.util.MD5Util;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONObject;

@Controller
// @RequestMapping("/")
public class JhacUserController {

	@Autowired
	private JhacUserService service;

	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(HttpServletRequest request) {
		JSONObject re = new JSONObject();
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");

		if (code.equals(session.getAttribute("code"))) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("uName", username);
			map.put("uPassword", MD5Util.md5(password));
			List<JhacUser> list = service.query(map);
			if (list.size() > 0) {
				re.put("success", "0");
				re.put("message", "登录成功");
				JhacUser user = list.get(0);
				user.setuLastloginTime(new Date());
				service.update(user);
				session.setAttribute("user", user);
			} else {
				re.put("success", "1");
				re.put("message", "登录失败，用户名或密码错误");
			}
		} else {
			re.put("success", "1");
			re.put("message", "登录失败，验证码错误");
		}
		return re.toJSONString();
	}

	@RequestMapping(value = "/registeDo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject registeDo(HttpServletRequest request, JhacUser user) {
		JSONObject data = new JSONObject();
		try {
			user.setuPassword(MD5Util.md5(user.getuPassword()));
			user.setuRegisterTime(new Date());
			service.insert(user);
			data.put("success", "0");
			data.put("message", "注册成功");
		} catch (Exception ex) {
			ex.printStackTrace();
			data.put("success", "1");
			data.put("message", "注册失败，系统错误");
		}
		return data;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		return new ModelAndView("redirect:login.do");
	}

	@RequestMapping("/mvc/main")
	public ModelAndView main(HttpServletRequest request) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		return new ModelAndView("main", map);
	}

}
