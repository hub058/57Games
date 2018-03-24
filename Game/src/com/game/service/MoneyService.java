package com.game.service;

import com.game.model.Page;
import com.game.mapper.MoneyMapper;
import com.game.model.Money;
import com.game.service.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class MoneyService{

        @Autowired
        private MoneyMapper mapper;

        public Integer save(Money money){
			return mapper.save(money);
        }
        
        public void update(Money money){
			mapper.update(money);
        }
        
        public void deleteById(Integer id){
			mapper.deleteById(id);
        }
        
        public int queryByCount(Money money){
			return mapper.queryByCount(money);
        }
		
        public List<Money> queryByList(Page page, Money money){
			String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
		    paramsMap.put("name", money.getName());
		    paramsMap.put("money", money.getMoney());
		    paramsMap.put("pageQueryCondition", pageQueryCondition);
			return mapper.queryByList(paramsMap);
        }
		
        public List<Money> queryByMoney(Money money){
			return mapper.queryByMoney(money);
        }
		
        public Money queryById(Integer id){
			return mapper.queryById(id);
        }
}
