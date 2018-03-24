package com.game.mapper;

import java.util.*;
import com.game.model.Note;

/**
 * Created By FeastCoding.
 */
public interface NoteMapper{
    public Integer save(Note model);

    public void update(Note model);

    public void deleteById(Integer id);

    public int queryByCount(Note model);

    public List<Note> queryByList(Map paramsMap);
	
	public List<Note> queryByNote(Note model);

    public Note queryById(Integer id);
}