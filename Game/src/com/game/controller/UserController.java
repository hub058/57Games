package com.game.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.record.UseSelFSRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.game.model.User;
import com.game.model.Page;
import com.game.service.UserService;
import com.game.util.PageUtils;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("queryUserBypage.do")
	public String queryUserBypage(User user,Page page,ModelMap model){
		page.setMaxRows(5);
		List<User> list = userService.queryByUser(user);
		page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
		page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
		List<User> userList = userService.queryByList(page, user);
		model.put("page", page);
		model.put("userList", userList);
		model.put("user", user);
		return "behind/user_list";
	}
	
	@RequestMapping("addUser.do")
	public String addUser(User user,HttpServletRequest request){
		userService.save(user);
		return "redirect:/queryUserBypage.do";
	}
	
	
	@RequestMapping("editUser.do")
	public String editUser(User user,ModelMap model){
		user = userService.queryById(user.getId());
		if(user.getStatus() == 3){
			model.put("mes", "管理员不能修改");
			return "forward:/queryUserBypage.do";
		}else{
			model.put("user", user);
			return "behind/user_edit";
		}
	}
	
	@RequestMapping("updateUser.do")
	public String updateUser(User user,HttpServletRequest request){
		userService.update(user);
		return "redirect:/queryUserBypage.do";
	}
	
	@RequestMapping("deleteUserByid.do")
	public String deleteUserByid(User user, ModelMap model){
		user = userService.queryById(user.getId());
		if(user.getStatus() == 3){
			model.put("mes", "管理员不能删除");
			return "forward:/queryUserBypage.do";
		}else{
			userService.deleteById(user.getId());
			return "redirect:/queryUserBypage.do";
		}
	}
	
	@RequestMapping("login.do")
	public String login(User user,ModelMap model, HttpSession session){
		if(user.getName().equals("") || user.getPass().equals("")){
			model.put("mes", "用户名或密码不能为空");
			return "behind/login";
		}
		List<User> userList = userService.queryByUser(user);
		if(userList.size() > 0){
			session.setAttribute("user", userList.get(0));
			return "behind/index";
		}else{
			model.put("mes", "用户名或密码错误");
			return "behind/login";
		}
	}
	
	@RequestMapping("regist.do")
	public String regist(User user,ModelMap model, HttpSession session){
		User u = new User();
//		u.setName(user.getName());
//		u.setPhone(user.getPhone());
//		u.setMail(user.getMail());
//		u.setRealname(user.getRealname());
//		u.setIdnumber(user.getIdnumber());
		List<User> userList = userService.queryByUser(u);
		if(userList.size() > 0){
			model.put("mes", "用户名已存在");
			return "behind/regist";
		}else{
			user.setStatus(1);
			userService.save(user);
			model.put("mes", "注册成功");
			return "behind/regist";
		}
	}
	
	@RequestMapping("updateUserPass.do")
	public String updateUserPass(User user,ModelMap model,HttpSession session){
		userService.update(user);
		session.setAttribute("user", user);
		model.put("mes", "修改成功");
		return "behind/user";
	}
}
