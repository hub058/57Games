package com.game.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.game.model.Money;
import com.game.model.Page;
import com.game.model.User;
import com.game.service.MoneyService;
import com.game.service.UserService;
import com.game.util.PageUtils;

@Controller
public class MoneyController {
	@Autowired
	private MoneyService moneyService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("recharge.do")
	public String recharge(Money money, ModelMap model){
		User user = new User();
		user.setName(money.getName());
		List<User> uList = userService.queryByUser(user);
		if(uList.size() == 0 ){
			model.put("mes", "用户不存在");
			return "behind/total";
		}
		if(money.getMoney() % 10 != 0){
			model.put("mes", "充值金额必须是10的整数倍");
			return "behind/total";
		}
		moneyService.save(money);
		user = uList.get(0);
		if(user.getTotalrecharge() == null){
			user.setTotalrecharge(money.getMoney());
		}else{
			user.setTotalrecharge(user.getTotalrecharge() + money.getMoney());
		}
		userService.update(user);
		model.put("mes", "充值成功");
		return "behind/total";
	}
}
