package com.game.mapper;

import java.util.*;
import com.game.model.User;

/**
 * Created By FeastCoding.
 */
public interface UserMapper{
    public Integer save(User model);

    public void update(User model);

    public void deleteById(Integer id);

    public int queryByCount(User model);

    public List<User> queryByList(Map paramsMap);
	
	public List<User> queryByUser(User model);

    public User queryById(Integer id);
}