package com.game.mapper;

import java.util.*;
import com.game.model.Money;

/**
 * Created By FeastCoding.
 */
public interface MoneyMapper{
    public Integer save(Money model);

    public void update(Money model);

    public void deleteById(Integer id);

    public int queryByCount(Money model);

    public List<Money> queryByList(Map paramsMap);
	
	public List<Money> queryByMoney(Money model);

    public Money queryById(Integer id);
}