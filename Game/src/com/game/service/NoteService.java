package com.game.service;

import com.game.model.Page;
import com.game.mapper.NoteMapper;
import com.game.model.Note;
import com.game.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class NoteService{

        @Autowired
        private NoteMapper mapper;

        public Integer save(Note note){
			return mapper.save(note);
        }
        
        public void update(Note note){
			mapper.update(note);
        }
        
        public void deleteById(Integer id){
			mapper.deleteById(id);
        }
        
        public int queryByCount(Note note){
			return mapper.queryByCount(note);
        }
		
        public List<Note> queryByList(Page page, Note note){
			String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
		    paramsMap.put("title", note.getTitle());
		    paramsMap.put("content", note.getContent());
		    paramsMap.put("user", note.getUser());
		    paramsMap.put("date", note.getDate());
		    paramsMap.put("pageQueryCondition", pageQueryCondition);
			return mapper.queryByList(paramsMap);
        }
		
        public List<Note> queryByNote(Note note){
			return mapper.queryByNote(note);
        }
		
        public Note queryById(Integer id){
			return mapper.queryById(id);
        }
}
