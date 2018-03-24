package com.game.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.game.model.Note;
import com.game.model.Page;
import com.game.service.NoteService;
import com.game.util.PageUtils;

@Controller
public class NoteController {
	@Autowired
	private NoteService noteService;
	
	@RequestMapping("queryNoteBypage.do")
	public String queryNoteBypage(Note note,Page page,ModelMap model){
		page.setMaxRows(5);
		List<Note> list = noteService.queryByNote(note);
		page.setStart(PageUtils.getPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
		page.setTotalPage(PageUtils.getTotalPage(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
		List<Note> noteList = noteService.queryByList(page, note);
		model.put("page", page);
		model.put("noteList", noteList);
		model.put("note", note);
		return "behind/note_list";
	}
	
	@RequestMapping("addNote.do")
	public String addNote(Note note,HttpServletRequest request){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		note.setDate(sdf.format(new Date()));
		noteService.save(note);
		return "redirect:/queryNoteBypage.do";
	}
	
	
	@RequestMapping("editNote.do")
	public String editNote(Note note,ModelMap model){
		note = noteService.queryById(note.getId());
		model.put("note", note);
		return "behind/note_edit";
	}
	
	@RequestMapping("updateNote.do")
	public String updateNote(Note note,HttpServletRequest request){
		noteService.update(note);
		return "redirect:/queryNoteBypage.do";
	}
	
	@RequestMapping("deleteNoteByid.do")
	public String deleteNoteByid(Note note){
		noteService.deleteById(note.getId());
		return "redirect:/queryNoteBypage.do";
	}
}
