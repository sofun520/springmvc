package cn.springmvc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.springmvc.model.JhacOrderDetail;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacOrderDetailService;
import cn.springmvc.service.MaxCodeService;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONObject;

@Controller
public class OrderDetailController {

	@Autowired
	private JhacOrderDetailService service;

	@Autowired
	private MaxCodeService codeService;

	@RequestMapping(value = "/api/orderdetail/save", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject save(HttpServletRequest request, JhacOrderDetail od) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		JSONObject data = new JSONObject();
		od.setOdCreateId(user.getuId());
		od.setOdCreateTime(new Date());

		service.insert(od);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("odOrderId", od.getOdOrderId());
		List<JhacOrderDetail> list = service.query(map);
		data.put("data", list);
		return data;
	}

	@RequestMapping(value = "/api/orderdetail/delete", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject delete(HttpServletRequest request, JhacOrderDetail od) {
		JSONObject data = new JSONObject();
		int id = Integer.parseInt(request.getParameter("id"));
		service.delete(id);
		data.put("success", "0");
		data.put("message", "删除成功");
		return data;
	}

	@RequestMapping(value = "/api/orderdetail/query", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject query(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("odOrderId", request.getParameter("odOrderId"));
		List<JhacOrderDetail> list = service.query(map);
		data.put("data", list);
		return data;
	}
}
