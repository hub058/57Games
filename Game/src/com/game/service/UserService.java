package com.game.service;

import com.game.model.Page;
import com.game.mapper.UserMapper;
import com.game.model.User;
import com.game.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class UserService{

        @Autowired
        private UserMapper mapper;

        public Integer save(User user){
			return mapper.save(user);
        }
        
        public void update(User user){
			mapper.update(user);
        }
        
        public void deleteById(Integer id){
			mapper.deleteById(id);
        }
        
        public int queryByCount(User user){
			return mapper.queryByCount(user);
        }
		
        public List<User> queryByList(Page page, User user){
			String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
		    paramsMap.put("name", user.getName());
		    paramsMap.put("pass", user.getPass());
		    paramsMap.put("status", user.getStatus());
		    paramsMap.put("pageQueryCondition", pageQueryCondition);
			return mapper.queryByList(paramsMap);
        }
		
        public List<User> queryByUser(User user){
			return mapper.queryByUser(user);
        }
		
        public User queryById(Integer id){
			return mapper.queryById(id);
        }
}
